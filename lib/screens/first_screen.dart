import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';

class FirstScreen extends StatefulWidget {
  final TextEditingController textEditingController;
  final BarcodeService barcodeService;

  final void Function(BuildContext context, String? message)
      showSendPalletDialog;
  final void Function() chnageStateIsNewRelease;
  const FirstScreen({
    Key? key,
    required this.textEditingController,
    required this.barcodeService,
    required this.showSendPalletDialog,
    required this.chnageStateIsNewRelease,
  }) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController get _textEditingController =>
      widget.textEditingController;

  BarcodeService get barcodeService => widget.barcodeService;

  bool isShowDateInput = false;
  String numberCard = '';
  TextEditingController controllerForDateInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerForDateInput.addListener(() {
      final text = controllerForDateInput.text;
      final newText = text.replaceAll(
          RegExp(r'[^\d\.]'), ''); // Оставляем только цифры и точки
      final parts = newText.split('.');
      if (parts.length > 1) {
        final dayPart = parts[0];
        final monthPart = parts[1];
        final yearPart = parts.length > 2 ? parts[2] : '';
        if (dayPart.length > 2 || monthPart.length > 2 || yearPart.length > 4) {
          // Если части даты слишком длинные, обрезаем их
          final newDayPart = dayPart.substring(0, 2);
          final newMonthPart = monthPart.substring(0, 2);
          final newYearPart = yearPart.substring(0, 4);
          final result = '$newDayPart.$newMonthPart.$newYearPart';
          setState(() {
            controllerForDateInput.value =
                controllerForDateInput.value.copyWith(
              text: result,
              selection: TextSelection.collapsed(offset: result.length),
            );
          });
        } else if (monthPart.isNotEmpty) {
          // Добавляем точку после месяца
          final result = '$dayPart.$monthPart.${yearPart.substring(0, 4)}';
          setState(() {
            controllerForDateInput.value =
                controllerForDateInput.value.copyWith(
              text: result,
              selection: TextSelection.collapsed(offset: result.length),
            );
          });
        }
      } else if (newText != text) {
        // Если текст был изменен, устанавливаем новое значение в контроллер
        setState(() {
          controllerForDateInput.value = controllerForDateInput.value.copyWith(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    controllerForDateInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: isShowDateInput
              ? DateInputField()
              // TextFormField(
              //     controller: controllerForDateInput,
              //     keyboardType: TextInputType.number,
              //     autofocus: true,
              //     onFieldSubmitted: (value) async {
              //       try {
              //         await barcodeService.getInfoForBarcodeRealise(
              //             numberCard: numberCard);
              //         await barcodeService.getBarcodes();
              //         widget.chnageStateIsNewRelease();
              //       } catch (e) {
              //         final String message =
              //             e.toString().replaceAll('Exception: ', '');
              //         widget.showSendPalletDialog(context, message);
              //       }
              //     },
              //     // inputFormatters: [
              //     //   FilteringTextInputFormatter.allow(RegExp(r'[\d\.]')), // Разрешаем только числа и точки
              //     // ],
              //   )
              : TextFormField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  controller: _textEditingController,
                  onFieldSubmitted: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        numberCard = value;
                        isShowDateInput = true;
                      });
                    }
                  },
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            isShowDateInput
                ? 'Введите дату производства'
                : 'Введите номер карты, для получения данных!',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class DateInputField extends StatefulWidget {
  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text.replaceAll('.', '');
      if (text.isNotEmpty && text.length == 8) {
        final day = int.tryParse(text.substring(0, 2));
        final month = int.tryParse(text.substring(2, 4));
        final year = int.tryParse(text.substring(4, 8));
        if (day != null && month != null && year != null) {
          final date = DateTime(year, month, day);
          final formattedDate = '${date.day.toString().padLeft(2, '0')}.'
              '${date.month.toString().padLeft(2, '0')}.'
              '${date.year.toString()}';
          _controller.value = TextEditingValue(
            text: formattedDate,
            selection: TextSelection.collapsed(offset: formattedDate.length),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        _DateInputFormatter(),
      ],
      decoration: InputDecoration(
        hintText: 'дд.мм.гггг',
      ),
    );
  }
}

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String formattedDate = '';
    int selectionIndex = newValue.selection.baseOffset;

    final dateDigits = RegExp(r'\d+');

    final match = dateDigits.firstMatch(newValue.text);
    if (match != null) {
      final date = match.group(0);
      if (date!.length > 8) {
        return oldValue;
      }
      final day = date.length >= 2 ? date.substring(0, 2) + '.' : '';
      final month = date.length >= 4 ? date.substring(2, 4) + '.' : '';
      final year = date.length > 4 ? date.substring(4) : '';

      formattedDate = date.length >= 2
          ? date.length == 3
              ? '$day${date[2]}'
              : '$day$month$year'
          : '$date';

      selectionIndex += formattedDate.length - newValue.text.length;
    }

    return TextEditingValue(
      text: formattedDate,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

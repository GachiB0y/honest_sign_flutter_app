import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honest_sign_flutter_app/components/input_date_widget.dart';
import 'package:honest_sign_flutter_app/constants.dart';

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

  final TextEditingController _controller = TextEditingController();
  String _formattedText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            isShowDateInput
                ? 'Введите дату производства'
                : 'Введите номер карты, для получения данных!',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: isShowDateInput
              ? BaseDateTextFieldWidget(
                  controller: _controller,
                  formattedText: _formattedText,
                  callBack: onSubmitedAnGetInfoForBarcodeRelease,
                )
              // TextFormField(
              //     controller: controllerForDateInput,
              //     keyboardType: TextInputType.number,
              //     autofocus: true,
              //     onFieldSubmitted: (value) async {
              //       await onSubmitedAnGetInfoForBarcodeRealise(context);
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
      ],
    );
  }

  Future<void> onSubmitedAnGetInfoForBarcodeRelease(
      BuildContext context) async {
    try {
      // await barcodeService.getInfoForBarcodeRelease(numberCard: numberCard); // РАССКОМЕНТИРОВАТЬ В РЕЛИЗ ВЕРСИИ
      // await barcodeService.getBarcodes();
      widget.chnageStateIsNewRelease();
    } catch (e) {
      final String message = e.toString().replaceAll('Exception: ', '');
      widget.showSendPalletDialog(context, message);
    }
  }
}

// class DateTextFieldWidget extends StatefulWidget {
//   final TextEditingController controller;
//   String formattedText;
//   final Future<void> Function(BuildContext context)
//       onSubmitedAnGetInfoForBarcodeRealise;

//   DateTextFieldWidget(
//       {super.key,
//       required this.controller,
//       required this.formattedText,
//       required this.onSubmitedAnGetInfoForBarcodeRealise});
//   @override
//   _DateTextFieldWidgetState createState() => _DateTextFieldWidgetState();
// }

// class _DateTextFieldWidgetState extends State<DateTextFieldWidget> {
//   TextEditingController get _controller => widget.controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(_formatText);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _formatText() {
//     final input = _controller.text.replaceAll('.', '');
//     if (input.length > 8) {
//       _controller.text = input.substring(0, 8);
//     }
//     String formatted = '';

//     if (input.isNotEmpty) {
//       formatted = input.substring(0, input.length < 2 ? input.length : 2);
//     }
//     if (input.length > 2) {
//       formatted +=
//           '.' + input.substring(2, input.length < 4 ? input.length : 4);
//     }
//     if (input.length > 4) {
//       formatted +=
//           '.' + input.substring(4, input.length < 8 ? input.length : 8);
//     }

//     setState(() {
//       widget.formattedText = formatted;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       autofocus: true,
//       controller: _controller,
//       keyboardType: TextInputType.number,
//       decoration: const InputDecoration(
//         hintText: 'Введите дату (дд.мм.гггг)',
//       ),
//       maxLength: 10,
//       textAlign: TextAlign.center,
//       onChanged: (value) {
//         _formatText();
//         _controller.value = _controller.value.copyWith(
//           text: widget.formattedText,
//           selection: TextSelection.fromPosition(
//             TextPosition(offset: widget.formattedText.length),
//           ),
//         );
//       },
//       onSubmitted: (value) async {
//         await widget.onSubmitedAnGetInfoForBarcodeRealise(context);
//         dateOfRelease = value;
//       },
//     );
//   }
// }

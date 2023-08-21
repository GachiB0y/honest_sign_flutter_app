import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honest_sign_flutter_app/ui/components/input_date_widget.dart';
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
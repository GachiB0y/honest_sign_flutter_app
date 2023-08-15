import 'package:flutter/material.dart';

import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';

class FirstScreen extends StatefulWidget {
  final TextEditingController textEditingController;
  final BarcodeService barcodeService;

  void Function(BuildContext context, String? message) showSendPalletDialog;
  void Function() chnageStateIsNewRelease;
  FirstScreen({
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            autofocus: true,
            controller: _textEditingController,
            onFieldSubmitted: (value) async {
              try {
                await barcodeService.getInfoForBarcodeRealise(
                    numberCard: _textEditingController.text);
                await barcodeService.getBarcodes();
                widget.chnageStateIsNewRelease();
              } catch (e) {
                final String message =
                    e.toString().replaceAll('Exception: ', '');
                widget.showSendPalletDialog(context, message);
              }
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Введите номер карты, для получения данных!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

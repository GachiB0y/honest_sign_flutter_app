import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/ui/components/input_date_widget.dart';

import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/ui/screens/main_screen_copy.dart';

class FirstNewScreen extends StatefulWidget {
  const FirstNewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstNewScreen> createState() => _FirstNewScreenState();
}

class _FirstNewScreenState extends State<FirstNewScreen> {
  final TextEditingController textEditingController = TextEditingController();

  final BarcodeService barcodeService = const BarcodeServiceImpl();

  bool isShowDateInput = false;
  String numberCard = numberCardConst;

  TextEditingController _controller = TextEditingController();

  String _formattedText = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> _showSendPalletDialog(
    BuildContext context,
    String? message,
  ) async {
    await showDialog(
      barrierDismissible: false, //РАСКОМЕНТИРОВАТЬ В  РЕЛИЗЕ

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message == null
                    ? 'Палета отправлена успешно!'
                    : '$message Повторите попытку.',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                isShowDateInput
                    ? 'Введите дату производства'
                    : 'Введите номер карты Розлива, для получения данных!',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isShowDateInput
                  ? Column(
                      children: [
                        BaseDateTextFieldWidget(
                          controller: _controller,
                          formattedText: _formattedText,
                          callBack: onSubmitedAnGetInfoForBarcodeRelease,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                isShowDateInput = false;
                              });
                            },
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Назад')),
                      ],
                    )
                  : TextFormField(
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      controller: textEditingController,
                      onFieldSubmitted: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            numberCard = value;
                            numberCardConst = value;
                            isShowDateInput = true;
                          });
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSubmitedAnGetInfoForBarcodeRelease(
      BuildContext context) async {
    try {
      // await barcodeService.getInfoForBarcodeRelease(
      //     numberCard: numberCard); // РАССКОМЕНТИРОВАТЬ В РЕЛИЗ ВЕРСИИ

      // await barcodeService.getBarcodesBoxes();
      // await barcodeService.getBarcodesPallets();
      dateOfRelease = _controller.text;
      context.read<PalletsBloc>().add(const PalletsEvent.fetch());
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MainScreenCopy()));
    } catch (e) {
      final String message = e.toString().replaceAll('Exception: ', '');
      _showSendPalletDialog(context, message);
    }
  }
}

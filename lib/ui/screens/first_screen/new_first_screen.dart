import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/custom_provider.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_service.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/ui/components/custom_date_picker/custom_date_picker.dart';
import 'package:honest_sign_flutter_app/ui/components/custom_date_picker/custom_date_pikcer_model.dart';
import 'package:honest_sign_flutter_app/ui/components/valid_barcode_party.dart';
import 'package:honest_sign_flutter_app/ui/screens/main_screen/main_screen_copy.dart';
import 'package:intl/intl.dart';

class FirstNewScreen extends StatefulWidget {
  const FirstNewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstNewScreen> createState() => _FirstNewScreenState();
}

class _FirstNewScreenState extends State<FirstNewScreen> {
  final TextEditingController textEditingController = TextEditingController();

  final BarcodeService barcodeService = BarcodeServiceImpl(HTTPServiceImpl());

  bool isShowDateInput = false;
  String numberCard = numberCardConst;

  /// Используячется для ввода Партионного ШК после ввода даты.
  bool isPartyBarcodePallet = false;
  final _textControllerChangeBarcodeParty = TextEditingController();
  final _focusNodeChangeBarcodeParty = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // textEditingController.text = "989704"; // ЗАКОММЕНТИРОВАТЬ В РЕЛИЗЕ
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
    return BlocListener<PalletsBloc, PalletsState>(
      listener: (context, state) {
        if (state is PalletsStateLoaded) {
          if (state.isNewRelease!) {
            setState(() {
              isShowDateInput = true;
            });
          } else {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          'Продолжение розлива.\nПаллета №${state.listPallets.listModelsPallet.length}',
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(width: 16),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MainScreenCopy()));
                          },
                          child: const Text('OK')),
                    ],
                  ),
                );
              },
            );
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ChangeNotifierProvaider<CustomDatePickerModel>(
            model: CustomDatePickerModel(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isShowDateInput
                        ? isPartyBarcodePallet
                            ? 'Введите с белой этикетки партионный шк паллета, который БУДЕТЕ разливать.'
                            : 'Введите дату производства первой паллеты (которая указана на флаконе)'
                        : 'Введите номер карты Розлива, для получения данных!',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isShowDateInput
                      ? isPartyBarcodePallet
                          ? Form(
                              key: _formKey,
                              child: TextFormFieldBarcodeParty(
                                controller: _textControllerChangeBarcodeParty,
                                focusNode: _focusNodeChangeBarcodeParty,
                                onFieldSubmitted: (value) {
                                  if (_formKey.currentState!.validate()) {
                                    /// записываем значение Партионного ШК
                                    futureBarcodeParty = value;

                                    /// Меняем Партионный ШКу последнего паллета
                                    context.read<PalletsBloc>().add(
                                        PalletsEventChangeBarcodeParty(
                                            newBarcodeOfParty: value));

                                    /// Если с валидацией все ок, переходим на главный экран
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MainScreenCopy()));
                                  }
                                  _textControllerChangeBarcodeParty.clear();
                                },
                              ),
                            )
                          : Column(
                              children: [
                                const CustomDatePicker(),
                                ApproveButtonWidget(
                                  onSubmitedAnGetInfoForBarcodeRelease:
                                      onSubmitedAnGetInfoForBarcodeRelease,
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
                          // initialValue: textEditingController.text,
                          controller: textEditingController,
                          onFieldSubmitted: (value) async {
                            if (value.isNotEmpty) {
                              setState(() {
                                numberCard = value;
                                numberCardConst = value;
                                // isShowDateInput = true;
                              });
                              try {
                                await context
                                    .read<PalletsBloc>()
                                    .palletsRepository
                                    .getFreeCodes(); //Получаем агрегационные коды
                                await barcodeService.getInfoForBarcodeRelease(
                                    numberCard: numberCard);
                                //// РАССКОМЕНТИРОВАТЬ В РЕЛИЗ ВЕРСИИ
                                context.read<PalletsBloc>().add(PalletsEvent.fetch(
                                    numberCard:
                                        value)); // Достаем стейт или получаем новый
                              } catch (e) {
                                final String message =
                                    e.toString().replaceAll('Exception: ', '');
                                _showSendPalletDialog(context, message);
                              }
                            }
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSubmitedAnGetInfoForBarcodeRelease(
      {required BuildContext context, required String value}) async {
    try {
      /// Записываем новую дату в переменную
      dateOfRelease = value;

      /// Меняем дату и создаем список паллет
      context
          .read<PalletsBloc>()
          .add(PalletsEventChangeDateRelease(newDateOfRelease: value));

      /// Ставит в true для отображения TextField для ввода партионного ШК
      setState(() {
        isPartyBarcodePallet = true;
      });
    } catch (e) {
      final String message = e.toString().replaceAll('Exception: ', '');
      _showSendPalletDialog(context, message);
    }
  }
}

class ApproveButtonWidget extends StatelessWidget {
  final Future<void> Function(
      {required BuildContext context,
      required String value}) onSubmitedAnGetInfoForBarcodeRelease;

  const ApproveButtonWidget({
    super.key,
    required this.onSubmitedAnGetInfoForBarcodeRelease,
  });

  @override
  Widget build(BuildContext context) {
    final dateModel = ChangeNotifierProvaider.watch<
        ChangeNotifierProvaider<CustomDatePickerModel>,
        CustomDatePickerModel>(context);
    return ElevatedButton.icon(
        onPressed: () {
          if (dateModel?.selectedDate != null) {
            final newDate = DateFormat('dd.MM.yyyy')
                .format(dateModel?.selectedDate ?? DateTime.now());
            onSubmitedAnGetInfoForBarcodeRelease(
                context: context, value: newDate);
          }
        },
        icon: const Icon(Icons.check),
        label: const Text('Далее'));
  }
}

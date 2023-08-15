import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';

import 'package:intl/intl.dart';

enum TypeOfBarcode { unit, box, pallet, undefined }

enum TypeOfStateSend { duplicate, send, notSend, valid, notValid }

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late TextEditingController _textEditingController;

  final ScrollController _scrollController = ScrollController();
  final Set<String> allBarcodeHistory = {};
  final BarcodeService barcodeService = const BarcodeService();

  final List<Item> unit = [];
  int countBarcodes = 0;
  int countBox = 0;
  bool isNewRelease = true;
  bool isSendNotColpetePallet = false;
  bool isErrorSendPallet = false;
  bool isOpenAlertDialog = false;
  bool isShowError = false;
  bool _isLoading = false;

  final List<Box> boxes = [];

  final GlobalKey _alertDialogKey = GlobalKey();
  final GlobalKey _alertDialogKeyTwo = GlobalKey();

  final ModelsPallet pallets = ModelsPallet(
      barcode: 'Будущая палета',
      date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
      boxes: []);

  late InputWithKeyboardControlFocusNode myFocusNode;
  late InputWithKeyboardControlFocusNode myFocusNodeCheckBarcode =
      InputWithKeyboardControlFocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();

    myFocusNode = InputWithKeyboardControlFocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

  Future<void> _showDeleteDialog(
    BuildContext context,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Вы точно хотите удалить все текущие штрихкоды?',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                deleteCurrentUnitOrAllUnitsInBox(
                    deleteAll: true, lastBarcode: null);
                Navigator.pop(context); // закрыть Алерт диалог
              },
              child: const Text('Да'),
            ),
            ElevatedButton(
              onPressed: () {
                // Обработка нажатия кнопки "Отмена"
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSendPalletDialog(
    BuildContext context,
    String? message,
  ) async {
    await showDialog(
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
                  print('isOpenAlertDialog false $isOpenAlertDialog');
                  print('isErrorSendPallet true $isErrorSendPallet');
                  print('_isLoading false $_isLoading');

                  setState(() {
                    isOpenAlertDialog = false;
                  });
                  // Navigator.of(_alertDialogKeyTwo.currentContext!).pop();
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

  void showSnackBarForDuplicateBarcode(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Штрих код дублируется, отсканируйте другой штрихкод!',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> _showDialogChekBarcodeForPalletsOrBox(
      GlobalKey? keyForAlertDialog,
      {required BuildContext context,
      required bool checkValid,
      required bool isBox}) async {
    setState(() {
      isOpenAlertDialog = true;
    });

    await showDialog(
      // barrierDismissible: false, РАСКОМЕНТИРОВАТЬ В  РЕЛИЗЕ

      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            key: keyForAlertDialog ?? _alertDialogKey,
            elevation: 0.0,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isLoading
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Идеет отправка, пожалуйста подождите!'),
                          CircularProgressIndicator(),
                        ],
                      )
                    : Column(
                        children: [
                          if (isShowError)
                            const Text(
                              'Штрих код не найден. Отсканируйте штрихкод!',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                          Text(
                            isBox
                                ? 'Отсканируйте коробку!'
                                : 'Отсканируйте палету!',
                            style: const TextStyle(fontSize: 18),
                          ),
                          InputWithKeyboardControl(
                            focusNode: myFocusNodeCheckBarcode,
                            onSubmitted: (value) async {
                              final TypeOfStateSend isSend =
                                  await onSubmittedTextField(
                                      context: context, value: value);

                              if (isSend == TypeOfStateSend.send) {
                                if (isBox) {
                                  sendBoxAndOpenPalletDialog(context);
                                  setState(() {
                                    isShowError = false;
                                  });
                                } else {
                                  try {
                                    setState(() {
                                      _isLoading = true;
                                    });

                                    final bool isSendPallet =
                                        await barcodeService.postBarcodes(
                                            pallets: pallets);

                                    if (isSendPallet) {
                                      Navigator.of(context).pop();
                                      _showSendPalletDialog(context, null);
                                      setState(() {
                                        _isLoading = false;
                                        isOpenAlertDialog = false;
                                        pallets.barcode = 'Будущая палета';
                                        pallets.boxes = [];
                                        pallets.date = '';
                                        countBarcodes = 0;
                                        countBox = 0;
                                        _textEditingController.clear();
                                        isErrorSendPallet = false;
                                        boxes.clear();
                                        allBarcodeHistory.clear();

                                        isShowError = false;
                                      });
                                    }
                                  } catch (e) {
                                    setState(() {
                                      isErrorSendPallet = true;
                                      _isLoading = false;
                                      isOpenAlertDialog = false;
                                    });

                                    final String message = e
                                        .toString()
                                        .replaceAll('Exception: ', '');
                                    Navigator.pop(context);
                                    _showSendPalletDialog(context, message);
                                  }
                                }
                              } else if (isSend == TypeOfStateSend.duplicate) {
                                setState(() {
                                  isShowError = false;
                                });
                              } else if (isSend == TypeOfStateSend.notValid ||
                                  isSend == TypeOfStateSend.notSend) {
                                setState(() {
                                  isShowError = true;
                                });
                              }
                            },
                            autofocus: true,
                            controller: _textEditingController,
                            width: 300,
                            startShowKeyboard: false,
                            buttonColorEnabled: Colors.blue,
                            buttonColorDisabled: Colors.black,
                          ),
                        ],
                      ),
              ],
            ),
            actions: [
              if (checkValid)
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
        });
      },
    );
  }

  void sendBoxAndOpenPalletDialog(BuildContext context) {
    setState(() {
      isOpenAlertDialog = false;
    });
    Navigator.pop(context);
    if (countBarcodes % (countAllBarcodesPerPallet - 1) == 0 &&
        countBoxesPerPallet == countBox) {
      _showDialogChekBarcodeForPalletsOrBox(_alertDialogKeyTwo,
          checkValid: false, context: context, isBox: false);
      // _showDialogChekBarcodeForPallets(checkValid: false, context: context);
      // _showDialogChekBarcode(context, false, false);
    }
  }

  String createDateNow() {
    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat('dd.MM.yyyy HH:mm').format(now);
    return formattedDateTime;
  }

  void createBox(String item) {
    setState(() {
      String formattedDateTime = createDateNow();
      final List<Item> copyUnits = unit.sublist(0, unit.length - 1);
      boxes.add(Box(barcode: item, date: formattedDateTime, items: copyUnits));

      pallets.boxes = [...boxes];

      unit.clear();
    });
  }

  void createPallet(String text) {
    setState(() {
      String formattedDateTime = createDateNow();
      unit.clear();
      pallets.barcode = text;
      pallets.date = formattedDateTime;
    });
  }

  Future<bool> _sendText(
      {required String barcode, required TypeOfBarcode typeBarcode}) async {
    // setState(() {
    //   // myFocusNode.requestFocus(); //расскоментировать для обычного TExtFormField
    //   _textEditingController.clear();
    // });
    if (isErrorSendPallet) return false;

    String formattedDateTime = createDateNow();
    //проверка на наличие штрихкода еденицы, в полученном списке штрихкодов честного знака
    // bool isValid = isValidBarcode(barcode, TypeOfBarcode.unit);
    setState(() {
      unit.add(Item(barcode: barcode, date: formattedDateTime));
      countBarcodes += 1;
      allBarcodeHistory.add(barcode);
    });
    // проверка на отправку не полной палеты
    if (isSendNotColpetePallet && typeBarcode == TypeOfBarcode.pallet) {
      // isValid = isValidBarcode(barcode, TypeOfBarcode.pallet);
      // if (isValid) {
      createPallet(barcode);
      setState(() {
        isSendNotColpetePallet = false;
      });
      try {
        final bool isOk = await barcodeService.postBarcodes(pallets: pallets);
        if (isOk) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        setState(() {
          isErrorSendPallet = true;
        });
        final String message = e.toString().replaceAll('Exception: ', '');
        _showSendPalletDialog(context, message);

        return false;
      }
      // } else {
      //   deleteCurrentUnitOrAllUnitsInBox(
      //       deleteAll: false, lastBarcode: barcode);
      //   return false;
      //   // _showDialogChekBarcode(context, false, true);
      // }
    }

    // Проверка на палету
    if ((countBarcodes % (countAllBarcodesPerPallet) == 0)) {
      // isValid = isValidBarcode(barcode, TypeOfBarcode.pallet);
      // if (isValid) {
      if (typeBarcode == TypeOfBarcode.pallet) {
        createPallet(barcode);
        return true;
      } else {
        deleteCurrentUnitOrAllUnitsInBox(
            deleteAll: false, lastBarcode: barcode);
        return false;
      }

      // } else {
      //   deleteCurrentUnitOrAllUnitsInBox(
      //       deleteAll: false, lastBarcode: barcode);

      //   return false;
      //   // _showDialogChekBarcode(context, false, true);
      // }
    }

    // Проверка на коробку
    else if ((unit.length == (countUnitsPerBox + 1))) {
      // isValid = isValidBarcode(barcode, TypeOfBarcode.box);
      // if (isValid) {
      if (typeBarcode == TypeOfBarcode.box) {
        countBox += 1;
        createBox(barcode);

        return true;
      } else {
        deleteCurrentUnitOrAllUnitsInBox(
            deleteAll: false, lastBarcode: barcode);
        return false;
      }

      // } else {
      //   deleteCurrentUnitOrAllUnitsInBox(
      //       deleteAll: false, lastBarcode: barcode);

      //   return false;
      //   // _showDialogChekBarcode(context, false, true);
      // }
      //проверка на наличие штрихкода еденицы, в полученном списке штрихкодов честного знака
    } else {
      // if (isValid) {
      if (typeBarcode == TypeOfBarcode.unit) {
        if (unit.length == countUnitsPerBox) {
          _showDialogChekBarcodeForPalletsOrBox(null,
              checkValid: false, context: context, isBox: true);
          // _showDialogChekBarcodeForBox(
          //     checkValid: false,
          //     context:
          //         context); // Вызов окна скана коробки, сразу после скана последней штучки в коробке
        }
        return true;
      } else {
        deleteCurrentUnitOrAllUnitsInBox(
            deleteAll: false, lastBarcode: barcode);
        return false;
      }

      // } else {
      //   deleteCurrentUnitOrAllUnitsInBox(
      //       deleteAll: false, lastBarcode: barcode);
      //   return false;
      //   // _showDialogChekBarcode(context, false, true);
      // }
    }
  }

  // bool isValidBarcode(String text, TypeOfBarcode barcodeType) {
  //   switch (barcodeType) {
  //     case TypeOfBarcode.unit:
  //       return true; // ЗАГЛУШКА НА ВАЛИДАЦИЮ  ШТУЧКИ ПОКА НЕТ ИХ КОДОВ
  //     // final Set<String> setUnit = {'4630097264533', '99999997688990'};
  //     // if (setUnit.contains(text)) {
  //     //   return true;
  //     // } else {
  //     //   return false;
  //     // }

  //     case TypeOfBarcode.box:
  //       setBoxs = {'99999997688990'};
  //       if (setBoxs.contains(text)) {
  //         return true;
  //       } else {
  //         return false;
  //       }

  //     case TypeOfBarcode.pallet:
  //       setPallets = {'99999999389957'};
  //       if (setPallets.contains(text)) {
  //         return true;
  //       } else {
  //         return false;
  //       }

  //     case TypeOfBarcode.undefined:
  //       return false;
  //   }
  // }

  TypeOfBarcode isValidBarcode(String barcode) {
    bool isContains = setPallets.contains(barcode);
    if (isContains) {
      return TypeOfBarcode.pallet;
    } else {
      isContains = setBoxs.contains(barcode);
      if (isContains) {
        return TypeOfBarcode.box;
      } else {
        // isContains = setUnit.contains(
        //     barcode);
        isContains = true; // ЗАГЛУШКА НА ВАЛИДАЦИЮ  ШТУЧКИ ПОКА НЕТ ИХ КОДОВ
        if (isContains) {
          return TypeOfBarcode.unit;
        } else {
          return TypeOfBarcode.undefined;
        }
      }
    }
  }

  void deleteCurrentUnitOrAllUnitsInBox(
      {required bool deleteAll, required String? lastBarcode}) {
    setState(() {
      if (deleteAll) {
        if (unit.isNotEmpty) {
          countBarcodes -= unit.length;
          for (var element in unit) {
            allBarcodeHistory.remove(element.barcode);
          }
          unit.clear();
        }
      } else {
        countBarcodes -= 1;
        allBarcodeHistory.remove(lastBarcode);
        unit.removeLast();
      }
    });
  }

  bool checkDublicateBarcodeInPallet({required String barcode}) {
    if (barcode == '4630097264533')
      return false; // ЗАГЛУШКА НА ДУБЛИКАТ ШТУЧКИ, УБРАТЬ В РЕЛИЗЕ
    final bool isDuplicate = allBarcodeHistory.contains(barcode);
    return isDuplicate;
  }

  Future<TypeOfStateSend> onSubmittedTextField(
      {required String value, required BuildContext context}) async {
    setState(() {
      // myFocusNode.requestFocus(); //расскоментировать для обычного TExtFormField
      _textEditingController.clear();
    });
    final isDuplicate = checkDublicateBarcodeInPallet(barcode: value);
    if (isDuplicate) {
      setState(() {
        _textEditingController.clear();
      });
      showSnackBarForDuplicateBarcode(context);
      return TypeOfStateSend.duplicate;
    } else {
      final TypeOfBarcode typeBarcode = isValidBarcode(value);
      if (typeBarcode == TypeOfBarcode.undefined) {
        return TypeOfStateSend.notValid;
      } else {
        final bool isSend =
            await _sendText(barcode: value, typeBarcode: typeBarcode);
        if (isSend == true) {
          return TypeOfStateSend.send;
        } else {
          return TypeOfStateSend.notSend;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      isNewRelease =
          false; //Заглушка на код карточик разлицва ПОТОМ УБРАТЬ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    });

    return isNewRelease
        ? Column(
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
                      setState(() {
                        _textEditingController.clear();
                        isNewRelease = false;
                      });
                    } catch (e) {
                      final String message =
                          e.toString().replaceAll('Exception: ', '');
                      _showSendPalletDialog(context, message);
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
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!isOpenAlertDialog)
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child:

                        //  TextFormField(
                        //   focusNode: myFocusNode,
                        //   autofocus: true,
                        //   controller: _textEditingController,
                        //   onFieldSubmitted: (value) {
                        //     _sendText(value);
                        //   },
                        // ) // Для веб браузера, тк неь клавиатуры
                        InputWithKeyboardControl(
                      focusNode: myFocusNode,
                      onSubmitted: (String value) async {
                        await onSubmittedTextField(
                            context: context, value: value);
                      },
                      autofocus: true,
                      controller: _textEditingController,
                      width: 300,
                      startShowKeyboard: false,
                      buttonColorEnabled: Colors.blue,
                      buttonColorDisabled: Colors.black,
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      // myFocusNode.nextFocus();
                      _showDeleteDialog(context);
                      // /// ВЫЗОВ НОВГО СКРИНА НА УДАЛЕНИЕ
                      // final result = await Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DeleteScreen(
                      //       pallets: pallets,
                      //     ),
                      //   ),
                      // );
                      // // Обработка результата с нового экрана
                      // if (result != null) {}

                      // myFocusNode.requestFocus();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton.icon(
                      onPressed: () async {
                        // myFocusNode.nextFocus();

                        try {
                          // Проверка на отправку полной палеты
                          if (pallets.boxes.length == countBoxesPerPallet) {
                            final bool isOk = await barcodeService.postBarcodes(
                                pallets: pallets);
                            if (isOk) {
                              _showSendPalletDialog(context, null);
                              setState(() {
                                pallets.barcode = 'Будущая палета';
                                pallets.boxes = [];
                                pallets.date = '';
                                countBarcodes = 0;
                                countBox = 0;
                                isErrorSendPallet = false;
                                boxes.clear();
                              });
                            }
                          } else if (pallets.boxes.isNotEmpty) {
                            setState(() {
                              isSendNotColpetePallet = true;
                              isErrorSendPallet = false;
                            });
                            if (pallets.barcode == 'Будущая палета') {
                              _showDialogChekBarcodeForPalletsOrBox(null,
                                  checkValid: false,
                                  context: context,
                                  isBox: false);
                              // _showDialogChekBarcodeForPallets(
                              //     checkValid: false, context: context);
                            } else {
                              // _sendText(pallets.barcode);
                              await onSubmittedTextField(
                                  context: context, value: pallets.barcode);
                            }
                          } else {
                            _showSendPalletDialog(context,
                                'Нужна хотябы одна коробка для отправки палеты!');
                          }
                        } catch (e) {
                          setState(() {
                            isErrorSendPallet = true;
                          });
                          final String message =
                              e.toString().replaceAll('Exception: ', '');
                          _showSendPalletDialog(context, message);
                        }

                        myFocusNode.requestFocus();
                      },
                      icon: const Icon(Icons.call_made, color: Colors.green),
                      label: const Text('Отправить палету')),
                ],
              ),
              TwoTabWidget(
                pallets: pallets,
                deleteCurrentUnit: deleteCurrentUnitOrAllUnitsInBox,
                scrollController: _scrollController,
                unit: unit,
              ),
            ],
          );
  }
}

class InputWithKeyboardControl extends EditableText {
  /// startShowKeyboard is initial value to show or not the keyboard when the widget is created, default value is false
  final bool startShowKeyboard;

  /// focusNode is responsible for controlling the focus of the field, this parameter is required
  final InputWithKeyboardControlFocusNode focusNode;

  /// width is responsible for set the widget size, This parameter is required
  final double width;

  /// buttonColorEnabled is responsible for set color in button when is enabled, default value is Colors.blue
  final Color buttonColorEnabled;

  /// buttonColorDisabled is responsible for set color in button when is disabled, default value is Colors.black
  final Color buttonColorDisabled;

  InputWithKeyboardControl({
    super.key,
    required TextEditingController controller,
    TextStyle style = const TextStyle(color: Colors.black, fontSize: 18),
    Color cursorColor = Colors.black,
    bool autofocus = false,
    Color? selectionColor,
    this.startShowKeyboard = false,
    void Function(String)? onSubmitted,
    required this.focusNode,
    required this.width,
    this.buttonColorEnabled = Colors.blue,
    this.buttonColorDisabled = Colors.black,
  }) : super(
          controller: controller,
          focusNode: focusNode,
          style: style,
          cursorColor: cursorColor,
          autofocus: autofocus,
          selectionColor: selectionColor,
          backgroundCursorColor: Colors.black,
          onSubmitted: onSubmitted,
        );

  @override
  EditableTextState createState() {
    return InputWithKeyboardControlState(
      startShowKeyboard,
      focusNode,
      width,
      buttonColorEnabled,
      buttonColorDisabled,
    );
  }
}

class InputWithKeyboardControlState extends EditableTextState {
  /// showKeyboard is initial value to show or not the keyboard when the widget is created, default value is false
  bool showKeyboard;

  /// focusNode is responsible for controlling the focus of the field, this parameter is required
  final InputWithKeyboardControlFocusNode focusNode;

  /// width is responsible for set the widget size, This parameter is required
  final double width;

  /// buttonColorEnabled is responsible for set color in button when is enabled, default value is Colors.blue
  final Color buttonColorEnabled;

  /// buttonColorDisabled is responsible for set color in button when is disabled, default value is Colors.black
  final Color buttonColorDisabled;

  // funcionListener is responsible for controller focusNode listener
  late Function funcionListener;

  @override
  void initState() {
    funcionListener = () {
      requestKeyboard();
    };

    focusNode.addListener(funcionListener as void Function());
    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(funcionListener as void Function());
    super.dispose();
  }

  InputWithKeyboardControlState(
    this.showKeyboard,
    this.focusNode,
    this.width,
    this.buttonColorEnabled,
    this.buttonColorDisabled,
  );

  @override
  Widget build(BuildContext context) {
    Widget widget = super.build(context);
    return SizedBox(
      width: width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(child: widget),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void requestKeyboard() {
    super.requestKeyboard();

    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}

class InputWithKeyboardControlFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.barcode),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final Box box;

  const BoxWidget({
    super.key,
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(box.barcode),
      children: <Widget>[
        ListTile(
          title: const Text('Бутылки:'),
          subtitle: Column(
            children: box.items
                .map((item) => ItemWidget(
                      item: item,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class ModelsPalletWidget extends StatelessWidget {
  final ModelsPallet pallet;

  const ModelsPalletWidget({super.key, required this.pallet});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(pallet.barcode),
      children: <Widget>[
        ListTile(
          title: const Text('Коробки:'),
          subtitle: Column(
            children: pallet.boxes
                .map((box) => BoxWidget(
                      box: box,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class TwoTabWidget extends StatelessWidget {
  final ModelsPallet pallets;
  final ScrollController scrollController;
  final List<Item> unit;
  final Function({required bool deleteAll, required String lastBarcode})
      deleteCurrentUnit;

  const TwoTabWidget(
      {super.key,
      required this.pallets,
      required this.scrollController,
      required this.unit,
      required this.deleteCurrentUnit});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Expanded(
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Текущие бутылки'),
                Tab(text: 'История'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Виджеты для первой вкладки
                  CurrentHistoryWidget(
                    deleteCurrentUnit: deleteCurrentUnit,
                    scrollController: scrollController,
                    unit: unit,
                  ),
                  // Виджеты для второй вкладки
                  SingleChildScrollView(
                    child: ModelsPalletWidget(
                      pallet: pallets,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentHistoryWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<Item> unit;
  final Function({required bool deleteAll, required String lastBarcode})
      deleteCurrentUnit;

  const CurrentHistoryWidget(
      {super.key,
      required this.scrollController,
      required this.unit,
      required this.deleteCurrentUnit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.5,
      child: ListView.builder(
        controller: scrollController,
        itemCount: unit.length,
        itemBuilder: (BuildContext context, int index) {
          // scrollController.jumpTo(scrollController.position
          //     .maxScrollExtent); //  авто скролл  на последний элемент при добавлении его в список
          return ListTile(
              title: Text(
                '${index + 1}. Бутылка ${index + 1}.',
                style: const TextStyle(fontSize: 18),
              ),
              trailing: index + 1 == unit.length
                  ? IconButton(
                      onPressed: () {
                        deleteCurrentUnit(
                            deleteAll: false, lastBarcode: unit[index].barcode);
                      },
                      icon: const Icon(Icons.close),
                      color: Colors.red,
                    )
                  : null);
        },
      ),
    );
  }
}

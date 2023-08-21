import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honest_sign_flutter_app/components/custom_snack_bar.dart';
import 'package:honest_sign_flutter_app/components/input_date_widget.dart';
import 'package:honest_sign_flutter_app/components/input_with_keyboard_control.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';
import 'package:honest_sign_flutter_app/screens/first_screen.dart';
import 'package:honest_sign_flutter_app/screens/refactor_box_screen.dart';

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
  late TextEditingController _controllerForAlertChangeDateRelease;

  final ScrollController _scrollController = ScrollController();

  final BarcodeService barcodeService = const BarcodeService();

  final Set<String> allBarcodeHistory = {};
  final List<Item> unit = [];
  final List<Box> boxes = [];
  int countBarcodes = 0;
  int countBox = 0;
  bool isNewRelease = true;
  bool isSendNotColpetePallet = false;
  bool isErrorSendPallet = false;
  bool isOpenAlertDialog = false;
  bool isShowError = false;
  bool _isLoading = false;

  final GlobalKey _alertDialogKey = GlobalKey();
  final GlobalKey _alertDialogKeyTwo = GlobalKey();

  final ModelsPallet pallets = ModelsPallet(
      barcode: 'Будущая палета',
      date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
      boxes: [],
      dateRelease: '');

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
                  setState(() {
                    isOpenAlertDialog = false;
                  });

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
      barrierColor: const Color(0x01000000),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            key: keyForAlertDialog ?? _alertDialogKey,
            elevation: 5.0,
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
    }
  }

  Future<void> _showAlertDialogChangeDateRelease(BuildContext context) async {
    bool _showTextField = false;

    final String formattedText = dateOfRelease;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            content: _showTextField
                ? BaseDateTextFieldWidget(
                    callBack: null,
                    controller: _controllerForAlertChangeDateRelease,
                    formattedText: formattedText,
                  )
                : Text(
                    'Дата производства $dateOfRelease. Вы уверены?',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
            actions: _showTextField
                ? <Widget>[
                    Center(
                      child: TextButton(
                        child: const Text(
                          'Подтвердить',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            dateOfRelease =
                                _controllerForAlertChangeDateRelease.text;
                            pallets.dateRelease = dateOfRelease;

                            _showTextField = false;
                            print(' pallets${pallets.dateRelease}');
                            pallets.boxes.forEach((element) {});
                          });
                        },
                      ),
                    )
                  ]
                : <Widget>[
                    Center(
                      child: TextButton(
                        child: const Text(
                          'Нет',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            _controllerForAlertChangeDateRelease =
                                TextEditingController();
                            _showTextField = true;
                            isOpenAlertDialog = true;
                          });
                        },
                      ),
                    ),
                    Center(
                      child: TextButton(
                        child: const Text(
                          'Да',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            isOpenAlertDialog = false;
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                    ),
                  ],
          );
        });
      },
    ).then((value) => setState(() {
          isOpenAlertDialog = false;
        }));
  }

  void createBox(String item) {
    setState(() {
      String formattedDateTime = createDateNow();
      final List<Item> copyUnits = unit.sublist(0, unit.length - 1);
      final Box box = Box(
        barcode: item,
        date: formattedDateTime,
        items: copyUnits,
      );

      boxes.add(box);

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
      pallets.dateRelease = dateOfRelease;
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

    setState(() {
      final Item item = Item(
        barcode: barcode,
        date: formattedDateTime,
      );

      unit.add(item);
      countBarcodes += 1;
      allBarcodeHistory.add(barcode);
    });
    // проверка на отправку не полной палеты
    if (isSendNotColpetePallet) {
      if (typeBarcode == TypeOfBarcode.pallet) {
        setState(() {
          isSendNotColpetePallet = false;
        });
        createPallet(barcode);
        return true;
      } else {
        deleteCurrentUnitOrAllUnitsInBox(
            deleteAll: false, lastBarcode: barcode);
        return false;
      }
    }

    // Проверка на палету
    if ((countBarcodes % (countAllBarcodesPerPallet) == 0)) {
      if (typeBarcode == TypeOfBarcode.pallet) {
        createPallet(barcode);
        return true;
      } else {
        deleteCurrentUnitOrAllUnitsInBox(
            deleteAll: false, lastBarcode: barcode);
        return false;
      }
    }

    // Проверка на коробку
    else if ((unit.length == (countUnitsPerBox + 1))) {
      if (typeBarcode == TypeOfBarcode.box) {
        countBox += 1;
        createBox(barcode);

        return true;
      } else {
        deleteCurrentUnitOrAllUnitsInBox(
            deleteAll: false, lastBarcode: barcode);
        return false;
      }

      //проверка на наличие штрихкода еденицы, в полученном списке штрихкодов честного знака
    } else {
      if (typeBarcode == TypeOfBarcode.unit) {
        if (unit.length == countUnitsPerBox) {
          _showDialogChekBarcodeForPalletsOrBox(null,
              checkValid: false,
              context: context,
              isBox:
                  true); // Вызов окна скана коробки, сразу после скана последней штучки в коробке
        }
        return true;
      } else {
        deleteCurrentUnitOrAllUnitsInBox(
            deleteAll: false, lastBarcode: barcode);
        return false;
      }
    }
  }

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

  void deleteBox(int indexBox) {
    setState(() {
      boxes.removeAt(indexBox);
      countBarcodes -= countUnitsPerBox + 1;
      countBox -= 1;
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
      CustomSnackBar.showSnackBarForDuplicateBarcode(context);

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

  void chnageStateIsNewRelease() {
    setState(() {
      _textEditingController.clear();
      isNewRelease = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   isNewRelease =
    //       false; //Заглушка на код карточик разлицва ПОТОМ УБРАТЬ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // });

    return isNewRelease
        ? FirstScreen(
            textEditingController: _textEditingController,
            barcodeService: barcodeService,
            showSendPalletDialog: _showSendPalletDialog,
            chnageStateIsNewRelease: chnageStateIsNewRelease,
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
                      _showDeleteDialog(context);
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
                        if (pallets.boxes.isNotEmpty) {
                          setState(() {
                            isOpenAlertDialog = true;
                          });
                          await _showAlertDialogChangeDateRelease(context);
                        }
                        try {
                          // Проверка на отправку полной палеты
                          if (pallets.boxes.length == countBoxesPerPallet ||
                              pallets.barcode != 'Будущая палета') {
                            final bool isSendPallet = await barcodeService
                                .postBarcodes(pallets: pallets);
                            if (isSendPallet) {
                              _showSendPalletDialog(context, null);
                              setState(() {
                                pallets.barcode = 'Будущая палета';
                                pallets.boxes = [];
                                pallets.date = '';
                                countBarcodes = 0;
                                countBox = 0;
                                isErrorSendPallet = false;
                                boxes.clear();
                                allBarcodeHistory.clear();
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
                              // await onSubmittedTextField(
                              //     context: context, value: pallets.barcode);
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
                allBarcodeHistory: allBarcodeHistory,
                deleteBox: deleteBox,
                myFocusNode: myFocusNode,
                checkDublicateBarcodeInPallet: checkDublicateBarcodeInPallet,
              ),
            ],
          );
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

class BoxWidget extends StatefulWidget {
  final Box box;

  final ModelsPallet pallet;
  final Set<String> allBarcodeHistory;
  final void Function(int indexBox) deleteBox;
  final InputWithKeyboardControlFocusNode myFocusNode;
  final bool Function({required String barcode}) checkDublicateBarcodeInPallet;

  const BoxWidget({
    super.key,
    required this.box,
    required this.pallet,
    required this.allBarcodeHistory,
    required this.deleteBox,
    required this.myFocusNode,
    required this.checkDublicateBarcodeInPallet,
  });

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return ExpansionTile(
        title: Row(
          children: [
            Text(widget.box.barcode),
            const Spacer(),
            IconButton(
                onPressed: () async {
                  widget.myFocusNode.nextFocus();

                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RefactorBoxScreen(
                        pallets: widget.pallet,
                        box: widget.box,
                        allBarcodeHistory: widget.allBarcodeHistory,
                        checkDublicateBarcodeInPallet:
                            widget.checkDublicateBarcodeInPallet,
                      ),
                    ),
                  );
                  widget.myFocusNode.requestFocus();

                  // Обработка результата с нового экрана
                  if (result != null) {
                    final res = result['isDeleteBox'];
                    final int indexBox = int.parse(result['indexBox']);

                    if (result['isDeleteBox'] == "true") {
                      widget.deleteBox(indexBox);
                    }
                    setState(() {});
                    print(result);
                  }
                },
                icon: const Icon(Icons.edit)),
          ],
        ),
        children: <Widget>[
          ListTile(
            title: const Text('Бутылки:'),
            subtitle: Column(
              children: widget.box.items
                  .map((item) => ItemWidget(
                        item: item,
                      ))
                  .toList(),
            ),
          ),
        ],
      );
    });
  }
}

class ModelsPalletWidget extends StatelessWidget {
  final ModelsPallet pallet;
  final Set<String> allBarcodeHistory;
  final InputWithKeyboardControlFocusNode myFocusNode;
  final bool Function({required String barcode}) checkDublicateBarcodeInPallet;

  final void Function(int indexBox) deleteBox;

  const ModelsPalletWidget(
      {super.key,
      required this.pallet,
      required this.allBarcodeHistory,
      required this.deleteBox,
      required this.myFocusNode,
      required this.checkDublicateBarcodeInPallet});

  @override
  Widget build(BuildContext context) {
    final String partNamePallet =
        pallet.boxes.length == countBoxesPerPallet ? '' : '(неполная палета)';
    final String namePalletInHistory =
        'Палета $partNamePallet ${pallet.boxes.length}/${countBoxesPerPallet}';
    return ExpansionTile(
      title: Text(namePalletInHistory),
      children: <Widget>[
        ListTile(
          title: const Text('Коробки:'),
          subtitle: Column(
            children: pallet.boxes
                .map((box) => BoxWidget(
                      box: box,
                      pallet: pallet,
                      allBarcodeHistory: allBarcodeHistory,
                      deleteBox: deleteBox,
                      myFocusNode: myFocusNode,
                      checkDublicateBarcodeInPallet:
                          checkDublicateBarcodeInPallet,
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
  final Set<String> allBarcodeHistory;
  final InputWithKeyboardControlFocusNode myFocusNode;
  final bool Function({required String barcode}) checkDublicateBarcodeInPallet;

  final void Function(int indexBox) deleteBox;

  final ScrollController scrollController;
  final List<Item> unit;
  final Function({required bool deleteAll, required String lastBarcode})
      deleteCurrentUnit;

  const TwoTabWidget(
      {super.key,
      required this.pallets,
      required this.scrollController,
      required this.unit,
      required this.deleteCurrentUnit,
      required this.allBarcodeHistory,
      required this.deleteBox,
      required this.myFocusNode,
      required this.checkDublicateBarcodeInPallet});
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
                      allBarcodeHistory: allBarcodeHistory,
                      deleteBox: deleteBox,
                      myFocusNode: myFocusNode,
                      checkDublicateBarcodeInPallet:
                          checkDublicateBarcodeInPallet,
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

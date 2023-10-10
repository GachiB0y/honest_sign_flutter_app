import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/blocs/search_barcode_bloc/search_barcode_bloc.dart';
import 'package:honest_sign_flutter_app/ui/components/custom_snack_bar_dublicate.dart';
import 'package:honest_sign_flutter_app/ui/components/input_date_widget.dart';
import 'package:honest_sign_flutter_app/ui/components/input_with_keyboard_control.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';
import 'package:honest_sign_flutter_app/ui/screens/new_refactor_box_screen.dart';

enum TypeOfBarcode { unit, box, pallet, undefined }

enum TypeOfStateSend { duplicate, send, notSend, valid, notValid, errorTimeout }

class MainScreenCopy extends StatefulWidget {
  const MainScreenCopy({super.key});

  @override
  _MainScreenCopyState createState() => _MainScreenCopyState();
}

class _MainScreenCopyState extends State<MainScreenCopy> {
  late TextEditingController _textEditingController;
  late TextEditingController _controllerForAlertChangeDateRelease;

  final ScrollController _scrollController = ScrollController();

  bool isSendNotColpetePallet = false;
  bool isErrorSendPallet = false;
  bool isOpenAlertDialog = false;
  bool isShowError = false;
  bool _isLoading = false;

  final GlobalKey _alertDialogKey = GlobalKey();
  final GlobalKey _alertDialogKeyTwo = GlobalKey();

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

  Future<void> _showDeleteDialog({required BuildContext context}) async {
    await showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final PalletsBloc blocPallet = context.read<PalletsBloc>();
        return WillPopScope(
          onWillPop: () async {
            // Возвращаем `false` для предотвращения закрытия диалогового окна
            return false;
          },
          child: AlertDialog(
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
                  blocPallet.add(const PalletsEventClearAllCurrentUnits());

                  Navigator.pop(dialogContext); // закрыть Алерт диалог
                },
                child: const Text('Да'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Обработка нажатия кнопки "Отмена"
                  Navigator.pop(dialogContext);
                },
                child: const Text('Отмена'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showSendPalletDialog(
    BuildContext context,
    String? message,
  ) async {
    await showDialog(
      barrierDismissible: false, //РАСКОМЕНТИРОВАТЬ В  РЕЛИЗЕ

      context: context,
      builder: (BuildContext dialogContext) {
        return WillPopScope(
          onWillPop: () async {
            // Возвращаем `false` для предотвращения закрытия диалогового окна
            return false;
          },
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message == null
                      ? 'Палета отправлена!'
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

                    Navigator.pop(dialogContext);
                  },
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showDialogChekBarcodeForPalletsOrBox(
    GlobalKey? keyForAlertDialog, {
    required BuildContext context,
    required bool isCompeleteBottling,
    required bool isBox,
  }) async {
    setState(() {
      isOpenAlertDialog = true;
    });

    await showDialog(
      barrierDismissible: false, //РАСКОМЕНТИРОВАТЬ В  РЕЛИЗЕ
      barrierColor: const Color(0x01000000),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          final PalletsBloc blocPallet = context.read<PalletsBloc>();
          return WillPopScope(
            onWillPop: () async {
              // Возвращаем `false` для предотвращения закрытия диалогового окна
              return false;
            },
            child: AlertDialog(
              backgroundColor: Colors.grey[200],
              key: keyForAlertDialog ?? _alertDialogKey,
              elevation: 3.0,
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
                              Column(
                                children: [
                                  const Text(
                                    'Штрих код не найден. Отсканируйте штрихкод!',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await context
                                          .read<PalletsBloc>()
                                          .palletsRepository
                                          .getFreeCodes(); //Получаем агрегационные коды
                                      setState(() {
                                        isShowError = false;
                                      });
                                    },
                                    child: const Text(
                                      'Проверить коды',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 150,
                              child: Text(
                                isBox
                                    ? 'Отсканируйте\n КОРОБКУ!'
                                    : 'Отсканируйте\n ПАЛЛЕТ!',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                            InputWithKeyboardControl(
                              focusNode: myFocusNodeCheckBarcode,
                              onSubmitted: (value) async {
                                try {
                                  final TypeOfStateSend isSend =
                                      await onSubmittedTextField(
                                    context: context,
                                    value: value,
                                  );

                                  if (isSend == TypeOfStateSend.send ||
                                      isSend == TypeOfStateSend.errorTimeout) {
                                    if (isBox) {
                                      sendBoxAndOpenPalletDialog(
                                        context: context,
                                      );
                                      setState(() {
                                        isShowError = false;
                                      });
                                    } else {
                                      try {
                                        setState(() {
                                          _isLoading = true;
                                        });
// Если это завершение розлива, то не надо отправлять паллеты.
                                        if (!isCompeleteBottling) {
                                          await _showAlertDialogChangeDateRelease(
                                              context: context);

                                          blocPallet.add(
                                              const PalletsEventSendBarcodes());
                                          //  ОТПРАВКA ПАЛЛЕТ.
                                        }

                                        Navigator.of(context).pop();
                                        // _showSendPalletDialog(context, null);

                                        setState(() {
                                          _isLoading = false;
                                          isOpenAlertDialog = false;
                                          _textEditingController.clear();
                                          isErrorSendPallet = false;
                                          isShowError = false;
                                        });
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
                                  } else if (isSend ==
                                      TypeOfStateSend.duplicate) {
                                    setState(() {
                                      isShowError = false;
                                    });
                                  } else if (isSend ==
                                          TypeOfStateSend.notValid ||
                                      isSend == TypeOfStateSend.notSend) {
                                    setState(() {
                                      isShowError = true;
                                    });
                                  }
                                } catch (e) {
                                  Navigator.pop(context);
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
            ),
          );
        });
      },
    );
  }

  void sendBoxAndOpenPalletDialog({
    required BuildContext context,
  }) {
    setState(() {
      isOpenAlertDialog = false;
    });
    Navigator.pop(context);
    final PalletsBloc blocPallet = context.read<PalletsBloc>();

    if ((blocPallet.state as PalletsStateLoaded).countBarcodes %
                (countAllBarcodesPerPallet - 1) ==
            0 &&
        countBoxesPerPallet ==
            (blocPallet.state as PalletsStateLoaded).countBox) {
      setState(() {
        isOpenAlertDialog = true;
      });

      _showDialogChekBarcodeForPalletsOrBox(
        _alertDialogKeyTwo,
        isCompeleteBottling: false,
        context: context,
        isBox: false,
      );
    }
  }

  Future<void> _showAlertDialogChangeDateRelease({
    required BuildContext context,
  }) async {
    bool showTextField = false;

    return showDialog<void>(
      barrierDismissible: false, //РАСКОМЕНТИРОВАТЬ В  РЕЛИЗЕ

      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          final PalletsBloc blocPallet = context.read<PalletsBloc>();
          return WillPopScope(
            onWillPop: () async {
              // Возвращаем `false` для предотвращения закрытия диалогового окна
              return false;
            },
            child: AlertDialog(
              elevation: 3.0,
              content: showTextField
                  ? TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      controller: _controllerForAlertChangeDateRelease,
                      decoration: const InputDecoration(
                        hintText: 'Введите дату (дд.мм.гггг)',
                      ),
                      inputFormatters: [DateTextFormatter()],
                    )
                  // DateInputTextField(
                  //     callBack: null,
                  //     controller: _controllerForAlertChangeDateRelease,
                  //     formattedText: formattedText,
                  //   )
                  : Text(
                      'Дата розлива следующей паллеты: $dateOfRelease. Вы уверены?',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
              actions: showTextField
                  ? <Widget>[
                      Center(
                        child: TextButton(
                          child: const Text(
                            'Подтвердить',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            dateOfRelease =
                                _controllerForAlertChangeDateRelease.text;
                            blocPallet.add(PalletsEventChangeDateRelease(
                                newDateOfRelease:
                                    _controllerForAlertChangeDateRelease.text));

                            setState(() {
                              showTextField = false;
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
                              showTextField = true;
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
            ),
          );
        });
      },
    ).then((value) => setState(() {
          isOpenAlertDialog = false;
        }));
  }

  Future<bool> _sendText({
    required String barcode,
    required TypeOfBarcode typeBarcode,
  }) async {
    // setState(() {
    //   // myFocusNode.requestFocus(); //расскоментировать для обычного TExtFormField
    //   _textEditingController.clear();
    // });
    if (isErrorSendPallet) return false;

    final PalletsBloc blocPallet = context.read<PalletsBloc>();
    final statePalletsBloc = blocPallet.state as PalletsStateLoaded;

    // Проверка на отправку не полной палеты
    if (isSendNotColpetePallet) {
      if (typeBarcode == TypeOfBarcode.pallet) {
        setState(() {
          isSendNotColpetePallet = false;
        });

        blocPallet.add(PalletsEvent.createPallet(barcode: barcode));
        return true;
      } else {
        return false;
      }
    }

    // Проверка на палету
    if (typeBarcode == TypeOfBarcode.pallet) {
      if ((statePalletsBloc.countBarcodes % (countAllBarcodesPerPallet - 1) ==
          0)) {
        blocPallet.add(PalletsEvent.createPallet(barcode: barcode));

        return true;
      } else {
        return false;
      }
    }

    // Проверка на коробку
    else if ((statePalletsBloc.units.length == (countUnitsPerBox))) {
      if (typeBarcode == TypeOfBarcode.box) {
        // bloc.createBox(item: barcode);

        blocPallet.add(PalletsEvent.createBox(barcode: barcode));
        return true;
      } else {
        return false;
      }

      // Проверка на наличие штрихкода еденицы, в полученном списке штрихкодов честного знака
    } else {
      if (typeBarcode == TypeOfBarcode.unit) {
        if (statePalletsBloc.units.length == countUnitsPerBox - 1) {
          _showDialogChekBarcodeForPalletsOrBox(
            null,
            isCompeleteBottling: false,
            context: context,
            isBox: true,
          ); // Вызов окна скана коробки, сразу после скана последней штучки в коробке
        }
        blocPallet.add(PalletsEvent.createUnit(barcode: barcode));

        return true;
      } else {
        return false;
      }
    }
  }

  // TypeOfBarcode isValidBarcode(String barcode) {
  //   bool isContains = setPallets.contains(barcode);
  //   if (isContains) {
  //     return TypeOfBarcode.pallet;
  //   } else {
  //     isContains = setBoxs.contains(barcode);
  //     if (isContains) {
  //       return TypeOfBarcode.box;
  //     } else {
  //       // isContains = setUnit.contains(
  //       //     barcode);
  //       // ЗАГЛУШКА НА ВАЛИДАЦИЮ  ШТУЧКИ ПОКА НЕТ ИХ КОДОВ
  //       if (barcode.length >= 37) {
  //         return TypeOfBarcode.unit;
  //       } else {
  //         return TypeOfBarcode.undefined;
  //       }
  //     }
  //   }
  // }
  // ЗАГЛУШКА НА ПРОВЕРКУ АГРЕГАЦИОННОГО КОДА ЗАКОММЕНТИТЬ В РЕЛИЗЕ

  TypeOfBarcode isValidBarcode(String barcode) {
    if (barcode.length == 18 && barcode.startsWith('1')) {
      return TypeOfBarcode.pallet;
    } else {
      if (barcode.length == 18 && barcode.startsWith('0')) {
        return TypeOfBarcode.box;
      } else {
        if (barcode.length >= 37) {
          return TypeOfBarcode.unit;
        } else {
          return TypeOfBarcode.undefined;
        }
      }
    }
  }

  bool checkDublicateBarcodeInPallet({required String barcode}) {
    final PalletsBloc blocPallet = context.read<PalletsBloc>();
    final bool isDuplicate = (blocPallet.state as PalletsStateLoaded)
        .allBarcodeHistory
        .contains(barcode);
    return isDuplicate;
  }

  Future<TypeOfStateSend> onSubmittedTextField({
    required String value,
    required BuildContext context,
  }) async {
    setState(() {
      // myFocusNode.requestFocus(); //расскоментировать для обычного TExtFormField
      _textEditingController.clear();
    });
    final isDuplicate = checkDublicateBarcodeInPallet(barcode: value);
    if (isDuplicate) {
      CustomSnackBarDudlicateBarcode.showSnackBarForDuplicateBarcode(context);

      return TypeOfStateSend.duplicate;
    } else {
      final TypeOfBarcode typeBarcode = isValidBarcode(value);
      if (typeBarcode == TypeOfBarcode.undefined) {
        return TypeOfStateSend.notValid;
      } else {
        try {
          final bool isSend = await _sendText(
            barcode: value,
            typeBarcode: typeBarcode,
          );
          if (isSend == true) {
            return TypeOfStateSend.send;
          } else {
            return TypeOfStateSend.notSend;
          }
        } catch (e) {
          return TypeOfStateSend.errorTimeout;
        }
      }
    }
  }

  int calculateTotalItemCount(ListPallets listPallets) {
    int totalCount = 0;
    for (var modelsPallet in listPallets.listModelsPallet) {
      for (var box in modelsPallet.boxes) {
        totalCount += box.items.length;
      }
    }
    return totalCount;
  }

  @override
  Widget build(BuildContext context) {
    final PalletsBloc blocPallet = context.read<PalletsBloc>();

    return BlocListener<PalletsBloc, PalletsState>(
      listener: (context, state) {
        if (state is PalletsStateCloseApp) {
          SystemNavigator.pop();
        } else if (state is PalletsStateLoaded) {
          if (state.isLoading != null && state.isLoading == true) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return WillPopScope(
                  onWillPop: () async {
                    // Возвращаем `false` для предотвращения закрытия диалогового окна
                    return false;
                  },
                  child: const AlertDialog(
                    content: Row(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 16),
                        Text("Идет отправка...",
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (state.errorText != null && state.errorText!.length > 6) {
            Navigator.pop(context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return WillPopScope(
                  onWillPop: () async {
                    // Возвращаем `false` для предотвращения закрытия диалогового окна
                    return false;
                  },
                  child: AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.errorText!,
                            style: const TextStyle(fontSize: 18)),
                        const SizedBox(width: 16),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK')),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
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
                          context: context,
                          value: value,
                        );
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
                      _showDeleteDialog(
                        context: context,
                      );
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
                        final stateBlocPallet =
                            blocPallet.state as PalletsStateLoaded;
                        try {
                          // Проверка на отправку полной палеты
                          if (stateBlocPallet.listPallets.listModelsPallet.last
                                      .boxes.length ==
                                  countBoxesPerPallet ||
                              stateBlocPallet.listPallets.listModelsPallet.last
                                      .barcode !=
                                  nameFuturePallet) {
                            blocPallet.add(const PalletsEventSendBarcodes());

                            _showSendPalletDialog(context, null);
                            if (!context.mounted) return;

                            setState(() {
                              isErrorSendPallet = false;
                            });
                          } else if (stateBlocPallet.listPallets
                              .listModelsPallet.last.boxes.isNotEmpty) {
                            setState(() {
                              isSendNotColpetePallet = true;
                              isErrorSendPallet = false;
                            });
                            if (stateBlocPallet.listPallets.listModelsPallet
                                    .last.barcode ==
                                nameFuturePallet) {
                              _showDialogChekBarcodeForPalletsOrBox(
                                null,
                                isCompeleteBottling: false,
                                context: context,
                                isBox: false,
                              );
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
                      label: const Text('Отправить паллет')),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  showDialogCompleteBottling(context, blocPallet);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[200]),
                ),
                icon: const Icon(Icons.exit_to_app, color: Colors.red),
                label: const Text(
                  'ЗАВЕРШИТЬ РОЗЛИВ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Text(
                  'Всего едениц: ${calculateTotalItemCount((blocPallet.state as PalletsStateLoaded).listPallets).toString()}'),
              TwoTabWidget(
                scrollController: _scrollController,
                myFocusNode: myFocusNode,
                checkDublicateBarcodeInPallet: checkDublicateBarcodeInPallet,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDialogCompleteBottling(
      BuildContext context, PalletsBloc blocPallet) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Вы точно хотите завершить розлив?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 16),
              TextButton(
                  onPressed: () async {
                    final stateBlocPallet =
                        blocPallet.state as PalletsStateLoaded;

                    // Проверка на отправку полной палеты
                    if (stateBlocPallet.listPallets.listModelsPallet.last.boxes
                                .length ==
                            countBoxesPerPallet ||
                        stateBlocPallet
                                .listPallets.listModelsPallet.last.barcode !=
                            nameFuturePallet) {
                      blocPallet.add(const PalletsEvent
                          .completeBottling()); // ЗАВЕРШЕНИЕ РОЗЛИВА
                      Navigator.of(context).pop();
                    } else if (stateBlocPallet
                        .listPallets.listModelsPallet.last.boxes.isNotEmpty) {
                      setState(() {
                        isSendNotColpetePallet = true;
                        isErrorSendPallet = false;
                      });
                      if (stateBlocPallet
                              .listPallets.listModelsPallet.last.barcode ==
                          nameFuturePallet) {
                        await _showDialogChekBarcodeForPalletsOrBox(
                          null,
                          isCompeleteBottling: true,
                          context: context,
                          isBox: false,
                        );
                        blocPallet.add(const PalletsEvent
                            .completeBottling()); // ЗАВЕРШЕНИЕ РОЗЛИВА

                        Navigator.of(context).pop();
                      }
                    } else {
                      blocPallet.add(const PalletsEvent
                          .completeBottling()); // ЗАВЕРШЕНИЕ РОЗЛИВА
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'ДА',
                    style: TextStyle(fontSize: 18),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'НЕТ',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
        );
      },
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;
  final int indexItem;

  const ItemWidget({
    super.key,
    required this.item,
    required this.indexItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Бутылка ${indexItem + 1}'),
    );
  }
}

class BoxWidget extends StatefulWidget {
  final Box box;
  final int indexBox;

  final InputWithKeyboardControlFocusNode myFocusNode;
  final bool Function({required String barcode}) checkDublicateBarcodeInPallet;

  const BoxWidget({
    super.key,
    required this.box,
    required this.myFocusNode,
    required this.checkDublicateBarcodeInPallet,
    required this.indexBox,
  });

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  @override
  Widget build(BuildContext context) {
    final PalletsBloc blocPallet = context.read<PalletsBloc>();
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return ExpansionTile(
        title: Row(
          children: [
            Text('Коробка №${widget.indexBox + 1}\n ${widget.box.barcode}'),
            const Spacer(),
            IconButton(
              onPressed: () async {
                // ЗАККОМЕНТИРОВАННО НА ВРЕМЯ  ЭКРАН РЕДАКТИРОВАНИЯ КОРОБКИ
                widget.myFocusNode.nextFocus();

                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RefactorBoxScreen(
                      box: widget.box,
                      checkDublicateBarcodeInPallet:
                          widget.checkDublicateBarcodeInPallet,
                    ),
                  ),
                ).then((result) {
                  if (result != null) {
                    blocPallet.add(PalletsEventClearBoxByIndex(
                        indexBox: result.$1, indexPallet: result.$2));
                    blocPallet.add(PalletsEventDeleteBoxByIndex(
                        indexBox: result.$1,
                        indexPallet: result.$2,
                        barcodeBox: widget.box.barcode));
                  }
                });
                widget.myFocusNode.requestFocus();
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        children: <Widget>[
          ListTile(
            title: const Text('Бутылки:'),
            subtitle: Column(
              children: widget.box.items
                  .asMap()
                  .entries
                  .map((item) => ItemWidget(
                        item: item.value,
                        indexItem: item.key,
                      ))
                  .toList(),
            ),
          ),
        ],
      );
    });
  }
}

class ModelsPalletWidget extends StatefulWidget {
  final InputWithKeyboardControlFocusNode myFocusNode;
  final bool Function({required String barcode}) checkDublicateBarcodeInPallet;

  const ModelsPalletWidget({
    Key? key,
    required this.myFocusNode,
    required this.checkDublicateBarcodeInPallet,
  }) : super(key: key);

  @override
  State<ModelsPalletWidget> createState() => _ModelsPalletWidgetState();
}

class _ModelsPalletWidgetState extends State<ModelsPalletWidget> {
  final TextEditingController controller = TextEditingController();
  final String formattedText = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PalletsBloc, PalletsState>(
      builder: (context, state) {
        if (state is PalletsStateLoaded) {
          int index = 1;
          final List<ExpansionTile> expansionTiles =
              state.listPallets.listModelsPallet.map(
            (pallet) {
              final indexPallet = index++;
              final String partNamePallet = pallet.barcode != nameFuturePallet
                  ? pallet.barcode
                  : '(неполная палета)';
              final String namePalletInHistory =
                  '$indexPallet. Палета $partNamePallet ${pallet.boxes.length}/$countBoxesPerPallet \n ${pallet.dateRelease}';

              return ExpansionTile(
                title: Text(namePalletInHistory),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      indexPallet == state.listPallets.listModelsPallet.length
                          ? const SizedBox.shrink()
                          : IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                showDeletePalletDialog(context, indexPallet);
                              },
                            ),
                      IconButton(
                        icon: const Icon(Icons.date_range_rounded),
                        onPressed: () {
                          widget.myFocusNode.nextFocus();

                          showDaologChangeDateOfRelease(context, indexPallet)
                              .then((value) {
                            setState(() {
                              controller.clear();
                              widget.myFocusNode.requestFocus();
                            });
                          });
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    title: const Text('Коробки:'),
                    subtitle: Column(
                      children: pallet.boxes
                          .asMap()
                          .entries
                          .map(
                            (box) => BoxWidget(
                              box: box.value,
                              myFocusNode: widget.myFocusNode,
                              indexBox: box.key,
                              checkDublicateBarcodeInPallet:
                                  widget.checkDublicateBarcodeInPallet,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              );
            },
          ).toList();

          return Column(
            children: [
              IconButton(
                onPressed: () {
                  widget.myFocusNode.nextFocus();

                  showDialog<void>(
                    barrierDismissible: false, //РАСКОМЕНТИРОВАТЬ В  РЕЛИЗЕ

                    context: context,
                    builder: (BuildContext context) {
                      final PalletsBloc blocPallet =
                          context.read<PalletsBloc>();
                      final SearchBarcodeBloc blocSearchBarcode =
                          context.watch<SearchBarcodeBloc>();
                      return BlocBuilder<SearchBarcodeBloc, SearchBarcodeState>(
                        builder:
                            (BuildContext context, SearchBarcodeState state) {
                          return WillPopScope(
                            onWillPop: () async {
                              // Возвращаем `false` для предотвращения закрытия диалогового окна
                              return false;
                            },
                            child: AlertDialog(
                                elevation: 3.0,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (state is SearchBarcodeStateLoaded)
                                      Text(
                                        state.infoAboutBarcode ?? '',
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                    TextField(
                                      autofocus: true,
                                      controller: controller,
                                      decoration: const InputDecoration(
                                        hintText: 'Штрихкод еденицы',
                                      ),
                                      onSubmitted: (value) {
                                        final barcode = controller.text;
                                        blocSearchBarcode.add(
                                            SerachBarcodeEventSerachBarcode(
                                                listPallets: (blocPallet.state
                                                        as PalletsStateLoaded)
                                                    .listPallets,
                                                barcode: barcode));
                                        controller.clear();
                                      },
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  Center(
                                    child: TextButton(
                                      child: const Text(
                                        'Закрыть',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                        blocSearchBarcode.add(
                                            const SerachBarcodeEventClearInfo());
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  )
                                ]),
                          );
                        },
                      );
                    },
                  ).then((value) {
                    setState(() {
                      controller.clear();
                      widget.myFocusNode.requestFocus();
                    });
                  });
                },
                icon: const Icon(
                  Icons.search_sharp,
                  color: Colors.green,
                  size: 30,
                ),
              ),
              Column(
                children: expansionTiles.reversed.toList(),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Future<void> showDaologChangeDateOfRelease(
      BuildContext context, int indexPallet) {
    return showDialog<void>(
      barrierDismissible: false, //РАСКОМЕНТИРОВАТЬ В  РЕЛИЗЕ

      context: context,
      builder: (BuildContext context) {
        final PalletsBloc blocPallet = context.read<PalletsBloc>();
        return WillPopScope(
          onWillPop: () async {
            // Возвращаем `false` для предотвращения закрытия диалогового окна
            return false;
          },
          child: AlertDialog(
              elevation: 3.0,
              content: TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Введите дату (дд.мм.гггг)',
                ),
                inputFormatters: [DateTextFormatter()],
              ),
              actions: <Widget>[
                Center(
                  child: TextButton(
                    child: const Text(
                      'Подтвердить',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      final newDateOfRelease = controller.text;
                      blocPallet.add(PalletsEventChangeDateRelease(
                          indexPallet: (indexPallet - 1),
                          newDateOfRelease: newDateOfRelease));

                      Navigator.of(context).pop();
                    },
                  ),
                )
              ]),
        );
      },
    );
  }

  Future<dynamic> showDeletePalletDialog(
      BuildContext context, int indexPallet) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Вы точно хотите удалить \n Паллет №$indexPallet ',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 16),
              TextButton(
                  onPressed: () {
                    final indexInListPallets = (indexPallet - 1);
                    context.read<PalletsBloc>().add(
                        PalletsEventDeletePalletByIndex(
                            indexPallet: indexInListPallets));
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'ДА',
                    style: TextStyle(fontSize: 18),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'НЕТ',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
        );
      },
    );
  }
}

class TwoTabWidget extends StatelessWidget {
  final InputWithKeyboardControlFocusNode myFocusNode;
  final bool Function({required String barcode}) checkDublicateBarcodeInPallet;

  final ScrollController scrollController;

  const TwoTabWidget(
      {super.key,
      required this.scrollController,
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
                    scrollController: scrollController,
                  ),
                  // Виджеты для второй вкладки
                  SingleChildScrollView(
                    child: ModelsPalletWidget(
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

  const CurrentHistoryWidget({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final PalletsBloc blocPallet = context.watch<PalletsBloc>();
    if (blocPallet.state is PalletsStateLoaded) {
      final statePalletsBloc = blocPallet.state as PalletsStateLoaded;
      return SizedBox(
        height: MediaQuery.of(context).size.height / 3.5,
        child: ListView.builder(
          controller: scrollController,
          itemCount: statePalletsBloc.units.length,
          itemBuilder: (BuildContext context, int index) {
            // scrollController.jumpTo(scrollController.position
            //     .maxScrollExtent); //  авто скролл  на последний элемент при добавлении его в список
            return ListTile(
                title: Text(
                  '${index + 1}. Бутылка ${index + 1}.',
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: index + 1 == statePalletsBloc.maxIndexUnitInBox
                    ? IconButton(
                        onPressed: () {
                          blocPallet.add(PalletsEventClearCurrentUnitsByBarcode(
                              barcode: statePalletsBloc.units[index].barcode));
                        },
                        icon: const Icon(Icons.close),
                        color: Colors.red,
                      )
                    : null);
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

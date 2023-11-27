import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/ui/components/custom_snack_bar_dublicate.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';

import '../../custom_provider.dart';
import '../components/view_model/text_field_check_valid_widget_model.dart';
import 'main_screen/main_screen_copy.dart';

class RefactorBoxScreen extends StatefulWidget {
  final Box box;

  const RefactorBoxScreen({
    super.key,
    required this.box,
  });

  @override
  State<RefactorBoxScreen> createState() => _RefactorBoxScreenState();
}

class _RefactorBoxScreenState extends State<RefactorBoxScreen> {
  final FocusNode myFocusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey _windowConfirmationChangeKey = GlobalKey();

  bool isDeleteUnit = false;
  bool isDeleteBox = false;
  bool isShowInput = false;
  bool isExit = true;
  int indexBox = 0;
  int indexPallet = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final PalletsBloc blocPallet = context.read<PalletsBloc>();
      final stateBloc = blocPallet.state as PalletsStateLoaded;
      findBoxIndex(stateBloc.listPallets.listModelsPallet, widget.box);
    });
  }

  void findBoxIndex(List<ModelsPallet> pallets, Box box) {
    int palletIndex = -1;
    int boxIndex = -1;

    for (int i = 0; i < pallets.length; i++) {
      ModelsPallet pallet = pallets[i];
      if (pallet.boxes.contains(box)) {
        palletIndex = i;
        boxIndex = pallet.boxes.indexOf(box);
        break;
      }
    }

    if (palletIndex != -1 && boxIndex != -1) {
      setState(() {
        indexPallet = palletIndex;
        indexBox = boxIndex;
      });
    } else {
      print("Коробка не найдена");
    }
  }

  Future<void> _showWindowConfirmationChange(
      {required BuildContext context}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            elevation: 3.0,
            key: _windowConfirmationChangeKey,
            content: const Text(
              'Коробкая пустая/неполная.При выходе коробка будет удалена. Вы уверены?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  child: const Text(
                    'Нет',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() => isExit = false);
                    Navigator.of(_windowConfirmationChangeKey.currentContext!)
                        .pop();
                  },
                ),
              ),
              Center(
                child: TextButton(
                  child: const Text(
                    'Да',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    setState(() {
                      isDeleteBox = true;
                    });

                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final PalletsBloc blocPallet = context.watch<PalletsBloc>();
    final stateBlocPallet = blocPallet.state as PalletsStateLoaded;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            isShowInput
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TextField(
                      focusNode: myFocusNode,
                      autofocus: true,
                      controller: _textEditingController,
                      onSubmitted: (String value) async {
                        final modelTextFieldValid =
                            ChangeNotifierProvaider.read<
                                ChangeNotifierProvaider<
                                    TextFieldCheckBalidWidgetModel>,
                                TextFieldCheckBalidWidgetModel>(context);
                        if (stateBlocPallet
                                .listPallets
                                .listModelsPallet[indexPallet]
                                .boxes[indexBox]
                                .items
                                .length ==
                            countUnitsPerBox) {
                          setState(() {
                            _textEditingController.clear();
                          });
                          return;
                        } else {
                          final TypeOfBarcode? typeBarcode =
                              modelTextFieldValid?.isValidBarcode(value);

                          if (typeBarcode != TypeOfBarcode.unit) {
                            setState(() {
                              _textEditingController.clear();
                              myFocusNode.requestFocus();
                            });
                            return;
                          }
                          final bool? isDublicate = modelTextFieldValid
                              ?.checkDublicateBarcodeInPallet(
                                  barcode: value, blocPallet: blocPallet);

                          if (isDublicate == null || isDublicate) {
                            CustomSnackBarError
                                .showSnackBarForDuplicateBarcodeOrOtherProduct(
                                    context, false);
                          } else {
                            final bool? isNotOtherProduct = modelTextFieldValid
                                ?.checkOtherProduct(barcode: value);

                            if (isNotOtherProduct != null &&
                                isNotOtherProduct) {
                              if (stateBlocPallet
                                          .listPallets
                                          .listModelsPallet[indexPallet]
                                          .boxes[indexBox]
                                          .items
                                          .length +
                                      1 ==
                                  countUnitsPerBox) {
                                setState(() {
                                  isShowInput = false;
                                });
                              }

                              blocPallet.add(PalletsEvent.createUnitByIndex(
                                  indexBox: indexBox,
                                  indexPallet: indexPallet,
                                  barcode: value));
                            } else {
                              CustomSnackBarError
                                  .showSnackBarForDuplicateBarcodeOrOtherProduct(
                                      context, true);
                            }
                          }

                          setState(() {
                            _textEditingController.clear();
                            myFocusNode.requestFocus();
                          });
                        }
                      },
                    ),
                  )
                : const SizedBox.shrink(),
            ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    myFocusNode.requestFocus();
                    isShowInput = true;
                  });
                },
                icon: const Icon(
                  Icons.add,
                ),
                label: const Text('Наполнить коробку')),
            ElevatedButton.icon(
                onPressed: () {
                  blocPallet.add(PalletsEventClearBoxByIndex(
                      indexBox: indexBox, indexPallet: indexPallet));

                  setState(() {
                    isDeleteUnit = true;
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text('Очистить коробку')),
            ElevatedButton.icon(
                onPressed: () async {
                  setState(() {
                    isExit = true;
                  });
                  (int, int)? res;
                  if (stateBlocPallet.listPallets.listModelsPallet[indexPallet]
                          .boxes[indexBox].items.isEmpty ||
                      stateBlocPallet.listPallets.listModelsPallet[indexPallet]
                              .boxes[indexBox].items.length !=
                          countUnitsPerBox) {
                    await _showWindowConfirmationChange(
                      context: context,
                    );
                    res = (indexBox, indexPallet);
                  }

                  if (isExit) {
                    // await bloc.postBarcodes(); ЗАкомментировано на время, пока не можем оотправлять имзенения каждой коробки
                    Navigator.pop(context, res);
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                ),
                label: const Text('Вернутся назад')),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Коробка со штрихкодом:\n${widget.box.barcode}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: stateBlocPallet.listPallets.listModelsPallet[indexPallet]
                      .boxes.isNotEmpty
                  ? ListView.builder(
                      itemCount: stateBlocPallet
                          .listPallets
                          .listModelsPallet[indexPallet]
                          .boxes[indexBox]
                          .items
                          .length, // widget.box.items.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ItemWidget(
                        item: stateBlocPallet
                            .listPallets
                            .listModelsPallet[indexPallet]
                            .boxes[indexBox]
                            .items[index],
                        index: index,
                      ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;
  final int index;

  const ItemWidget({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Бутылка ${index + 1}'),
        ],
      ),
    );
  }
}

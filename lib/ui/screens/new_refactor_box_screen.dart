import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/ui/components/custom_snack_bar_dublicate.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';

class RefactorBoxScreen extends StatefulWidget {
  final Box box;
  final bool Function({required String barcode}) checkDublicateBarcodeInPallet;

  const RefactorBoxScreen(
      {super.key,
      required this.box,
      required this.checkDublicateBarcodeInPallet});

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
      // final PalletCubit bloc = context.read<PalletCubit>();
      // indexBox = bloc.state.pallets.boxes.indexOf(widget.box);
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
        final PalletsBloc blocPallet = context.read<PalletsBloc>();

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
                          final isDublicate = widget
                              .checkDublicateBarcodeInPallet(barcode: value);
                          if (isDublicate) {
                            CustomSnackBarDudlicateBarcode
                                .showSnackBarForDuplicateBarcode(context);
                          } else {
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
                  var res = null;
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

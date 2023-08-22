import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallet_cubit.dart';
import 'package:honest_sign_flutter_app/ui/components/custom_snack_bar.dart';
import 'package:honest_sign_flutter_app/ui/components/input_with_keyboard_control.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';

class RefactorBoxScreen extends StatefulWidget {
  // final ModelsPallet pallets;
  // final Set<String> allBarcodeHistory;
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
  final InputWithKeyboardControlFocusNode myFocusNode =
      InputWithKeyboardControlFocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey _windowConfirmationChangeKey = GlobalKey();

  bool isDeleteUnit = false;
  bool isDeleteBox = false;
  bool isShowInput = false;
  bool isExit = true;
  int indexBox = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final PalletCubit bloc = context.read<PalletCubit>();
      indexBox = bloc.state.pallets.boxes.indexOf(widget.box);
    });
  }

  Future<void> _showWindowConfirmationChange(
      {required BuildContext context, required PalletCubit bloc}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            key: _windowConfirmationChangeKey,
            content: const Text(
              'Коробкая пуста.При выходе с пустой коробкой, коробка будет удалена. Вы уверены?',
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
                  onPressed: () {
                    setState(() {
                      bloc.deleteBox(indexBox: indexBox);
                      // widget.allBarcodeHistory.remove(widget.box.barcode);
                      // widget.pallets.boxes.removeAt(indexBox);
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
    final PalletCubit bloc = context.read<PalletCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            isShowInput
                ? TextFormField(
                    focusNode: myFocusNode,
                    autofocus: true,
                    controller: _textEditingController,
                    onFieldSubmitted: (String value) {
                      if (bloc.state.pallets.boxes[indexBox].items.length ==
                          countUnitsPerBox) {
                        setState(() {
                          _textEditingController.clear();
                        });
                        return;
                      } else {
                        final isDublicate = widget
                            .checkDublicateBarcodeInPallet(barcode: value);
                        if (isDublicate) {
                          CustomSnackBar.showSnackBarForDuplicateBarcode(
                              context);
                        } else {
                          String formattedDateTime = createDateNow();
                          bloc.createUnitByIndexBox(
                              barcode: value,
                              formattedDateTime: formattedDateTime,
                              indexBox: indexBox);
                          // final Item item = Item(
                          //   barcode: value,
                          //   date: formattedDateTime,
                          // );
                          // setState(() {
                          //   widget.allBarcodeHistory.add(value);
                          //   widget.pallets.boxes[indexBox].items.add(item);
                          // });
                        }

                        setState(() {
                          _textEditingController.clear();
                          myFocusNode.requestFocus();
                        });
                      }
                    },
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
                  bloc.clearBoxByIndex(indexBox: indexBox);
                  setState(() {
                    // widget.box.items.forEach((element) {
                    //   widget.allBarcodeHistory.remove(element.barcode);
                    // });
                    // widget.box.items.clear();
                    // widget.pallets.boxes[indexBox].items.clear();
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
                  if (widget.box.items.isEmpty) {
                    await _showWindowConfirmationChange(
                        context: context, bloc: bloc);
                  }

                  if (isExit) {
                    Navigator.pop(context);
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

                // InputWithKeyboardControl(
                //   focusNode: myFocusNode,
                //   onSubmitted: (String value) async {
                //     // await onSubmittedTextField(
                //     //     context: context, value: value);
                //   },
                //   autofocus: true,
                //   controller: _textEditingController,
                //   width: 300,
                //   startShowKeyboard: false,
                //   buttonColorEnabled: Colors.blue,
                //   buttonColorDisabled: Colors.black,
                // ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: bloc.state.boxes[indexBox].items
                      .length, // widget.box.items.length,
                  itemBuilder: (BuildContext context, int index) => ItemWidget(
                        item: bloc.state.boxes[indexBox].items[index],
                        index: index,
                      )),
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
          Text(item.barcode),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:honest_sign_flutter_app/components/custom_snack_bar.dart';
import 'package:honest_sign_flutter_app/components/input_with_keyboard_control.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';

class RefactorBoxScreen extends StatefulWidget {
  final ModelsPallet pallets;
  final Set<String> allBarcodeHistory;
  final Box box;
  final bool Function({required String barcode}) checkDublicateBarcodeInPallet;

  const RefactorBoxScreen(
      {super.key,
      required this.pallets,
      required this.box,
      required this.allBarcodeHistory,
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
  late final int indexBox;

  @override
  void initState() {
    super.initState();
    indexBox = widget.pallets.boxes.indexOf(widget.box);
  }

  Future<void> _showWindowConfirmationChange(BuildContext context) async {
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
                      widget.allBarcodeHistory.remove(widget.box.barcode);
                      widget.pallets.boxes.removeAt(indexBox);
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
                      if (widget.pallets.boxes[indexBox].items.length ==
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
                          final Item item = Item(
                            barcode: value,
                            date: formattedDateTime,
                          );
                          setState(() {
                            widget.allBarcodeHistory.add(value);
                            widget.pallets.boxes[indexBox].items.add(item);
                          });
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
                  setState(() {
                    widget.box.items.forEach((element) {
                      widget.allBarcodeHistory.remove(element.barcode);
                    });
                    widget.box.items.clear();
                    widget.pallets.boxes[indexBox].items.clear();
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
                    await _showWindowConfirmationChange(context);
                  }

                  final result = {
                    'isDeleteBox': '$isDeleteBox',
                    'box': '${widget.box.barcode}',
                    'indexBox': '$indexBox',
                  };
                  if (isExit) {
                    Navigator.pop(context, result);
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
                  itemCount: widget.box.items.length,
                  itemBuilder: (BuildContext context, int index) => ItemWidget(
                        item: widget.box.items[index],
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

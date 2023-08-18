import 'package:flutter/material.dart';
import 'package:honest_sign_flutter_app/components/input_with_keyboard_control.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';

class RefactorBoxScreen extends StatefulWidget {
  final ModelsPallet pallets;
  final Set<String> allBarcodeHistory;
  final Box box;
  const RefactorBoxScreen(
      {super.key,
      required this.pallets,
      required this.box,
      required this.allBarcodeHistory});

  @override
  State<RefactorBoxScreen> createState() => _RefactorBoxScreenState();
}

class _RefactorBoxScreenState extends State<RefactorBoxScreen> {
  final InputWithKeyboardControlFocusNode myFocusNode =
      InputWithKeyboardControlFocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  bool isExit = false;
  bool isDeleteUnit = false;
  bool isDeleteBox = false;
  late final int indexBox;

  Future<void> _showWindowConfirmationChange(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
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
                    Navigator.pop(context);
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
                    //  indexBox =
                    //     widget.pallets.boxes.indexOf(widget.box);
                    setState(() {
                      widget.allBarcodeHistory.remove(widget.box.barcode);
                      widget.pallets.boxes.removeAt(indexBox);
                      isDeleteBox = true;
                      isExit = true;
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
            ElevatedButton.icon(
                onPressed: () {
                  indexBox = widget.pallets.boxes.indexOf(widget.box);
                  setState(() {
                    widget.box.items.forEach((element) {
                      widget.allBarcodeHistory.remove(element.barcode);
                    });
                    widget.box.items.clear();
                    widget.pallets.boxes[indexBox].items.clear();
                    isDeleteUnit = true;
                  });
                  print(indexBox);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text('Очистить коробку')),
            ElevatedButton.icon(
                onPressed: () async {
                  if (widget.box.items.isEmpty) {
                    await _showWindowConfirmationChange(context);
                  }

                  if (isExit) {
                    final result = {
                      'isDeleteBox': '$isDeleteBox',
                      'box': '${widget.box.barcode}',
                      'indexBox': '$indexBox',
                    };
                    Navigator.pop(context, result);
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
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

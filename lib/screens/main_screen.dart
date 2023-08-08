import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';

import 'package:honest_sign_flutter_app/screens/delete_barcode_sreen.dart';
import 'package:intl/intl.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late TextEditingController _textEditingController;
  final TextEditingController _textEditingControllerDeleteDialog =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Item> allBarcodeHistory = [];

  final List<Item> unit = [];
  // final Map<String, List<String>> box = {
  //   'Группа 1': [' 1', '2', '3', '4', '5', '6'],
  //   'Группа 2': [' 1', '2', '3', '4', '5', '6'],
  // };
  final List<Box> boxes = [];

  final ModelsPallet pallets = ModelsPallet(
      barcode: 'Будущая палета',
      date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
      boxes: []);
  // final Map<String, dynamic> pallets = {
  //   'Палет 1': {
  //     'Коробка 1': [' 1', '2', '3', '4', '5', '6'],
  //     'Коробка 2': [' 1', '2', '3', '4', '5', '6'],
  //     'Коробка 3': [' 1', '2', '3', '4', '5', '6']
  //   },
  //   'Палет 2': {
  //     'Коробка 1': [' 1', '2', '3', '4', '5', '6'],
  //     'Коробка 2': [' 1', '2', '3', '4', '5', '6'],
  //     'Коробка 3': [' 1', '2', '3', '4', '5', '6']
  //   },
  // };

  late InputWithKeyboardControlFocusNode myFocusNode;

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

  void _sendText(String text) {
    setState(() {
      DateTime now = DateTime.now();
      String formattedDateTime = DateFormat('dd.MM.yyyy HH:mm').format(now);
      unit.add(Item(barcode: text, date: formattedDateTime));
      allBarcodeHistory.add(Item(barcode: text, date: formattedDateTime));

      for (int i = 0; i < unit.length; i++) {
        String item = unit[i].barcode;
        if (i != 0 && i % countUnitsPerBox == 0) {
          // проверка на коробку
          DateTime now = DateTime.now();
          String formattedDateTime = DateFormat('dd.MM.yyyy HH:mm').format(now);
          final List<Item> copyUnits = unit.sublist(0, unit.length - 1);
          boxes.add(
              Box(barcode: item, date: formattedDateTime, items: copyUnits));

          pallets.boxes = [...boxes];

          unit.clear();
        }
        // else if (item == '4630097264533') {
        //   unit.clear();
        //   // заглушка на проверку ппалета
        //   pallets[item] = Map<String, dynamic>.from(pallets[keyFututrePallet]);
        //   pallets.remove(keyFututrePallet);
        //   box.clear();
        // }
      }
    });
    // myFocusNode.requestFocus(); //расскоментировать для обычного TExtFormField
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
                // )
                InputWithKeyboardControl(
              focusNode: myFocusNode,
              onSubmitted: (value) {
                _sendText(value);
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
            ElevatedButton.icon(
                onPressed: () async {
                  myFocusNode.nextFocus();

                  // final result = await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DeleteScreen(
                  //       pallets: pallets,
                  //     ),
                  //   ),
                  // ); /// ВЫЗОВ НОВГО СКРИНА НА УДАЛЕНИЕ

                  // Обработка результата с нового экрана
                  // if (result != null) {}
                  myFocusNode.requestFocus();
                },
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text('Удалить')),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  myFocusNode.nextFocus();

                  myFocusNode.requestFocus();
                },
                icon: const Icon(Icons.call_made, color: Colors.green),
                label: const Text('Отправить палету')),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: ModelsPalletWidget(
              pallet: pallets,
            ),
          ),
        ),
        const Divider(
          thickness: 5,
        ),
        const Text('Текущие штрихкоды бутылок'),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: unit.length,
            itemBuilder: (BuildContext context, int index) {
              _scrollController.jumpTo(_scrollController.position
                  .maxScrollExtent); //  авто скролл  на последний элемент при добавлении его в список
              return ListTile(
                title: Text('${index + 1}. ${unit[index].barcode}'),
              );
            },
          ),
        )
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

class MapListWidget extends StatelessWidget {
  final Map<String, List<String>> data;

  const MapListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.keys.length,
      itemBuilder: (context, index) {
        String key = data.keys.elementAt(index);
        List<String> values = data[key]!;

        return ExpansionTile(
          title: Text(key),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: values.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(values[index]),
                );
              },
            ),
          ],
        );
      },
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

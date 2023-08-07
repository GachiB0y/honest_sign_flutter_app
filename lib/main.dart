import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/screens/delete_barcode_sreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(child: InputWidget())),
    );
  }
}

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late TextEditingController _textEditingController;
  final TextEditingController _textEditingControllerDeleteDialog =
      TextEditingController();
  final List<String> allBarcodeHistory = [];

  final List<String> unit = [];
  final Map<String, List<String>> box = {
    'Группа 1': [' 1', '2', '3', '4', '5', '6'],
    'Группа 2': [' 1', '2', '3', '4', '5', '6'],
  };
  final Map<String, dynamic> pallets = {
    'Палет 1': {
      'Коробка 1': [' 1', '2', '3', '4', '5', '6'],
      'Коробка 2': [' 1', '2', '3', '4', '5', '6'],
      'Коробка 3': [' 1', '2', '3', '4', '5', '6']
    },
    'Палет 2': {
      'Коробка 1': [' 1', '2', '3', '4', '5', '6'],
      'Коробка 2': [' 1', '2', '3', '4', '5', '6'],
      'Коробка 3': [' 1', '2', '3', '4', '5', '6']
    },
  };

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
      unit.add(text);
      allBarcodeHistory.add(text);

      for (int i = 0; i < unit.length; i++) {
        String item = unit[i];
        if (i != 0 && i % countUnitsPerBox == 0) {
          // проверка на коробку

          box['$item'] = unit.sublist(0, unit.length - 1);
          pallets[keyFututrePallet] = Map<String, dynamic>.from(box);

          unit.clear();
        } else if (item == '4630097264533') {
          unit.clear();
          // заглушка на проверку ппалета
          pallets[item] = Map<String, dynamic>.from(pallets[keyFututrePallet]);
          pallets.remove(keyFututrePallet);
          box.clear();
        }
      }
    });
    // myFocusNode.requestFocus();расскоментировать для обычного TExtFormField
    _textEditingController.clear();
  }

  // Future<void> _showDeleteDialog(BuildContext context) async {
  //   await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Всплывающий диалог'),
  //         content: TextField(
  //           controller:
  //               _textEditingControllerDeleteDialog, // Подключите контроллер TextField
  //           decoration:
  //               const InputDecoration(hintText: 'Отсканируйте штрихкод'),
  //         ),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               // Обработка нажатия кнопки "Сохранить"
  //               print(_textEditingControllerDeleteDialog.text);
  //               myFocusNode.requestFocus();
  //               Navigator.pop(context);
  //             },
  //             child: const Text('Сохранить'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               // Обработка нажатия кнопки "Отмена"
  //               Navigator.pop(context);
  //             },
  //             child: const Text('Отмена'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
                // TextFormField(
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
        Center(
          child: ElevatedButton.icon(
              onPressed: () async {
                myFocusNode.nextFocus();

                myFocusNode.hasFocus;
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeleteScreen(
                      pallets: pallets,
                    ),
                  ),
                );

                // Обработка результата с нового экрана
                if (result != null) {
                  print(result.toString());
                }
                myFocusNode.requestFocus();
              },
              icon: const Icon(Icons.delete, color: Colors.red),
              label: const Text('Удалить')),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: DataWidget(
              data: pallets,
            ),
          ),
        ),
        const Divider(
          thickness: 5,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: ListView.builder(
            // reverse: true,
            itemCount: unit.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('${index + 1}. ${unit[index]}'),
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

  // toggleShowKeyboard(bool value) {
  //   setState(() {
  //     showKeyboard = !value;
  //   });

  //   if (!showKeyboard) {
  //     SystemChannels.textInput.invokeMethod('TextInput.hide');
  //     focusNode.requestFocus();
  //   } else {
  //     SystemChannels.textInput.invokeMethod('TextInput.show');
  //     focusNode.requestFocus();
  //   }
  // }

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

class DataWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const DataWidget({super.key, required this.data});

  Widget _buildList(dynamic item) {
    if (item is Map<String, dynamic>) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: item.keys.length,
        itemBuilder: (context, index) {
          String key = item.keys.elementAt(index);
          dynamic value = item[key];
          return ExpansionTile(
            title: Text(key),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: _buildList(value),
              ),
            ],
          );
        },
      );
    } else if (item is List<String>) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: item.length,
        itemBuilder: (context, index) {
          String value = item[index];
          return ListTile(
            title: Text(value),
          );
        },
      );
    } else {
      return ListTile(
        title: Text(item),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(data);
  }
}

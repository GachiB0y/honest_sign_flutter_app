import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(child: InputWidget())),
    );
  }
}

// class InputHistoryWidget extends StatefulWidget {
//   @override
//   _InputHistoryWidgetState createState() => _InputHistoryWidgetState();
// }

// class _InputHistoryWidgetState extends State<InputHistoryWidget> {
//   final TextEditingController _textEditingController = TextEditingController();
//   List<String> _history = [];
//   late FocusNode myFocusNode;

//   @override
//   void initState() {
//     super.initState();
//     // Установить фокус на поле ввода при запуске приложения
//     // FocusScope.of(context).requestFocus(_textEditingController);
//     myFocusNode = FocusNode();
//   }

//   void _addToHistory(String text) async {
//     if (text.length == 13) {
//       setState(() {
//         _history.add(text);
//       });
//     }

//     _textEditingController.clear(); // Очистка поля ввода
//     myFocusNode.requestFocus();
//   }

//   @override
//   void dispose() {
//     // Clean up the focus node when the Form is disposed.
//     myFocusNode.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Input History Widget'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _history.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_history[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               focusNode: myFocusNode,
//               autofocus: true,
//               controller: _textEditingController,
//               onChanged: (text) async {
//                 await Future.delayed(Duration(milliseconds: 500));
//                 _addToHistory(text);
//               },
//               decoration: InputDecoration(
//                 labelText: 'Введите текст',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late TextEditingController _textEditingController;

  List<String> _history = [];
  List<Widget> widgetsHistory = [];
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
      _history.add(text);
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Opacity(
          opacity: 1.0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InputWithKeyboardControl(
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
        ),
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: _history.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_history.reversed.toList()[index]),
              );
            },
          ),
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

  toggleShowKeyboard(bool value) {
    setState(() {
      showKeyboard = !value;
    });

    if (!showKeyboard) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      focusNode.requestFocus();
    } else {
      SystemChannels.textInput.invokeMethod('TextInput.show');
      focusNode.requestFocus();
    }
  }

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

class HistoryWidget extends StatefulWidget {
  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  List<String> inputData = [];

  @override
  void initState() {
    super.initState();
    inputData.add("Item 1");
    inputData.add("Item 2");
    inputData.add("Item 3");
    inputData.add("Item 4");
    inputData.add("Item 5");
    inputData.add("Item 6");
    inputData.add("Group 1");
    inputData.add("Item 7");
    inputData.add("Item 8");
    inputData.add("Item 9");
    inputData.add("Item 10");
    inputData.add("Item 11");
    inputData.add("Item 12");
    inputData.add("Group 2");
    // Добавьте свои данные и группы здесь
  }

  List<DropdownMenuItem<String>> generateDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    List<String> currentGroup = [];
    for (int i = 0; i < inputData.length; i++) {
      String item = inputData[i];
      if (i != 0 && i % 7 == 0) {
        DropdownMenuItem<String> dropdownItem = DropdownMenuItem(
          value: item,
          child: Text(item),
        );
        dropdownItems.add(dropdownItem);
        for (String historyItem in currentGroup) {
          DropdownMenuItem<String> dropdownHistoryItem = DropdownMenuItem(
            value: historyItem,
            child: Text(historyItem),
          );
          dropdownItems.add(dropdownHistoryItem);
        }
        currentGroup.clear();
      } else {
        currentGroup.add(item);
      }
    }
    if (currentGroup.isNotEmpty) {
      DropdownMenuItem<String> dropdownItem = DropdownMenuItem(
        value: inputData.last,
        child: Text(inputData.last),
      );
      dropdownItems.add(dropdownItem);
      for (String historyItem in currentGroup) {
        DropdownMenuItem<String> dropdownHistoryItem = DropdownMenuItem(
          value: historyItem,
          child: Text(historyItem),
        );
        dropdownItems.add(dropdownHistoryItem);
      }
    }
    return dropdownItems;
  }

  void addItem(String item) {
    setState(() {
      inputData.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItems = generateDropdownItems();
    return Column(
      children: <Widget>[
        DropdownButton<String>(
          items: dropdownItems,
          onChanged: (String? value) {},
        ),
        TextField(
          onSubmitted: (String value) {
            addItem(value);
          },
        ),
      ],
    );
  }
}

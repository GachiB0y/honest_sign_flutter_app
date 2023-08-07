import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honest_sign_flutter_app/constants.dart';

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

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late TextEditingController _textEditingController;
  List<String> allBarcodeHistory = [];

  List<String> unit = [];
  Map<String, List<String>> box = {
    'Группа 1': [' 1', '2', '3', '4', '5', '6'],
    'Группа 2': [' 1', '2', '3', '4', '5', '6'],
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
          box['$item'] = unit.sublist(0, unit.length - 1);

          unit.clear();
        }
      }
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
          child: MapListWidget(
            data: box,
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

class MapListWidget extends StatelessWidget {
  final Map<String, List<String>> data;

  MapListWidget({required this.data});

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
              physics: ClampingScrollPhysics(),
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

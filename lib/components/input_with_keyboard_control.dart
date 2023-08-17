import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

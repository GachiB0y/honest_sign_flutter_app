import 'package:flutter/material.dart';
import 'package:honest_sign_flutter_app/constants.dart';

class BaseDateTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  String formattedText;
  final Future<void> Function(BuildContext context)? callBack;

  BaseDateTextFieldWidget(
      {super.key,
      required this.controller,
      required this.formattedText,
      required this.callBack});
  @override
  _BaseDateTextFieldWidgetState createState() =>
      _BaseDateTextFieldWidgetState();
}

class _BaseDateTextFieldWidgetState extends State<BaseDateTextFieldWidget> {
  TextEditingController get _controller => widget.controller;
  String formatted = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_formatText);
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  void _formatText() {
    final input = _controller.text.replaceAll('.', '');
    if (input.length > 8) {
      _controller.text = input.substring(0, 8);
    }

    if (input.isNotEmpty) {
      formatted = input.substring(0, input.length < 2 ? input.length : 2);
    }
    if (input.length > 2) {
      formatted +=
          '.' + input.substring(2, input.length < 4 ? input.length : 4);
    }
    if (input.length > 4) {
      formatted +=
          '.' + input.substring(4, input.length < 8 ? input.length : 8);
    }

    setState(() {
      widget.formattedText = formatted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: _controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Введите дату (дд.мм.гггг)',
      ),
      maxLength: 10,
      textAlign: TextAlign.center,
      onChanged: (value) {
        _formatText();
        _controller.value = _controller.value.copyWith(
          text: widget.formattedText,
          selection: TextSelection.fromPosition(
            TextPosition(offset: widget.formattedText.length),
          ),
        );
      },
      onSubmitted: (value) async {
        if (widget.callBack != null) {
          await widget.callBack!(context);
        }

        dateOfRelease = value;
      },
    );
  }
}

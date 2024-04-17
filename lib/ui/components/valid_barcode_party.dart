import 'package:flutter/material.dart';
import 'package:honest_sign_flutter_app/constants.dart';

class TextFormFieldBarcodeParty extends StatefulWidget {
  const TextFormFieldBarcodeParty(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.onFieldSubmitted});

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String) onFieldSubmitted;
  @override
  State<TextFormFieldBarcodeParty> createState() =>
      _TextFormFieldBarcodePartyState();
}

class _TextFormFieldBarcodePartyState extends State<TextFormFieldBarcodeParty> {
  TextEditingController? get _textControllerChangeBarcodeParty =>
      widget.controller;

  FocusNode? get _focusNodeChangeBarcodeParty => widget.focusNode;

  void Function(String) get _onFieldSubmitted => widget.onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textControllerChangeBarcodeParty,
      focusNode: _focusNodeChangeBarcodeParty,
      keyboardType: TextInputType.number,
      autofocus: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          FocusScope.of(context).requestFocus(
              _focusNodeChangeBarcodeParty); // Установить фокус на TextFormField
          return 'Значение обязательно';
        }
        if (!value.startsWith('99')) {
          FocusScope.of(context).requestFocus(
              _focusNodeChangeBarcodeParty); // Установить фокус на TextFormField
          return 'ШК должен начинаться с 99';
        }
        if (setUsedBarcodesParty.contains(value)) {
          return 'Партионный ШК дублируется!';
        }
        return null;
      },
      onFieldSubmitted: (value) => _onFieldSubmitted(value),
    );
  }
}

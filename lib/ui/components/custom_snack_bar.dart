import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    Key? key,
    required Widget content,
    SnackBarAction? action,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    required Duration? duration,
    Animation<double>? animation,
    VoidCallback? onVisible,
    SnackBarBehavior? behavior,
  }) : super(
          key: key,
          content: content,
          action: action,
          elevation: elevation,
          margin: margin,
          padding: padding,
          shape: shape,
          duration: duration!,
          animation: animation,
          onVisible: onVisible,
          behavior: behavior,
        );

  static void showSnackBarForDuplicateBarcode(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      CustomSnackBar(
        content: const Text(
          'Штрих код дублируется, отсканируйте другой штрихкод!',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

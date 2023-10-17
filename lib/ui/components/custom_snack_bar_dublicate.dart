import 'package:flutter/material.dart';

class CustomSnackBarError extends SnackBar {
  CustomSnackBarError({
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

  static void showSnackBarForDuplicateBarcodeOrOtherProduct(
      BuildContext context, bool isGtin) {
    ScaffoldMessenger.of(context).showSnackBar(
      CustomSnackBarError(
        content: isGtin
            ? const Text(
                'Возможно этот DataMatrix от другого продукта! Обратитес к мастеру!',
                style: TextStyle(fontSize: 20, color: Colors.red),
              )
            : const Text(
                'Штрих код дублируется, отсканируйте другой штрихкод!',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

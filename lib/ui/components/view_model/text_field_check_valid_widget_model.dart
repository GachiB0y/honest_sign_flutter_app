import 'package:flutter/material.dart';
import 'package:honest_sign_flutter_app/constants.dart';

import '../../../domain/blocs/pallets_bloc/pallets_bloc.dart';
import '../../screens/main_screen/main_screen_copy.dart';

class TextFieldCheckBalidWidgetModel extends Listenable {
  // Создание списка слушателей
  final List<VoidCallback> _listeners = [];
  // int? _firstNumber;
  // int? _secondNumber;
  // int? summResult;

  // set firstNumber(String value) => _firstNumber = int.tryParse(value);
  // set secondNumber(String value) => _secondNumber = int.tryParse(value);

  // Метод для добавления слушателей
  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  // Метод для удаления слушателей
  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  // Метод для уведомления слушателей об изменениях
  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  TypeOfBarcode isValidBarcode(String barcode) {
    bool isContains = setPallets.contains(barcode);
    if (isContains) {
      return TypeOfBarcode.pallet;
    } else {
      isContains = setBoxs.contains(barcode);
      if (isContains) {
        return TypeOfBarcode.box;
      } else {
        // isContains = setUnit.contains(
        //     barcode);
        // ЗАГЛУШКА НА ВАЛИДАЦИЮ  ШТУЧКИ ПОКА НЕТ ИХ КОДОВ
        if (barcode.length >= 37) {
          final bool isStartWith = barcode.startsWith('01');

          if (isStartWith) {
            return TypeOfBarcode.unit;
          }
          return TypeOfBarcode.undefined;
        } else {
          return TypeOfBarcode.undefined;
        }
      }
    }
  }

  // ЗАГЛУШКА НА ПРОВЕРКУ АГРЕГАЦИОННОГО КОДА ЗАКОММЕНТИТЬ В РЕЛИЗЕ

  // TypeOfBarcode isValidBarcode(String barcode) {
  //   if (barcode.length == 18 && barcode.startsWith('1')) {
  //     return TypeOfBarcode.pallet;
  //   } else {
  //     if (barcode.length == 18 && barcode.startsWith('0')) {
  //       return TypeOfBarcode.box;
  //     } else {
  //       if (barcode.length >= 37) {
  //         return TypeOfBarcode.unit;
  //       } else {
  //         return TypeOfBarcode.undefined;
  //       }
  //     }
  //   }
  // }

  bool checkDublicateBarcodeInPallet(
      {required String barcode, required PalletsBloc blocPallet}) {
    // final PalletsBloc blocPallet = context.read<PalletsBloc>();
    final bool isDuplicate = (blocPallet.state as PalletsStateLoaded)
        .allBarcodeHistory
        .contains(barcode);
    return isDuplicate;
  }

  bool checkOtherProduct({required String barcode}) {
    final isContains = barcode.contains(gtin);
    return isContains;
  }
}

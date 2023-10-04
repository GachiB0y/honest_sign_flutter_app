import 'dart:convert';

import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SessionDataProvdier {
  Future<void> saveState(
      {required String numberCard, required PalletsStateLoaded palletState});
  Future<PalletsStateLoaded?> loadState({required String numberCard});
  Future<void> deleteState({required String numberCard});
}

class SessionDataProvdierDefault implements SessionDataProvdier {
  const SessionDataProvdierDefault();

  @override
  Future<void> saveState(
      {required String numberCard,
      required PalletsStateLoaded palletState}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> json = palletState.listPallets.toJson();
    await prefs.setString('listPallets_$numberCard', jsonEncode(json));
    List<dynamic> unitsJson =
        palletState.units.map((item) => item.toJson()).toList();
    await prefs.setStringList('units_$numberCard',
        unitsJson.map((item) => jsonEncode(item)).toList());
    Set<dynamic> allBarcodeHistoryJson =
        Set.from(palletState.allBarcodeHistory.toList());

    await prefs.setStringList('allBarcodeHistory_$numberCard',
        allBarcodeHistoryJson.map((item) => jsonEncode(item)).toList());
    Set<dynamic> currentBarcodeHistoryJson =
        Set.from(palletState.currentBarcodeHistory.toList());
    await prefs.setStringList('currentBarcodeHistoryJson_$numberCard',
        currentBarcodeHistoryJson.map((item) => jsonEncode(item)).toList());

    await prefs.setInt('countBarcode_$numberCard', palletState.countBarcodes);
    await prefs.setInt('countBox_$numberCard', palletState.countBox);
    await prefs.setInt('maxIndex_$numberCard', palletState.maxIndexUnitInBox);
    await prefs.setString('dateofRelease_$numberCard', dateOfRelease);
  }

  @override
  Future<PalletsStateLoaded?> loadState({required String numberCard}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('listPallets_$numberCard');

    if (jsonString != null) {
      Map<String, dynamic> json = jsonDecode(jsonString);
      final ListPallets listPallets = ListPallets.fromJson(json);
      List<String>? jsonList = prefs.getStringList('units_$numberCard');
      final units =
          jsonList?.map((json) => Item.fromJson(jsonDecode(json))).toList();
      List<String>? jsonListAllBarcodeHistory =
          prefs.getStringList('allBarcodeHistory_$numberCard');
      final Set<String>? allBarcodeHistory = (jsonListAllBarcodeHistory
          ?.map((json) => jsonDecode(json))
          .toSet()
          .cast<String>());
      List<String>? jsonLisCcurrentBarcodeHistory =
          prefs.getStringList('allBarcodeHistory_$numberCard');

      final Set<String>? currentBarcodeHistory = (jsonLisCcurrentBarcodeHistory
          ?.map((json) => jsonDecode(json))
          .toSet()
          .cast<String>());
      final int countBarcode = prefs.getInt('countBarcode_$numberCard') ?? 0;
      final int countBox = prefs.getInt('countBox_$numberCard') ?? 0;
      final int maxIndex = prefs.getInt('maxIndex_$numberCard') ?? 0;

      final PalletsStateLoaded state = PalletsStateLoaded(
        listPallets: listPallets,
        units: units!,
        allBarcodeHistory: allBarcodeHistory!,
        currentBarcodeHistory: currentBarcodeHistory!,
        countBarcodes: countBarcode,
        maxIndexUnitInBox: maxIndex,
        countBox: countBox,
      );
      dateOfRelease = prefs.getString('dateofRelease_$numberCard') ??
          ''; // Получаем дату и записываем ее в глобальную переменную. Дальше нужно убрать ее из глобальных.
      return state;
    } else {
      return null;
    }
  }

  @override
  Future<void> deleteState({required String numberCard}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('listPallets_$numberCard');
      await prefs.remove('units_$numberCard');
      await prefs.remove('allBarcodeHistory_$numberCard');
      await prefs.remove('currentBarcodeHistoryJson_$numberCard');
      await prefs.remove('countBox_$numberCard');
      await prefs.remove('countBarcode_$numberCard');
      await prefs.remove('maxIndex_$numberCard');
      await prefs.remove('dateofRelease_$numberCard');
    } catch (e) {
      rethrow;
    }
  }
}

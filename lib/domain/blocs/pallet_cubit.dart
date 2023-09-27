import 'dart:convert';

import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:honest_sign_flutter_app/domain/entity/enity.dart';

class PalletCubitState {
  late final Set<String> allBarcodeHistory;
  late final List<Item> unit;
  late List<Box> boxes;
  late int countBarcodes;
  late int countBox;
  late final ModelsPallet pallets;
  PalletCubitState({
    required this.allBarcodeHistory,
    required this.unit,
    required this.boxes,
    required this.countBarcodes,
    required this.countBox,
    required this.pallets,
  });

  PalletCubitState copyWith({
    required Set<String>? allBarcodeHistory,
    required List<Item>? unit,
    required List<Box>? boxes,
    required int? countBarcodes,
    required int? countBox,
    required ModelsPallet? pallets,
  }) {
    return PalletCubitState(
      allBarcodeHistory: allBarcodeHistory ?? this.allBarcodeHistory,
      unit: unit ?? this.unit,
      boxes: boxes ?? this.boxes,
      countBarcodes: countBarcodes ?? this.countBarcodes,
      countBox: countBox ?? this.countBox,
      pallets: pallets ?? this.pallets,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allBarcodeHistory': allBarcodeHistory,
      'unit': unit,
      'boxes': boxes,
      'countBarcodes': countBarcodes,
      'countBox': countBox,
      'pallets': pallets,
    };
  }

  factory PalletCubitState.fromMap(Map<String, dynamic> map) {
    return PalletCubitState(
      allBarcodeHistory:
          Set<String>.from(map['allBarcodeHistory'] as Set<String>),
      unit: List<Item>.from(map['unit'] as List<Item>),
      boxes: List<Box>.from(map['boxes'] as List<Box>),
      countBarcodes: map['countBarcodes'],
      countBox: map['countBox'],
      pallets: map['pallets'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PalletCubitState.fromJson(String source) =>
      PalletCubitState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PalletCubitState(allBarcodeHistory: $allBarcodeHistory, unit: $unit, boxes: $boxes, countBarcodes: $countBarcodes, countBox: $countBox, pallets: $pallets)';
  }

  @override
  bool operator ==(covariant PalletCubitState other) {
    if (identical(this, other)) return true;

    return other.allBarcodeHistory == allBarcodeHistory &&
        other.unit == unit &&
        other.boxes == boxes &&
        other.countBarcodes == countBarcodes &&
        other.countBox == countBox &&
        other.pallets == pallets;
  }

  @override
  int get hashCode {
    return allBarcodeHistory.hashCode ^
        unit.hashCode ^
        boxes.hashCode ^
        countBarcodes.hashCode ^
        countBox.hashCode ^
        pallets.hashCode;
  }
}

class PalletCubit extends Cubit<PalletCubitState> {
  PalletCubit()
      : super(
          PalletCubitState(
            allBarcodeHistory: {},
            boxes: [],
            countBarcodes: 0,
            countBox: 0,
            unit: [],
            pallets: ModelsPallet(
                barcode: 'Будущая палета',
                date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
                boxes: [],
                dateRelease: dateOfRelease,
                status: 'NotFull'),
          ),
        );

  final BarcodeService barcodeService = const BarcodeServiceImpl();

  void createUnit(
      {required String barcode, required String formattedDateTime}) {
    final Item item = Item(
      barcode: barcode,
      date: formattedDateTime,
    );

    final List<Item> newUnit = state.unit;
    newUnit.add(item);
    if (state.unit.length == 1) {
      maxIndexUnitInBox = 1;
    } else if (!(newUnit.length == maxIndexUnitInBox)) {
      maxIndexUnitInBox +=
          1; // Добавляем мах индекс 1, чтобы отслеживать последний добавленный элемент в коробку.
    }

    final int newCountBarcodes = state.countBarcodes + 1;
    final Set<String> newAllBarcodeHistory =
        Set<String>.from(state.allBarcodeHistory);
    newAllBarcodeHistory.add(barcode);

    final newState = state.copyWith(
      boxes: [...state.boxes],
      allBarcodeHistory: newAllBarcodeHistory,
      pallets: state.pallets,
      unit: newUnit,
      countBarcodes: newCountBarcodes,
      countBox: state.countBox,
    );
    emit(newState);
  }

  // Future<void> postIntermediateBarcodes() async {
  //   await barcodeService.postIntermediateBarcodes(pallets: state.pallets);
  // }

  Future<bool> postBarcodes() async {
    try {
      return await barcodeService.postBarcodes(pallets: state.pallets);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> savePalletsInCash(
      {required ListPallets modelListPallets}) async {
    try {
      return await barcodeService.savePalletsInCash(
          modelListPallets: modelListPallets, fileName: 'palletCash');
    } catch (e) {
      rethrow;
    }
  }

  void createBox({required String item}) async {
    String formattedDateTime = createDateNow();
    final List<Item> copyUnits = state.unit.sublist(0, state.unit.length - 1);
    final Box box = Box(
      barcode: item,
      date: formattedDateTime,
      items: copyUnits,
    );
    final List<Box> newBoxes = [...state.boxes];
    newBoxes.add(box);
    final ModelsPallet newPallets = state.pallets;
    newPallets.boxes = [...newBoxes];
    final int newCountBox = state.countBox + 1;

    final newState = state.copyWith(
        boxes: newBoxes,
        allBarcodeHistory: state.allBarcodeHistory,
        pallets: newPallets,
        unit: [],
        countBarcodes: state.countBarcodes,
        countBox: newCountBox);
    emit(newState);
  }

  void createPallet({required String text}) {
    String formattedDateTime = createDateNow();

    final ModelsPallet newPallets = state.pallets;
    newPallets.barcode = text;
    newPallets.date = formattedDateTime;
    newPallets.dateRelease = dateOfRelease;
    newPallets.status = 'Full';

    final newState = state.copyWith(
      boxes: [...state.boxes],
      allBarcodeHistory: state.allBarcodeHistory,
      pallets: newPallets,
      unit: [],
      countBarcodes: state.countBarcodes,
      countBox: state.countBox,
    );
    emit(newState);
  }

  void deleteBox({required int indexBox}) {
    final Set<String> newAllBarcodeHistory = {...state.allBarcodeHistory};

    final List<Box> newBoxes = [...state.boxes];
    newAllBarcodeHistory.remove(newBoxes[indexBox].barcode);
    newBoxes.removeAt(indexBox);
    final ModelsPallet newPallets = state.pallets;
    newPallets.boxes = newBoxes;

    final int newCountBarcodes = state.countBarcodes - 1;
    final int newCountBox = state.countBox - 1;

    final newState = state.copyWith(
      boxes: newBoxes,
      allBarcodeHistory: newAllBarcodeHistory,
      pallets: newPallets,
      unit: [],
      countBarcodes: newCountBarcodes,
      countBox: newCountBox,
    );
    emit(newState);
  }

  void deleteCurrentUnitOrAllUnitsInBox(
      {required bool deleteAll, required String? lastBarcode}) {
    if (deleteAll) {
      if (state.unit.isNotEmpty) {
        final int newCountBarcodes = state.countBarcodes - state.unit.length;
        final Set<String> newAllBarcodeHistory =
            Set<String>.from(state.allBarcodeHistory);
        for (var element in state.unit) {
          newAllBarcodeHistory.remove(element.barcode);
        }
        final newState = state.copyWith(
          boxes: [...state.boxes],
          allBarcodeHistory: newAllBarcodeHistory,
          pallets: state.pallets,
          unit: [],
          countBarcodes: newCountBarcodes,
          countBox: state.countBox,
        );
        emit(newState);
      }
    } else {
      final int newCountBarcodes = state.countBarcodes - 1;
      final Set<String> newAllBarcodeHistory =
          Set<String>.from(state.allBarcodeHistory);
      newAllBarcodeHistory.remove(lastBarcode);

      final List<Item> newUnit = [...state.unit];
      newUnit.removeLast();
      final newState = state.copyWith(
        boxes: [...state.boxes],
        allBarcodeHistory: newAllBarcodeHistory,
        pallets: state.pallets,
        unit: newUnit,
        countBarcodes: newCountBarcodes,
        countBox: state.countBox,
      );
      emit(newState);
    }
  }

  void clearPallet() {
    final ModelsPallet newPallets = state.pallets;
    newPallets.barcode = 'Будущая палета';
    newPallets.boxes = [];
    newPallets.date = '';
    newPallets.status = 'NotFull';
    newPallets.dateRelease = dateOfRelease;
    final newState = state.copyWith(
      boxes: [],
      allBarcodeHistory: {},
      pallets: newPallets,
      unit: [...state.unit],
      countBarcodes: 0,
      countBox: 0,
    );
    emit(newState);
  }

  void changeDateRelease({required String dateOfRelease}) {
    final ModelsPallet newPallets = state.pallets;
    newPallets.dateRelease = dateOfRelease;

    final newState = state.copyWith(
      boxes: [...state.boxes],
      allBarcodeHistory: {...state.allBarcodeHistory},
      pallets: newPallets,
      unit: [...state.unit],
      countBarcodes: state.countBarcodes,
      countBox: state.countBox,
    );
    emit(newState);
  }

  void createUnitByIndexBox(
      {required String barcode,
      required String formattedDateTime,
      required int indexBox}) {
    final Item item = Item(
      barcode: barcode,
      date: formattedDateTime,
    );

    // final List<Item> newUnit = state.unit;
    // newUnit.add(item);
    final int newCountBarcodes = state.countBarcodes + 1;
    final Set<String> newAllBarcodeHistory =
        Set<String>.from(state.allBarcodeHistory);
    newAllBarcodeHistory.add(barcode);
    final ModelsPallet newPallets = state.pallets;
    newPallets.boxes[indexBox].items.add(item);

    final newState = state.copyWith(
      boxes: [...state.boxes],
      allBarcodeHistory: newAllBarcodeHistory,
      pallets: newPallets,
      unit: [...state.unit],
      countBarcodes: newCountBarcodes,
      countBox: state.countBox,
    );
    emit(newState);
  }

  void clearBoxByIndex({required int indexBox}) {
    final Set<String> newAllBarcodeHistory = {...state.allBarcodeHistory};
    for (var element in state.pallets.boxes[indexBox].items) {
      newAllBarcodeHistory.remove(element.barcode);
    }
    final int newCountBarcodes =
        state.countBarcodes - state.pallets.boxes[indexBox].items.length;
    final ModelsPallet newPallets = state.pallets;
    newPallets.boxes[indexBox].items.clear();

    final newState = state.copyWith(
      boxes: [...state.boxes],
      allBarcodeHistory: newAllBarcodeHistory,
      pallets: newPallets,
      unit: state.unit,
      countBarcodes: newCountBarcodes,
      countBox: state.countBox,
    );
    emit(newState);
  }
}

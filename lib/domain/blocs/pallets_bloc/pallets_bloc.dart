import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';
import 'package:honest_sign_flutter_app/domain/repository/pallets_repository.dart';
import 'package:intl/intl.dart';

part 'pallets_bloc.freezed.dart';
part 'pallets_bloc.g.dart';
part 'pallets_event.dart';
part 'pallets_state.dart';

// enum TypeOfBarcode { unit, box, pallet, undefined }

// enum TypeOfStateSend { duplicate, send, notSend, valid, notValid, errorTimeout }

class PalletsBloc extends Bloc<PalletsEvent, PalletsState> {
  final PalletsRepository palletsRepository;

  PalletsBloc({
    required this.palletsRepository,
  }) : super(const PalletsState.loading()) {
    on<PalletsEvent>((event, emit) async {
      if (event is PalletsEventFetch) {
        await onPalletsEventFetch(emit);
      } else if (event is PalletsEventCreateUnit) {
        onCreateUnit(event, emit);
      } else if (event is PalletsEventCreateBox) {
        onCreateBox(event, emit);
      } else if (event is PalletsEventCreatePallet) {
        onCreatePallet(event, emit);
      } else if (event is PalletsEventChangeDateRelease) {
        onChangeDateRelease(emit);
      } else if (event is PalletsEventClearAllCurrentUnits) {
        onClearAllCurrentUnits(emit);
      } else if (event is PalletsEventClearCurrentUnitsByBarcode) {
        onClearCurrentUnitsByBarcode(event, emit);
      } else if (event is PalletsEventDeleteBoxByIndex) {
        onDeleteBoxByIndex(event, emit);
      } else if (event is PalletsEventClearBoxByIndex) {
        onClearBoxByIndex(event, emit);
      } else if (event is PalletsEventCreateUnitByIndex) {
        onCreateUnitByIndex(event, emit);
      }
    });
  }

  void onCreateUnitByIndex(
    PalletsEventCreateUnitByIndex event,
    Emitter<PalletsState> emit,
  ) {
    //Создаем дату сканирования шк
    String formattedDateTime = createDateNow();
    final Item item = Item(
      barcode: event.barcode,
      date: formattedDateTime,
    );
    final int newCountBarcodes =
        (state as PalletsStateLoaded).countBarcodes + 1;
    final Set<String> newAllBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
    newAllBarcodeHistory.add(event.barcode);
    final Set<String> newCurrentBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).currentBarcodeHistory);
    newCurrentBarcodeHistory.add(event.barcode);

    final copyList = [
      ...(state as PalletsStateLoaded).listPallets.listModelsPallet
    ];

    final List<ModelsPallet> listModelPallets = addUnitByIndex(
        pallets: copyList,
        item: item,
        palletIndex: event.indexPallet,
        boxIndex: event.indexBox);

    final ListPallets listPallets = (state as PalletsStateLoaded)
        .listPallets
        .copyWith(listModelsPallet: listModelPallets);

    final newState = (state as PalletsStateLoaded).copyWith(
        listPallets: listPallets,
        allBarcodeHistory: newAllBarcodeHistory,
        countBarcodes: newCountBarcodes,
        currentBarcodeHistory: newCurrentBarcodeHistory);
    emit(newState);
  }

  void onClearBoxByIndex(
    PalletsEventClearBoxByIndex event,
    Emitter<PalletsState> emit,
  ) {
    final Set<String> newAllBarcodeHistory = {
      ...(state as PalletsStateLoaded).allBarcodeHistory
    };
    for (var element in (state as PalletsStateLoaded)
        .listPallets
        .listModelsPallet[event.indexPallet]
        .boxes[event.indexBox]
        .items) {
      newAllBarcodeHistory.remove(element.barcode);
    }
    final Set<String> newCurrentBarcodeHistory = {
      ...(state as PalletsStateLoaded).currentBarcodeHistory
    };
    for (var element in (state as PalletsStateLoaded)
        .listPallets
        .listModelsPallet[event.indexPallet]
        .boxes[event.indexBox]
        .items) {
      newCurrentBarcodeHistory.remove(element.barcode);
    }
    final int newCountBarcodes = (state as PalletsStateLoaded).countBarcodes -
        (state as PalletsStateLoaded)
            .listPallets
            .listModelsPallet[event.indexPallet]
            .boxes[event.indexBox]
            .items
            .length;
    // final ModelsPallet newPallets = (state as PalletsStateLoaded)
    //     .listPallets
    //     .listModelsPallet[event.indexPallet]
    //     .copyWith();
    // newPallets.boxes[event.indexBox].items.clear();
    final copyList = [
      ...(state as PalletsStateLoaded).listPallets.listModelsPallet
    ];
    final List<ModelsPallet> listModelPallets =
        clearBox(copyList, event.indexPallet, event.indexBox);

    final ListPallets listPallets = (state as PalletsStateLoaded)
        .listPallets
        .copyWith(listModelsPallet: listModelPallets);

    final newState = (state as PalletsStateLoaded).copyWith(
        listPallets: listPallets,
        allBarcodeHistory: newAllBarcodeHistory,
        countBarcodes: newCountBarcodes,
        currentBarcodeHistory: newCurrentBarcodeHistory);
    emit(newState);
  }

  void onDeleteBoxByIndex(
    PalletsEventDeleteBoxByIndex event,
    Emitter<PalletsState> emit,
  ) {
    final Set<String> newAllBarcodeHistory = {
      ...(state as PalletsStateLoaded).allBarcodeHistory
    };
    newAllBarcodeHistory.remove(event.barcodeBox);
    final Set<String> newCurrentBarcodeHistory = {
      ...(state as PalletsStateLoaded).currentBarcodeHistory
    };
    newCurrentBarcodeHistory.remove(event.barcodeBox);

    final int newCountBarcodes =
        (state as PalletsStateLoaded).countBarcodes - 1;
    final int newCountBox = (state as PalletsStateLoaded).countBox - 1;

    final List<ModelsPallet> listModelPallets = removeBox(
        [...(state as PalletsStateLoaded).listPallets.listModelsPallet],
        event.indexPallet,
        event.indexBox);

    final ListPallets listPallets = (state as PalletsStateLoaded)
        .listPallets
        .copyWith(listModelsPallet: listModelPallets);

    final newState = (state as PalletsStateLoaded).copyWith(
        listPallets: listPallets,
        allBarcodeHistory: newAllBarcodeHistory,
        countBarcodes: newCountBarcodes,
        currentBarcodeHistory: newCurrentBarcodeHistory,
        countBox: newCountBox);
    emit(newState);
  }

  List<ModelsPallet> clearBox(
      List<ModelsPallet> pallets, int palletIndex, int boxIndex) {
    if (palletIndex >= 0 && palletIndex < pallets.length) {
      ModelsPallet pallet = pallets[palletIndex];
      if (boxIndex >= 0 && boxIndex < pallet.boxes.length) {
        final List<Item> copyListItems =
            List.from(pallet.boxes[boxIndex].items);
        copyListItems.clear();
        final Box newBox =
            pallet.boxes[boxIndex].copyWith(items: copyListItems);
        final copyBoxes = [...pallet.boxes];
        copyBoxes.removeAt(boxIndex);
        copyBoxes.insert(boxIndex, newBox);
        final newModelsPallet = pallet.copyWith(boxes: copyBoxes);
        pallets.removeAt(palletIndex);
        pallets.insert(palletIndex, newModelsPallet);
      }
    }

    return pallets;
  }

  List<ModelsPallet> addUnitByIndex(
      {required List<ModelsPallet> pallets,
      required int palletIndex,
      required int boxIndex,
      required Item item}) {
    if (palletIndex >= 0 && palletIndex < pallets.length) {
      ModelsPallet pallet = pallets[palletIndex];
      if (boxIndex >= 0 && boxIndex < pallet.boxes.length) {
        final List<Item> copyListItems =
            List.from(pallet.boxes[boxIndex].items);
        copyListItems.add(item);
        final Box newBox =
            pallet.boxes[boxIndex].copyWith(items: copyListItems);
        final copyBoxes = [...pallet.boxes];
        copyBoxes.removeAt(boxIndex);
        copyBoxes.insert(boxIndex, newBox);
        final newModelsPallet = pallet.copyWith(boxes: copyBoxes);
        pallets.removeAt(palletIndex);
        pallets.insert(palletIndex, newModelsPallet);
      }
    }

    return pallets;
  }

  List<ModelsPallet> removeBox(
      List<ModelsPallet> pallets, int palletIndex, int boxIndex) {
    if (palletIndex >= 0 && palletIndex < pallets.length) {
      ModelsPallet pallet = pallets[palletIndex];
      if (boxIndex >= 0 && boxIndex < pallet.boxes.length) {
        final copyBoxes = [...pallet.boxes];
        copyBoxes.removeAt(boxIndex);

        final newModelsPallet = pallet.copyWith(boxes: copyBoxes);
        pallets.removeAt(palletIndex);
        pallets.insert(palletIndex, newModelsPallet);
      }
    }

    return pallets;
  }

  void onClearAllCurrentUnits(Emitter<PalletsState> emit) {
    final int newCountBarcodes = (state as PalletsStateLoaded).countBarcodes -
        (state as PalletsStateLoaded).units.length;
    final Set<String> newAllBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
    for (var element in (state as PalletsStateLoaded).units) {
      newAllBarcodeHistory.remove(element.barcode);
    }
    final Set<String> newCurrentBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).currentBarcodeHistory);
    for (var element in (state as PalletsStateLoaded).units) {
      newCurrentBarcodeHistory.remove(element.barcode);
    }

    final newState = (state as PalletsStateLoaded).copyWith(
        units: [],
        countBarcodes: newCountBarcodes,
        allBarcodeHistory: newAllBarcodeHistory,
        currentBarcodeHistory: newCurrentBarcodeHistory);
    emit(newState);
  }

  void onClearCurrentUnitsByBarcode(
      PalletsEventClearCurrentUnitsByBarcode event,
      Emitter<PalletsState> emit) {
    final int newCountBarcodes =
        (state as PalletsStateLoaded).countBarcodes - 1;
    final Set<String> newAllBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
    newAllBarcodeHistory.remove(event.barcode);
    final Set<String> newCurrentBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).currentBarcodeHistory);
    newCurrentBarcodeHistory.remove(event.barcode);
    final List<Item> newUnit = [...(state as PalletsStateLoaded).units];
    newUnit.removeLast();

    int maxIndexUnitInBox = (state as PalletsStateLoaded).maxIndexUnitInBox - 1;

    final newState = (state as PalletsStateLoaded).copyWith(
        units: newUnit,
        countBarcodes: newCountBarcodes,
        allBarcodeHistory: newAllBarcodeHistory,
        currentBarcodeHistory: newCurrentBarcodeHistory,
        maxIndexUnitInBox: maxIndexUnitInBox);
    emit(newState);
  }

//ИЛИ СДЕЛАТЬ ОТПРАВКУ, А ПОТОМ СМЕНУ ДАТЫ РЕЛИЗА ПОДУМАТЬ!!!
  void onChangeDateRelease(Emitter<PalletsState> emit) {
    final ModelsPallet modelsPallet = (state as PalletsStateLoaded)
        .listPallets
        .listModelsPallet
        .last
        .copyWith(dateRelease: dateOfRelease);
    final List<ModelsPallet> listModelPallets = [
      ...(state as PalletsStateLoaded).listPallets.listModelsPallet
    ];
    listModelPallets.removeLast();
    listModelPallets.add(modelsPallet);

    ListPallets listPallets = (state as PalletsStateLoaded)
        .listPallets
        .copyWith(listModelsPallet: listModelPallets);
    final newState =
        (state as PalletsStateLoaded).copyWith(listPallets: listPallets);
    emit(newState);
  }

  void onCreatePallet(
      PalletsEventCreatePallet event, Emitter<PalletsState> emit) {
    //Создаем дату сканирования шк
    String formattedDateTime = createDateNow();
    // Копируем последнюю паллету с новыми занчениями
    final ModelsPallet newPallet = (state as PalletsStateLoaded)
        .listPallets
        .listModelsPallet
        .last
        .copyWith(
            barcode: event.barcode,
            date: formattedDateTime,
            dateRelease: dateOfRelease,
            status: 'Full');

    //Копирруем список паллет
    final List<ModelsPallet> listNewModelPallets = [
      ...(state as PalletsStateLoaded).listPallets.listModelsPallet
    ];
    //Удаляем и добавляем новую паллету в списко паллет
    listNewModelPallets.removeLast();
    listNewModelPallets.add(newPallet);

    // Копируем список всех ШК и добавляем туда ШК паллеты
    final Set<String> newAllBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
    newAllBarcodeHistory.add(event.barcode);

    final ModelsPallet pallet = ModelsPallet(
        barcode: 'Будущая палета',
        date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
        boxes: [],
        dateRelease: dateOfRelease,
        status: 'NotFull');

    listNewModelPallets.add(pallet);

    // В модель лист паллет добавляем полную паллету и новую паллету в списке
    // final ListPallets listPallets =
    //     ListPallets(listModelsPallet: listNewModelPallets);
    ListPallets listPallets = (state as PalletsStateLoaded)
        .listPallets
        .copyWith(listModelsPallet: listNewModelPallets);

    //Создаем новый стейт
    final newState = PalletsState.loaded(
      listPallets: listPallets,
      units: [],
      allBarcodeHistory: newAllBarcodeHistory,
      // Сбраысваем кол - во штрихкодов на 0
      countBarcodes: 0, // newAllBarcodeHistory.length,
      maxIndexUnitInBox: (state as PalletsStateLoaded).maxIndexUnitInBox,
      // Сбарысваем кол -во коробок на 0
      countBox: 0, currentBarcodeHistory: {},
    );

    emit(newState);
  }

  void onCreateBox(PalletsEventCreateBox event, Emitter<PalletsState> emit) {
    String formattedDateTime = createDateNow();

    final List<Item> copyUnits = [...(state as PalletsStateLoaded).units];
    final Box box = Box(
      barcode: event.barcode,
      date: formattedDateTime,
      items: copyUnits,
    );
    final List<Box> newBoxes = [
      ...(state as PalletsStateLoaded).listPallets.listModelsPallet.last.boxes
    ];
    newBoxes.add(box);
    //Добавляем в списки AllBarcodeHistory и CurrentBarcodeHistory отсканированных кодов
    final Set<String> newAllBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
    newAllBarcodeHistory.add(event.barcode);
    final Set<String> newCurrentBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).currentBarcodeHistory);
    newCurrentBarcodeHistory.add(event.barcode);

//Увеличиваем кол -во коробок на 1
    final int newCountBox = (state as PalletsStateLoaded).countBox + 1;

// Копируем модель паллеты с новыми значениями списка коробок
    final ModelsPallet modelsPallet = (state as PalletsStateLoaded)
        .listPallets
        .listModelsPallet
        .last
        .copyWith(boxes: newBoxes);
// Копируем списко меодлей Паллет
    List<ModelsPallet> listModelsPallet =
        (state as PalletsStateLoaded).listPallets.listModelsPallet.toList();
//Удаляем последнюю паллету и вставляем замену с новым списко коробок
    listModelsPallet.removeLast();
    listModelsPallet.add(modelsPallet);

// Копируем модель ЛистПаллет с новым списком моеделй паллет
    final ListPallets listPallets = (state as PalletsStateLoaded)
        .listPallets
        .copyWith(listModelsPallet: listModelsPallet);

    late final PalletsState newState;

    newState = PalletsState.loaded(
        listPallets: listPallets,
        units: [],
        allBarcodeHistory: newAllBarcodeHistory,
        countBarcodes: newCurrentBarcodeHistory.length,
        maxIndexUnitInBox: (state as PalletsStateLoaded).maxIndexUnitInBox,
        countBox: newCountBox,
        currentBarcodeHistory: newCurrentBarcodeHistory);

    emit(newState);
  }

  void onCreateUnit(PalletsEventCreateUnit event, Emitter<PalletsState> emit) {
    final formattedDateTime = createDateNow();
    final Item item = Item(
      barcode: event.barcode,
      date: formattedDateTime,
    );

    late List<Item> listUnits;

    if ((state as PalletsStateLoaded).units.isEmpty) {
      listUnits = [];
      listUnits.add(item);
    } else {
      listUnits = [...(state as PalletsStateLoaded).units];
      if (listUnits.length < countUnitsPerBox) {
        listUnits.add(item);
      }
    }

    int maxIndexUnitInBox = (state as PalletsStateLoaded).maxIndexUnitInBox;
    if (listUnits.length == 1) {
      maxIndexUnitInBox = 1;
    } else if (!(listUnits.length == maxIndexUnitInBox)) {
      maxIndexUnitInBox +=
          1; // Добавляем мах индекс 1, чтобы отслеживать последний добавленный элемент в коробку.
    }

    //Увеличиваем кол-во на 1
    final int newCountBarcodes =
        (state as PalletsStateLoaded).countBarcodes + 1;
    //Добавляем в список отсканированных кодов
    final Set<String> newAllBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
    newAllBarcodeHistory.add(event.barcode);
    final Set<String> newCurrentBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).currentBarcodeHistory);
    newCurrentBarcodeHistory.add(event.barcode);
    //  Копируем кол-во коробок
    final int newcountBox = (state as PalletsStateLoaded).countBox;

    ListPallets listPallets =
        (state as PalletsStateLoaded).listPallets.copyWith();

    late final PalletsState newState;

    newState = PalletsState.loaded(
      listPallets: listPallets,
      allBarcodeHistory: newAllBarcodeHistory,
      countBarcodes: newCountBarcodes,
      countBox: newcountBox,
      maxIndexUnitInBox: maxIndexUnitInBox,
      units: listUnits,
      currentBarcodeHistory: newCurrentBarcodeHistory,
    );

    emit(newState);
  }

  Future<void> onPalletsEventFetch(Emitter<PalletsState> emit) async {
    emit(const PalletsState.loading());
    try {
      // Дописать функционал восстановления из кэша( ходить в файлик и смотреть пуст он или нет)
      final ModelsPallet pallet = ModelsPallet(
          barcode: 'Будущая палета',
          date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
          boxes: [],
          dateRelease: dateOfRelease,
          status: 'NotFull');
      final List<ModelsPallet> listModelsPallet = [pallet];
      final ListPallets listPallets =
          ListPallets(listModelsPallet: listModelsPallet);

      final newState = PalletsState.loaded(
          listPallets: listPallets,
          allBarcodeHistory: {},
          countBarcodes: 0,
          countBox: 0,
          maxIndexUnitInBox: 0,
          units: [],
          currentBarcodeHistory: {});

      emit(newState);
    } on TimeoutException {
      emit(const PalletsState.error(errorText: 'Время ожидания истекло!'));
    } catch (e) {
      emit(const PalletsState.error());
    }
  }
}

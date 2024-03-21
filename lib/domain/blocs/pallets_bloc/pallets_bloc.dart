import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/model_state_pallets_bloc/model_state_pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';
import 'package:honest_sign_flutter_app/domain/repository/pallets_repository.dart';
import 'package:intl/intl.dart';

part 'pallets_bloc.freezed.dart';
part 'pallets_bloc.g.dart';
part 'pallets_event.dart';
part 'pallets_state.dart';

class PalletsBloc extends Bloc<PalletsEvent, PalletsState> {
  final PalletsRepository palletsRepository;

  PalletsBloc({
    required this.palletsRepository,
  }) : super(const PalletsState.loading()) {
    on<PalletsEvent>((event, emit) async {
      if (event is PalletsEventFetch) {
        await onPalletsEventFetch(event, emit);
      } else if (event is PalletsEventCreateUnit) {
        onCreateUnit(event, emit);
      } else if (event is PalletsEventCreateBox) {
        await onCreateBox(event, emit);
        await palletsRepository.saveState(
            numberCard: numberCardConst,
            palletState:
                (state as PalletsStateLoaded)); // ЗАПИСЬ СОСТОЯНИЯ В ХРАНИЛИЩЕ
      } else if (event is PalletsEventCreatePallet) {
        onCreatePallet(event, emit);
      } else if (event is PalletsEventChangeDateRelease) {
        onChangeDateRelease(event, emit);
      } else if (event is PalletsEventChangeBarcodeParty) {
        onChangeBarcodeParty(event, emit);
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
      } else if (event is PalletsEventSendBarcodes) {
        await onSendBarcodes(isDone: false);
      } else if (event is PalletsEventCompleteBottling) {
        await onCompleteBottling(emit);
        // ЗАКОММЕНИТРОВАНО НА ВРЕМЯ ПРОВЕРКИ ОШИБОК ПО СОСТОЯНИЕ ЕРРОРТЕКСТ
        // } else if (event is PalletsEventRemoveErrorText) {
        //   final newStateNoError = (state as PalletsStateLoaded)
        //       .copyWith(isLoading: false, errorText: null);
        //   emit(newStateNoError);
      } else if (event is PalletsEventDeletePalletByIndex) {
        onDeletePalletByIndex(event, emit);
      }
    });
  }

  void onDeletePalletByIndex(
      PalletsEventDeletePalletByIndex event, Emitter<PalletsState> emit) {
    final ModelsPallet modelsPallet = (state as PalletsStateLoaded)
        .listPallets
        .listModelsPallet[event.indexPallet];

    final Set<String> newAllBarcodeHistory = {
      ...(state as PalletsStateLoaded).allBarcodeHistory
    };
// Закоментировано на проверку вроде безполезная вещь
    // final Set<String> newCurrentBarcodeHistory = {
    //   ...(state as PalletsStateLoaded).currentBarcodeHistory
    // };

    for (var box in modelsPallet.boxes) {
      newAllBarcodeHistory.remove(box.barcode);
      // Закоментировано на проверку вроде безполезная вещь
      // newCurrentBarcodeHistory.remove(box.barcode);

      for (var item in box.items) {
        // Закоментировано на проверку вроде безполезная вещь
        // newCurrentBarcodeHistory.remove(item.barcode);
        newAllBarcodeHistory.remove(item.barcode);
      }
    }
// Закоментировано на проверку вроде безполезная вещь
    // newCurrentBarcodeHistory.remove(modelsPallet.barcode);
    newAllBarcodeHistory.remove(modelsPallet.barcode);

    final List<ModelsPallet> newListModelsPallet = [
      ...(state as PalletsStateLoaded).listPallets.listModelsPallet
    ];
    newListModelsPallet.removeAt(event.indexPallet);

    final newListPallets = (state as PalletsStateLoaded)
        .listPallets
        .copyWith(listModelsPallet: newListModelsPallet);

    final newState = (state as PalletsStateLoaded).copyWith(
      listPallets: newListPallets,
      // currentBarcodeHistory: newCurrentBarcodeHistory, // Закоментировано на проверку вроде безполезная вещь
      allBarcodeHistory: newAllBarcodeHistory,
    );
    emit(newState);
  }

  Future<void> onCompleteBottling(Emitter<PalletsState> emit) async {
    try {
      final newStateLoading = (state as PalletsStateLoaded)
          .copyWith(isLoading: true, errorText: null);
      emit(newStateLoading);
      final isSend = await onSendBarcodes(isDone: true); //Отправляем паллеты
      if (isSend) {
        await onCompleteBottlingClearState(); //Отчищаем стейт
        emit(const PalletsStateCloseApp()); //Закрываем приложение
      } else {
        final newStateError = (state as PalletsStateLoaded).copyWith(
            isLoading: false, errorText: 'Ошибка соеденения с инетернетом!');
        emit(newStateError);
      }
    } catch (e) {
      final String message = e.toString().replaceAll('Exception: ', '');
      final newStateError = (state as PalletsStateLoaded)
          .copyWith(isLoading: false, errorText: message);
      emit(newStateError);
    }
  }

  Future<void> onCompleteBottlingClearState() async {
    try {
      await palletsRepository.deleteState(
        numberCard: numberCardConst,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onSendBarcodes({required bool isDone}) async {
    try {
      if (state is PalletsStateLoaded) {
        await palletsRepository.saveState(
            numberCard: numberCardConst,
            palletState: (state as PalletsStateLoaded));
        final isSend = await palletsRepository.sendBarcodes(
            listPallets: (state as PalletsStateLoaded).listPallets,
            isDone: isDone);
        return isSend;
      }
      return false;
    } catch (e) {
      rethrow;
    }
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
    // final Set<String> newCurrentBarcodeHistory =
    //     Set<String>.from((state as PalletsStateLoaded).currentBarcodeHistory);
    // newCurrentBarcodeHistory.add(event.barcode);

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
      // currentBarcodeHistory: newCurrentBarcodeHistory
    );
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
  void onChangeDateRelease(
      PalletsEventChangeDateRelease event, Emitter<PalletsState> emit) {
//Копируем список паллет
    final List<ModelsPallet> listModelPallets = [
      ...(state as PalletsStateLoaded).listPallets.listModelsPallet
    ];
//Проверяем есть ли индекс паллеты или это изменения для следующей паллеты
    if (event.indexPallet != null) {
//Берем по Индексу модель паллеты, копируем ее с новой датой
      final ModelsPallet modelsPallet = (state as PalletsStateLoaded)
          .listPallets
          .listModelsPallet[event.indexPallet!]
          .copyWith(dateRelease: event.newDateOfRelease);
//Удаляем по Индексу модель и вставляем новую по Индексу в списке паллет
      listModelPallets.removeAt(event.indexPallet!);
      listModelPallets.insert(event.indexPallet!, modelsPallet);
    } else {
//Берем последнюю модель паллеты, копируем ее с новой датой
      final ModelsPallet modelsPallet = (state as PalletsStateLoaded)
          .listPallets
          .listModelsPallet
          .last
          .copyWith(dateRelease: event.newDateOfRelease);

//Удаляем последнюю модель и вставляем новую в списке паллет
      listModelPallets.removeLast();
      listModelPallets.add(modelsPallet);
    }

//Копируем модель ListPallets с новым списком
    ListPallets listPallets = (state as PalletsStateLoaded)
        .listPallets
        .copyWith(listModelsPallet: listModelPallets);
    final newState =
        (state as PalletsStateLoaded).copyWith(listPallets: listPallets);
    emit(newState);
  }

  /// Изменение Партионного ШК
  void onChangeBarcodeParty(
      PalletsEventChangeBarcodeParty event, Emitter<PalletsState> emit) {
    //Копируем список паллет
    final List<ModelsPallet> listModelPallets = [
      ...(state as PalletsStateLoaded).listPallets.listModelsPallet
    ];
//Проверяем есть ли индекс паллеты или это изменения для следующей паллеты
    if (event.indexPallet != null) {
//Берем по Индексу модель паллеты, копируем ее с новым Партионным ШК
      final ModelsPallet modelsPallet = (state as PalletsStateLoaded)
          .listPallets
          .listModelsPallet[event.indexPallet!]
          .copyWith(barcodeParty: event.newBarcodeOfParty);
//Удаляем по Индексу модель и вставляем новую по Индексу в списке паллет
      listModelPallets.removeAt(event.indexPallet!);
      listModelPallets.insert(event.indexPallet!, modelsPallet);
    } else {
//Берем последнюю модель паллеты, копируем ее с новым Партионным ШК
      final ModelsPallet modelsPallet = (state as PalletsStateLoaded)
          .listPallets
          .listModelsPallet
          .last
          .copyWith(barcodeParty: event.newBarcodeOfParty);

//Удаляем последнюю модель и вставляем новую в списке паллет
      listModelPallets.removeLast();
      listModelPallets.add(modelsPallet);
    }

//Копируем модель ListPallets с новым списком
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
            barcode: event.barcode, // ШК честный знак
            // TODO: barcodeParty: event.barcodeParty,
            // barcodeParty: futureBarcodeParty.toString(), // ШК партионный
            date: formattedDateTime,
            status: 'Full');

//Копирруем список паллет
    final List<ModelsPallet> listNewModelPallets = [
      ...(state as PalletsStateLoaded).listPallets.listModelsPallet
    ];
    //Удаляем и добавляем новую паллету в список паллет
    listNewModelPallets.removeLast();
    listNewModelPallets.add(newPallet);

// Копируем список всех ШК и добавляем туда ШК паллеты
    final Set<String> newAllBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
    newAllBarcodeHistory.add(event.barcode);

    final ModelsPallet pallet = ModelsPallet(
        barcode: nameFuturePallet,
        barcodeParty: null,
        date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
        boxes: [],
        dateRelease: dateOfRelease.toString(),
        status: 'NotFull');

    listNewModelPallets.add(pallet);

// В модель лист паллет добавляем полную паллету и новую паллету в списке

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

  Future<void> onCreateBox(
      PalletsEventCreateBox event, Emitter<PalletsState> emit) async {
//Создаем дату "пика" ШК
    String formattedDateTime = createDateNow();
//Создаем коробку
    final List<Item> copyUnits = [...(state as PalletsStateLoaded).units];
    final Box box = Box(
      barcode: event.barcode,
      date: formattedDateTime,
      items: copyUnits,
    );
//Копируем список коробок
    List<Box> newBoxes = [
      ...(state as PalletsStateLoaded).listPallets.listModelsPallet.last.boxes
    ];
//Проверяем на количество коробок, если паллет полон, о создаем новый паллет
    if (newBoxes.length == countBoxesPerPallet) {
//Копирруем список паллет
      final List<ModelsPallet> listNewModelPallets = [
        ...(state as PalletsStateLoaded).listPallets.listModelsPallet
      ];
// Копируем список всех ШК и добавляем туда ШК паллеты
      final Set<String> newAllBarcodeHistory =
          Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
      newAllBarcodeHistory.add(event.barcode);

      final ModelsPallet pallet = ModelsPallet(
          barcode: nameFuturePallet,
          barcodeParty: nameFuturePallet,
          date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
          boxes: [],
          dateRelease: dateOfRelease,
          status: 'NotFull');

      listNewModelPallets.add(pallet);

// В модель лист паллет добавляем полную паллету и новую паллету в списке

      ListPallets listPallets = (state as PalletsStateLoaded)
          .listPallets
          .copyWith(listModelsPallet: listNewModelPallets);

      final newState =
          (state as PalletsStateLoaded).copyWith(listPallets: listPallets);

      emit(newState);
      newBoxes = [
        ...(state as PalletsStateLoaded).listPallets.listModelsPallet.last.boxes
      ];
    }

// Добавляем коробку в список коробок
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
// //Увеличиваем кол-во на 1
    final int newCountBarcodes =
        (state as PalletsStateLoaded).countBarcodes + 1;
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
        countBarcodes: newCountBarcodes,
        maxIndexUnitInBox: (state as PalletsStateLoaded).maxIndexUnitInBox,
        countBox: newCountBox,
        currentBarcodeHistory: newCurrentBarcodeHistory);

    emit(newState);
  }

  void onCreateUnit(PalletsEventCreateUnit event, Emitter<PalletsState> emit) {
//Создаем дату "пика" ШК
    final formattedDateTime = createDateNow();
// Создаем штучку
    final Item item = Item(
      barcode: event.barcode,
      date: formattedDateTime,
    );

    late List<Item> listUnits;

//Проверка на пустой список
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

// Копируем модель ListPallets
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

  Future<void> onPalletsEventFetch(
      PalletsEventFetch event, Emitter<PalletsState> emit) async {
    emit(const PalletsState.loading());
    try {
      final statePallet = await palletsRepository.loadState(
        numberCard: event.numberCard,
      );
      if (statePallet != null) {
        final newState = PalletsState.loaded(
            listPallets: statePallet.listPallets,
            allBarcodeHistory: statePallet.allBarcodeHistory,
            countBarcodes: statePallet.countBarcodes,
            countBox: statePallet.countBox,
            maxIndexUnitInBox: statePallet.maxIndexUnitInBox,
            units: statePallet.units,
            currentBarcodeHistory: statePallet.currentBarcodeHistory,
            isNewRelease: false);

        emit(newState);
      } else {
        final ModelsPallet pallet = ModelsPallet(
            barcode: nameFuturePallet,
            barcodeParty: nameFuturePallet,
            date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
            boxes: [],
            dateRelease: dateOfRelease.toString(),
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
          currentBarcodeHistory: {},
          isNewRelease: true,
        );

        emit(newState);
      }
    } on TimeoutException {
      emit(const PalletsState.error(errorText: 'Время ожидания истекло!'));
    } catch (e) {
      emit(const PalletsState.error());
    }
  }
}

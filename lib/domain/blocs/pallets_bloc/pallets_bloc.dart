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
      }
    });
  }

//ИЛИ СДЕЛАТЬ ОТПРАВКУ, А ПОТОМ СМЕНУ ДАТЫ РЕЛИЗА ПОДУМАТЬ!!!
  void onChangeDateRelease(
    Emitter<PalletsState> emit, {
    required String dateRelease,
  }) {
    final ModelsPallet modelsPallet = (state as PalletsStateLoaded)
        .listPallets
        .listModelsPallet
        .last
        .copyWith(dateRelease: dateOfRelease);
    final List<ModelsPallet> listModelPallets =
        (state as PalletsStateLoaded).listPallets.listModelsPallet;
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

    int maxIndexUnitInBox = 0;
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

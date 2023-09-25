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

enum TypeOfBarcode { unit, box, pallet, undefined }

enum TypeOfStateSend { duplicate, send, notSend, valid, notValid, errorTimeout }

class PalletsBloc extends Bloc<PalletsEvent, PalletsState> {
  final PalletsRepository palletsRepository;

  PalletsBloc({
    required this.palletsRepository,
  }) : super(const PalletsState.loading()) {
    on<PalletsEvent>((event, emit) async {
      if (event is PalletsEventFetch) {
        await onPalletsEventFetch(emit);
      } else if (event is PalletsEventOnSubmited) {
        onSubmittedTextField(emit: emit, event: event);
      }
    });
  }

  bool checkDublicateBarcodeInPallet({required String barcode}) {
    final bool isDuplicate =
        (state as PalletsStateLoaded).allBarcodeHistory.contains(barcode);
    return isDuplicate;
  }

  TypeOfBarcode isValidBarcode(String barcode) {
    if (barcode.length == 18 && barcode.startsWith('1')) {
      return TypeOfBarcode.pallet;
    } else {
      if (barcode.length == 18 && barcode.startsWith('0')) {
        return TypeOfBarcode.box;
      } else {
        if (barcode.length >= 37) {
          return TypeOfBarcode.unit;
        } else {
          return TypeOfBarcode.undefined;
        }
      }
    }
  }

  Future<TypeOfStateSend> onSubmittedTextField({
    required Emitter<PalletsState> emit,
    required PalletsEventOnSubmited event,
  }) async {
    final isDuplicate = checkDublicateBarcodeInPallet(barcode: event.barcode);
    if (isDuplicate) {
      return TypeOfStateSend.duplicate;
    } else {
      final TypeOfBarcode typeBarcode = isValidBarcode(event.barcode);

      switch (typeBarcode) {
        case TypeOfBarcode.pallet:
          {
            onCreatePallet(event, emit);
            return TypeOfStateSend.send;
          }
        case TypeOfBarcode.box:
          {
            onCreateBox(event, emit);
            return TypeOfStateSend.send;
          }
        case TypeOfBarcode.unit:
          {
            onCreateUnit(event, emit);
            return TypeOfStateSend.send;
          }
        default:
          return TypeOfStateSend.notValid;
      }
    }
  }

  void onCreatePallet(
      PalletsEventOnSubmited event, Emitter<PalletsState> emit) {
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

    // В моедль лист паллет добавляем новую паллету в списке
    final ListPallets listPallets =
        ListPallets(listModelsPallet: listNewModelPallets);

    //Создаем новый стейт
    final newState = PalletsState.loaded(
      listPallets: listPallets,
      units: [],
      allBarcodeHistory: newAllBarcodeHistory,
      // Увеличиваем кол- во ШК на 1
      countBarcodes: newAllBarcodeHistory.length + 1,
      maxIndexUnitInBox: (state as PalletsStateLoaded).maxIndexUnitInBox,
      countBox: (state as PalletsStateLoaded).countBox,
    );

    emit(newState);
  }

  void onCreateBox(PalletsEventOnSubmited event, Emitter<PalletsState> emit) {
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
    //Добавляем в список отсканированных кодов
    final Set<String> newAllBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
    newAllBarcodeHistory.add(event.barcode);

    final int newCountBox = (state as PalletsStateLoaded).countBox + 1;
    final ListPallets listPallets = (state as PalletsStateLoaded)
        .listPallets
        .copyWith(
            listModelsPallet: (state as PalletsStateLoaded)
                .listPallets
                .listModelsPallet
                .map((e) => e.copyWith(boxes: newBoxes))
                .toList());

    final newState = PalletsState.loaded(
        listPallets: listPallets,
        units: [],
        allBarcodeHistory: newAllBarcodeHistory,
        countBarcodes: newAllBarcodeHistory.length,
        maxIndexUnitInBox: (state as PalletsStateLoaded).maxIndexUnitInBox,
        countBox: newCountBox);

    emit(newState);
  }

  void onCreateUnit(PalletsEventOnSubmited event, Emitter<PalletsState> emit) {
    final formattedDateTime = createDateNow();
    final Item item = Item(
      barcode: event.barcode,
      date: formattedDateTime,
    );

    final List<Item> listUnits = [];

    if ((state as PalletsStateLoaded).units.isEmpty) {
      listUnits.add(item);
    } else {
      final List<Item> listUnits = [...(state as PalletsStateLoaded).units];
      listUnits.add(item);
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
    Set<String> newAllBarcodeHistory = onNewBarcodeInHistory(event);
    //  Копируем кол-во коробок
    final int newcountBox = (state as PalletsStateLoaded).countBox;

    ListPallets listPallets =
        (state as PalletsStateLoaded).listPallets.copyWith();

    final newState = PalletsState.loaded(
        listPallets: listPallets,
        allBarcodeHistory: newAllBarcodeHistory,
        countBarcodes: newCountBarcodes,
        countBox: newcountBox,
        maxIndexUnitInBox: maxIndexUnitInBox,
        units: listUnits);
    emit(newState);
  }

  Set<String> onNewBarcodeInHistory(PalletsEventOnSubmited event) {
    //Добавляем в список отсканированных кодов
    final Set<String> newAllBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
    newAllBarcodeHistory.add(event.barcode);
    return newAllBarcodeHistory;
  }

  Future<void> onPalletsEventFetch(Emitter<PalletsState> emit) async {
    emit(const PalletsState.loading());
    try {
      // Дописать функционал восстановления из кэша( ходить в файлик и смотреть пуст он или нет)
      final ModelsPallet pallet = ModelsPallet(
          barcode: 'Будущая палета',
          date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
          boxes: [],
          dateRelease: '',
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
          units: []);

      emit(newState);
    } on TimeoutException {
      emit(const PalletsState.error(errorText: 'Время ожидания истекло!'));
    } catch (e) {
      emit(const PalletsState.error());
    }
  }
}

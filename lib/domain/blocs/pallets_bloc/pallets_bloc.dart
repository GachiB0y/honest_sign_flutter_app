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
      }
    });
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
    //Добавляем в список отсканированных кодов
    final Set<String> newAllBarcodeHistory =
        Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
    newAllBarcodeHistory.add(event.barcode);

    // final ModelsPallet newPallets = (state as PalletsStateLoaded)
    //     .listPallets
    //     .listModelsPallet
    //     .last
    //     .copyWith(boxes: newBoxes);

    final int newCountBox = (state as PalletsStateLoaded).countBox + 1;
    final ListPallets listPallets = (state as PalletsStateLoaded)
        .listPallets
        .copyWith(
            listModelsPallet: (state as PalletsStateLoaded)
                .listPallets
                .listModelsPallet
                .map((e) => e.copyWith(boxes: newBoxes))
                .toList());

    /// ОШИБКА ЗДЕСЬ, НЕЛЬЗЯ ИММУТАБЛЕ КЛАСС МУТИРОВАТЬ
    // listPallets.listModelsPallet.add(newPallets);

    final newState = PalletsState.loaded(
        listPallets: listPallets,
        units: [],
        allBarcodeHistory: newAllBarcodeHistory,
        countBarcodes: newAllBarcodeHistory.length,
        maxIndexUnitInBox: (state as PalletsStateLoaded).maxIndexUnitInBox,
        countBox: newCountBox);

    emit(newState);
  }

  void onCreateUnit(PalletsEventCreateUnit event, Emitter<PalletsState> emit) {
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
    // listPallets.listPallets.last.boxes.last.items.addAll(listUnits);
    final newState = PalletsState.loaded(
        listPallets: listPallets,
        allBarcodeHistory: newAllBarcodeHistory,
        countBarcodes: newCountBarcodes,
        countBox: newcountBox,
        maxIndexUnitInBox: maxIndexUnitInBox,
        units: listUnits);
    emit(newState);
  }

  Set<String> onNewBarcodeInHistory(PalletsEventCreateUnit event) {
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

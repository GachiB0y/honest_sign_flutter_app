import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
        final Item item = Item(
          barcode: event.barcode,
          date: event.formattedDateTime,
        );

        final List<Item> listItems = [];
        if ((state as PalletsStateLoaded)
            .listPallets
            .listPallets
            .last
            .boxes
            .isEmpty) {
          listItems.add(item);
        } else {
          final List<Item> listItems = [
            ...(state as PalletsStateLoaded)
                .listPallets
                .listPallets
                .last
                .boxes
                .last
                .items
          ];
          listItems.add(item);
        }

        int maxIndexUnitInBox = 0;
        if (listItems.length == 1) {
          maxIndexUnitInBox = 1;
        } else if (!(listItems.length == maxIndexUnitInBox)) {
          maxIndexUnitInBox +=
              1; // Добавляем мах индекс 1, чтобы отслеживать последний добавленный элемент в коробку.
        }

        final int newCountBarcodes =
            (state as PalletsStateLoaded).countBarcodes + 1;
        final Set<String> newAllBarcodeHistory =
            Set<String>.from((state as PalletsStateLoaded).allBarcodeHistory);
        newAllBarcodeHistory.add(event.barcode);
        final int newcountBox = (state as PalletsStateLoaded).countBox;

        ListPallets listPallets =
            (state as PalletsStateLoaded).listPallets.copyWith();
        listPallets.listPallets.last.boxes.last.items.addAll(listItems);
        final newState = PalletsState.loaded(
            listPallets: listPallets,
            allBarcodeHistory: newAllBarcodeHistory,
            countBarcodes: newCountBarcodes,
            countBox: newcountBox,
            maxIndexUnitInBox: maxIndexUnitInBox);
        emit(newState);
      }
    });
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
      final List<ModelsPallet> list = [pallet];
      final ListPallets listPallets = ListPallets(listPallets: list);

      final newState = PalletsState.loaded(
          listPallets: listPallets,
          allBarcodeHistory: {},
          countBarcodes: 0,
          countBox: 0,
          maxIndexUnitInBox: 0);

      emit(newState);
    } on TimeoutException {
      emit(const PalletsState.error(errorText: 'Время ожидания истекло!'));
    } catch (e) {
      emit(const PalletsState.error());
    }
  }
}

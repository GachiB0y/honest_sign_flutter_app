import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';
import 'package:honest_sign_flutter_app/domain/repository/pallets_repository.dart';

import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:intl/intl.dart';

void main() {
  group('PalletsBloc', () {
    late PalletsBloc palletsBloc;

    setUp(() {
      const BarcodeService palletsProvider = BarcodeServiceImpl();
      final PalletsRepository palletsRepository =
          PalletsRepositoryImpl(palletsProvider: palletsProvider);

      palletsBloc = PalletsBloc(palletsRepository: palletsRepository);
    });
    test('initial state is PalletsState.loading()', () {
      expect(palletsBloc.state, const PalletsState.loading());
    });
    group('PalletsBloc fetching', () {
      blocTest(
        'fetch pallets  when PalletsEventFetch is added',
        build: () => palletsBloc,
        act: (bloc) => bloc.add(const PalletsEventFetch()),
        expect: () => <PalletsState>[
          const PalletsState.loading(),
          PalletsState.loaded(
              listPallets: ListPallets(listModelsPallet: [
                ModelsPallet(
                    barcode: 'Будущая палета',
                    date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
                    dateRelease: '',
                    status: 'NotFull',
                    boxes: [])
              ]),
              units: [],
              allBarcodeHistory: {},
              countBarcodes: 0,
              maxIndexUnitInBox: 0,
              countBox: 0),
        ],
      );
    });

    group('add Units', () {
      late final String barcode;
      late final Item item;
      final List<Item> listUnits = [];
      late final ModelsPallet pallet;
      final List<ModelsPallet> listModelPallet = [];
      late final ListPallets listPallets;
      final date = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());

      setUp(() {
        barcode = '228';
        item = Item(
          barcode: '228',
          date: date,
        );

        listUnits.add(item);

        pallet = ModelsPallet(
            barcode: 'Будущая палета',
            date: date,
            boxes: [],
            dateRelease: '',
            status: 'NotFull');
        listModelPallet.add(pallet);
        listPallets = ListPallets(listModelsPallet: listModelPallet);
      });
      blocTest(
        'add First Units  in box  when PalletsEventCreateUnit is added',
        build: () => palletsBloc,
        seed: () => PalletsState.loaded(
            listPallets: ListPallets(listModelsPallet: [
              ModelsPallet(
                  barcode: 'Будущая палета',
                  date: date,
                  dateRelease: '',
                  status: 'NotFull',
                  boxes: [])
            ]),
            units: [],
            allBarcodeHistory: {},
            countBarcodes: 0,
            maxIndexUnitInBox: 0,
            countBox: 0),
        act: (bloc) => bloc.add(PalletsEventCreateUnit(
          barcode: barcode,
        )),
        expect: () => <PalletsStateLoaded>[
          PalletsStateLoaded(
              listPallets: listPallets,
              allBarcodeHistory: {barcode},
              countBarcodes: 1,
              maxIndexUnitInBox: 1,
              countBox: 0,
              units: listUnits)
        ],
      );
    });

    group('add Boxes', () {
      final dateNow = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());
      const String barcodeBox = '228';
      late final Set<String> barcodes;
      late final Box box;
      late List<Item> listUnits = [];
      late final ModelsPallet pallet;
      final List<ModelsPallet> listModelPallet = [];
      late final ListPallets listPallets;

      setUp(() {
        barcodes = {'1', '2', '3', '4', '5', '6', '7', '8'};
        final iterable = barcodes.map((e) => Item(barcode: e, date: dateNow));
        listUnits.addAll(iterable);
        box = Box(barcode: barcodeBox, date: dateNow, items: listUnits);
        barcodes.add(barcodeBox);

        pallet = ModelsPallet(
            barcode: 'Будущая палета',
            date: dateNow,
            boxes: [box],
            dateRelease: '',
            status: 'NotFull');
        listModelPallet.add(pallet);
        listPallets = ListPallets(listModelsPallet: listModelPallet);
      });
      blocTest(
        'add First Box  in pallet  when PalletsEventCreateBox is added',
        build: () => palletsBloc,
        seed: () => PalletsState.loaded(
            listPallets: ListPallets(listModelsPallet: [
              ModelsPallet(
                  barcode: 'Будущая палета',
                  date: dateNow,
                  dateRelease: '',
                  status: 'NotFull',
                  boxes: [])
            ]),
            units: listUnits,
            allBarcodeHistory: barcodes.take(8).toSet(),
            countBarcodes: 8,
            maxIndexUnitInBox: 8,
            countBox: 0),
        act: (bloc) => bloc.add(const PalletsEventCreateBox(
          barcode: barcodeBox,
        )),
        expect: () => <PalletsStateLoaded>[
          PalletsStateLoaded(
              listPallets: listPallets,
              allBarcodeHistory: barcodes,
              countBarcodes: barcodes.length,
              maxIndexUnitInBox: 8,
              countBox: 1,
              units: [])
        ],
      );
    });
  });
}

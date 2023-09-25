import 'package:honest_sign_flutter_app/constants.dart';
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
        barcode = '0104630037511697215b;WOslyn2HS+93dUMT';
        item = Item(
          barcode: barcode,
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
        'add First Units  in box  when PalletsEventOnSubmited is added',
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
        act: (bloc) => bloc.add(PalletsEventOnSubmited(
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
      const String barcodeBox = '046070721946531744';
      late final Set<String> barcodes;
      late final Box box;
      late List<Item> listUnits = [];
      late final ModelsPallet pallet;
      final List<ModelsPallet> listModelPallet = [];
      late final ListPallets listPallets;

      setUp(() {
        barcodes = {
          '0104630037511697215(4ZOOX(tXL6T93sRYZ',
          '0104630037511697215(4ZOOX(tXL6T93шRYR',
          '0104630037511697215(4ZOOX(tXL6T93IoKR',
          '0104630037511697215(4ZPkX(tXL6T93sRYZ',
          '0104630037511697215(p07OX(tXL6T93sRYZ',
          '0104630037511697215(4ZOOX(tX(8Y93sRYZ',
          '0104630037511697215(4ZOOX(tXL6T93sRIh',
          '0104630037511699215(4ZOOX(tXL6T93sRYZ'
        };
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
        'add First Box  in pallet  when PalletsEventOnSubmited is added',
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
        act: (bloc) => bloc.add(const PalletsEventOnSubmited(
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

    group('add Pallets', () {
      final dateNow = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());
      const String barcodeBoxOne = '046070721946531744';
      const String barcodeBoxTwo = '046070721946531742';
      const String barcodePallet = '146070721946531744';
      late final Set<String> barcodesUnitsOne;
      late final Set<String> barcodesUnitsTwo;
      late final Box boxOne;
      late final Box boxTwo;
      late List<Item> listUnits = [];
      late final ModelsPallet pallet;
      final List<ModelsPallet> listModelPallet = [];
      late final ListPallets listPallets;
      final Set<String> allBarcodeHistory = {};

      setUp(() {
        barcodesUnitsOne = {
          '0104630037511697215o4ZOOXUTtXL6T93sRYZ',
          '0104630037511697215UT4ZOOXUTtXL6T93шRYR',
          '0104630037511697215UT4ZOOXUTtXL6T93IoKR',
          '0104630037511697215UT4ZPkXUTtXL6T93sRYZ'
        };

        allBarcodeHistory.addAll(barcodesUnitsOne);
        final iterableOne =
            barcodesUnitsOne.map((e) => Item(barcode: e, date: dateNow));
        listUnits.addAll(iterableOne);

        boxOne = Box(barcode: barcodeBoxOne, date: dateNow, items: listUnits);
        allBarcodeHistory.add(barcodeBoxOne);
        listUnits = [];

        barcodesUnitsTwo = {
          '0104630037511697215Rp07OXRtXL6T93sRYZ',
          '0104630037511697215R4ZOOXRtXR8Y93sRYZ',
          '0104630037511697215R4ZOOXRtXL6T93sRIh',
          '0104630037511699215R4ZOOXRtXL6T93sRYZ'
        };

        allBarcodeHistory.addAll(barcodesUnitsTwo);
        final iterableTwo =
            barcodesUnitsTwo.map((e) => Item(barcode: e, date: dateNow));
        listUnits.addAll(iterableTwo);
        boxTwo = Box(barcode: barcodeBoxTwo, date: dateNow, items: listUnits);
        allBarcodeHistory.add(barcodeBoxTwo);

        dateOfRelease = '11.11.1111';

        pallet = ModelsPallet(
            barcode: barcodePallet,
            date: dateNow,
            boxes: [boxOne, boxTwo],
            dateRelease: '11.11.1111',
            status: 'Full');
        listModelPallet.add(pallet);
        listPallets = ListPallets(listModelsPallet: listModelPallet);
      });
      blocTest(
        'add First PALLETS  when PalletsEventOnSubmited is added',
        build: () => palletsBloc,
        seed: () => PalletsState.loaded(
            listPallets: ListPallets(
              listModelsPallet: [
                ModelsPallet(
                  barcode: 'Будущая палета',
                  date: dateNow,
                  dateRelease: '11.11.1111',
                  status: 'NotFull',
                  boxes: [boxOne, boxTwo],
                ),
              ],
            ),
            units: listUnits,
            allBarcodeHistory: allBarcodeHistory,
            countBarcodes: allBarcodeHistory.length,
            maxIndexUnitInBox: 4,
            countBox: 2),
        act: (bloc) {
          allBarcodeHistory.add(barcodePallet);
          bloc.add(const PalletsEventOnSubmited(
            barcode: barcodePallet,
          ));
        },
        expect: () => <PalletsStateLoaded>[
          PalletsStateLoaded(
              listPallets: listPallets,
              allBarcodeHistory: allBarcodeHistory,
              countBarcodes: (allBarcodeHistory.length + 1),
              maxIndexUnitInBox: 4,
              countBox: 2,
              units: [])
        ],
      );
    });
  });
}

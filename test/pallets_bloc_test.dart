import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/data_provider/session_data_provider.dart';
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
      const SessionDataProvdier sessionDataProvdier =
          SessionDataProvdierDefault();
      final PalletsRepository palletsRepository = PalletsRepositoryImpl(
          palletsProvider: palletsProvider,
          sessionDataProvdier: sessionDataProvdier);

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
              countBox: 0,
              currentBarcodeHistory: {}),
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
            countBox: 0,
            currentBarcodeHistory: {}),
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
              units: listUnits,
              currentBarcodeHistory: {barcode}),
        ],
      );
    });

    group('add Boxes', () {
      final dateNow = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());
      const String barcodeBox = '046070721946531744';
      final Set<String> barcodes = {
        '010463003751169721514ZOOX1tXL6T93sRYZ',
        '010463003751169721514ZOOX1tXL6T93шRYR',
        '010463003751169721514ZOOX1tXL6T93IoKR',
        '010463003751169721514ZPkX1tXL6T93sRYZ',
        '01046300375116972151p07OX1tXL6T93sRYZ',
        '010463003751169721514ZOOX1tX18Y93sRYZ',
        '010463003751169721514ZOOX1tXL6T93sRIh',
        '010463003751169921514ZOOX1tXL6T93sRYZ'
      };
      late final Box box;
      late List<Item> listUnits = [];

      late final ModelsPallet pallet;
      final List<ModelsPallet> listModelPallet = [];
      late final ListPallets listPallets;

      setUp(() {
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
          countBox: 0,
          currentBarcodeHistory: barcodes.take(8).toSet(),
        ),
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
              units: [],
              currentBarcodeHistory: barcodes)
        ],
      );
    });

    group('delete Two Current Units when added Box', () {
      final dateNow = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());
      const String barcodeBox = '046070721946531744';
      final Set<String> barcodes = {
        '010463003751169721524ZOOX2tXL6T93sRYZ',
        '010463003751169721524ZOOX2tXL6T93шRYR',
        '010463003751169721524ZOOX2tXL6T93IoKR',
        '010463003751169721524ZPkX2tXL6T93sRYZ',
        '01046300375116972152p07OX2tXL6T93sRYZ',
        '010463003751169721524ZOOX2tX28Y93sRYZ',
        '010463003751169721524ZOOX2tXL6T93sRIh',
        '010463003751169921524ZOOX2tXL6T93sRYZ'
      };
      final Set<String> barcodesHistoryForDelete = {};
      late final Box box;
      late List<Item> listUnits = [];
      final List<Item> listUnitsForDelete = [];
      late final ModelsPallet pallet;
      final List<ModelsPallet> listModelPallet = [];
      late final ListPallets listPallets;
      const String barcode = '0104630037511697215b;WOslyn2HS+93dUMT';
      const String barcodeTwo = '0104630037511697215b;WOslyn2HS+93dYYY';

      setUp(() {
        final iterable = barcodes.map((e) => Item(barcode: e, date: dateNow));
        listUnits.addAll(iterable);
        listUnitsForDelete.add(Item(
          barcode: '0104630037511697215b;WOslyn2HS+93dUMT',
          date: dateNow,
        ));
        listUnitsForDelete.add(Item(
          barcode: '0104630037511697215b;WOslyn2HS+93dYYY',
          date: dateNow,
        ));
        box = Box(barcode: barcodeBox, date: dateNow, items: listUnits);
        barcodes.add(barcodeBox);
        barcodesHistoryForDelete.addAll(barcodes);
        barcodesHistoryForDelete.add(barcode);
        barcodesHistoryForDelete.add(barcodeTwo);

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
        'delete Two Current Units  when PalletsEventClearAllCurrentUnits is added',
        build: () => palletsBloc,
        seed: () => PalletsState.loaded(
            listPallets: listPallets,
            units: listUnitsForDelete,
            allBarcodeHistory: barcodesHistoryForDelete,
            countBarcodes: barcodesHistoryForDelete.length,
            maxIndexUnitInBox: 2,
            countBox: 1,
            currentBarcodeHistory: barcodesHistoryForDelete),
        act: (bloc) => bloc.add(const PalletsEvent.clearAllCurrentUnits()),
        expect: () => <PalletsStateLoaded>[
          PalletsStateLoaded(
              listPallets: listPallets,
              allBarcodeHistory: barcodes,
              countBarcodes: barcodes.length,
              maxIndexUnitInBox: 2,
              countBox: 1,
              units: [],
              currentBarcodeHistory: barcodes),
        ],
      );
    });

    group('Add and Delete  Pallets', () {
      final dateNow = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());
      const String barcodeBoxOne = '046070721946531744';

      const String barcodeBoxTwo = '046070721946531742';
      const String barcodeBoxThree = '046070721946531337';
      const String barcodeBoxFour = '046070721946536666';
      const String barcodePalletOne = '146070721946531744';
      const String barcodePalletTwo = '146070721946536666';
      late Set<String> barcodesUnitsOne;
      late Set<String> barcodesUnitsTwo;
      late Set<String> barcodesUnitsThree;
      late Set<String> barcodesUnitsFour;
      late Box boxOne;
      late Box boxTwo;
      late Box boxThree;
      late Box boxFour;
      late List<Item> listUnits = [];
      late ModelsPallet palletOne;
      late ModelsPallet palletTwo;
      List<ModelsPallet> listModelPallet = [];
      late ListPallets listPallets;
      Set<String> allBarcodeHistory = {};
      Set<String> allBarcodeHistoryDelete = {};
      late Set<String> allBarcodeHistoryTwo;

      setUp(() {
        allBarcodeHistoryDelete = {};
        barcodesUnitsOne = {
          '0104630037511697215o4ZOOXUTtXL6T93sRYZ',
          '0104630037511697215UT4ZOOXUTtXL6T93tRYR',
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
        allBarcodeHistoryTwo = {...allBarcodeHistory};
        allBarcodeHistoryDelete = {...allBarcodeHistory};
        listUnits = [];

        barcodesUnitsThree = {
          '0104630037511697215o4ZOOXUTtXL6T93sSYS',
          '0104630037511697215UT4ZOOXUTtXL6T93tRYRER',
          '0104630037511697215UT4ZOOXUTtXL6T93IJkR',
          '0104630037511697215UT4ZPkXUTtXL6T77sRYZ'
        };

        allBarcodeHistoryDelete.addAll(barcodesUnitsThree);
        final iterableThree =
            barcodesUnitsThree.map((e) => Item(barcode: e, date: dateNow));
        listUnits.addAll(iterableThree);

        boxThree =
            Box(barcode: barcodeBoxThree, date: dateNow, items: listUnits);
        allBarcodeHistoryDelete.add(barcodeBoxThree);
        listUnits = [];

        barcodesUnitsFour = {
          '0104630037511697215o4ZOOXUTtXL6T77sSYS',
          '0104630037511697215UT4ZOOXUTtXL9T93tRYRER',
          '0104630037511697215UT4ZOOXUTtXTTT93IJkR',
          '0104630037511697215UT4ZPkXUTtXL6T77sGLS'
        };

        allBarcodeHistoryDelete.addAll(barcodesUnitsFour);
        final iterableFour =
            barcodesUnitsFour.map((e) => Item(barcode: e, date: dateNow));
        listUnits.addAll(iterableFour);

        boxFour = Box(barcode: barcodeBoxFour, date: dateNow, items: listUnits);
        allBarcodeHistoryDelete.add(barcodeBoxFour);
        listUnits = [];

        dateOfRelease = '11.11.1111';

        palletOne = ModelsPallet(
            barcode: barcodePalletOne,
            date: dateNow,
            boxes: [boxOne, boxTwo],
            dateRelease: dateOfRelease,
            status: 'Full');
        allBarcodeHistoryDelete.add(barcodePalletOne);
        palletTwo = ModelsPallet(
            barcode: barcodePalletTwo,
            date: dateNow,
            boxes: [boxThree, boxFour],
            dateRelease: dateOfRelease,
            status: 'Full');
        allBarcodeHistoryDelete.add(barcodePalletTwo);
        final ModelsPallet newPallet = ModelsPallet(
            barcode: 'Будущая палета',
            date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
            boxes: [],
            dateRelease: dateOfRelease,
            status: 'NotFull');

        listModelPallet.add(palletOne);
        listModelPallet.add(newPallet);
        listPallets = ListPallets(listModelsPallet: listModelPallet);
      });
      blocTest(
        'add First PALLET  when PalletsEventCreatePallet is added',
        build: () => palletsBloc,
        seed: () => PalletsState.loaded(
            listPallets: ListPallets(
              listModelsPallet: [
                ModelsPallet(
                  barcode: 'Будущая палета',
                  date: dateNow,
                  dateRelease: dateOfRelease,
                  status: 'NotFull',
                  boxes: [boxOne, boxTwo],
                ),
              ],
            ),
            units: listUnits,
            allBarcodeHistory: allBarcodeHistory,
            countBarcodes: allBarcodeHistory.length,
            maxIndexUnitInBox: 4,
            countBox: 2,
            currentBarcodeHistory: allBarcodeHistory),
        act: (bloc) {
          allBarcodeHistoryTwo.add(barcodePalletOne);
          bloc.add(const PalletsEventCreatePallet(
            barcode: barcodePalletOne,
          ));
        },
        expect: () => <PalletsStateLoaded>[
          PalletsStateLoaded(
              listPallets: listPallets,
              allBarcodeHistory: allBarcodeHistoryTwo,
              countBarcodes: 0,
              maxIndexUnitInBox: 4,
              countBox: 0,
              units: [],
              currentBarcodeHistory: {})
        ],
      );

      blocTest(
        'delete second PALLET  when PalletsEventDeletePallet is added',
        build: () => palletsBloc,
        seed: () => PalletsState.loaded(
            listPallets: ListPallets(
              listModelsPallet: [palletOne, palletTwo],
            ),
            units: [],
            allBarcodeHistory: allBarcodeHistoryDelete,
            countBarcodes: allBarcodeHistoryDelete.length,
            maxIndexUnitInBox: 4,
            countBox: 0,
            currentBarcodeHistory: allBarcodeHistoryDelete),
        act: (bloc) {
          allBarcodeHistoryTwo.add(barcodePalletOne);
          bloc.add(const PalletsEventDeletePalletByIndex(
            indexPallet: 1,
          ));
        },
        expect: () => <PalletsStateLoaded>[
          PalletsStateLoaded(
              listPallets: ListPallets(
                listModelsPallet: [palletOne],
              ),
              allBarcodeHistory: allBarcodeHistoryTwo,
              countBarcodes: allBarcodeHistoryTwo.length,
              maxIndexUnitInBox: 4,
              countBox: 0,
              units: [],
              currentBarcodeHistory: allBarcodeHistoryTwo)
        ],
      );
    });
  });
}

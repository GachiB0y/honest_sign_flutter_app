import 'package:flutter_test/flutter_test.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/repository/pallets_repository.dart';

import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:intl/intl.dart';

void main() {
  group('PalletsBloc', () {
    late PalletsBloc counterBloc;

    setUp(() {
      const BarcodeService palletsProvider = const BarcodeServiceImpl();
      final PalletsRepository palletsRepository =
          PalletsRepositoryImpl(palletsProvider: palletsProvider);

      counterBloc = PalletsBloc(palletsRepository: palletsRepository);
    });
    test('initial state is PalletsState.loading()', () {
      expect(counterBloc.state, const PalletsState.loading());
    });

    blocTest(
      'add First Units  in box  when PalletsEventCreateUnit is added',
      build: () => counterBloc,
      act: (bloc) => bloc.add(PalletsEventCreateUnit(
          barcode: '228',
          formattedDateTime:
              DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()))),
      expect: () => [1],
    );
  });
}

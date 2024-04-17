import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/blocs/pallets_bloc/pallets_bloc.dart';
import 'package:honest_sign_flutter_app/domain/data_provider/session_data_provider.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';

abstract class PalletsRepository {
  Future<bool> getFreeCodes();
  Future<bool> getUsedBarcodesParty();

  Future<bool> sendBarcodes(
      {required ListPallets listPallets, required bool isDone});
  Future<void> saveState(
      {required String numberCard, required PalletsStateLoaded palletState});
  Future<PalletsStateLoaded?> loadState({required String numberCard});
  Future<void> deleteState({required String numberCard});
}

class PalletsRepositoryImpl implements PalletsRepository {
  PalletsRepositoryImpl(
      {required BarcodeService palletsProvider,
      required SessionDataProvdier sessionDataProvdier})
      : _palletsProvider = palletsProvider,
        _sessionDataProvdier = sessionDataProvdier;

  final BarcodeService _palletsProvider;
  final SessionDataProvdier _sessionDataProvdier;
  @override
  Future<bool> sendBarcodes(
      {required ListPallets listPallets, required bool isDone}) async {
    try {
      return await _palletsProvider.sendBarcodes(
          listPallets: listPallets, isDone: isDone);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteState({required String numberCard}) async {
    try {
      return await _sessionDataProvdier.deleteState(numberCard: numberCard);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PalletsStateLoaded?> loadState({required String numberCard}) async {
    try {
      return await _sessionDataProvdier.loadState(numberCard: numberCard);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveState(
      {required String numberCard,
      required PalletsStateLoaded palletState}) async {
    try {
      return await _sessionDataProvdier.saveState(
          numberCard: numberCard, palletState: palletState);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> getFreeCodes() async {
    try {
      (List<String>, List<String>) records =
          await _palletsProvider.getFreeCodes();
      setBoxs = {};
      setPallets = {};
      setBoxs = Set.from(records.$1);
      setPallets = Set.from(records.$2);
      Iterable<String> usedBarcodesParty =
          await _palletsProvider.getUsedBarcodeParty();
      setUsedBarcodesParty = {};

      setUsedBarcodesParty = Set.from(usedBarcodesParty);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> getUsedBarcodesParty() async {
    try {
      Iterable<String> records = await _palletsProvider.getUsedBarcodeParty();
      setUsedBarcodesParty = {};

      setUsedBarcodesParty = Set.from(records);

      return true;
    } catch (e) {
      rethrow;
    }
  }
}

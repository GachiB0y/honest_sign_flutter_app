import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';

abstract class PalletsRepository {
  Future<bool> sendBarcodes({required ListPallets listPallets});
}

class PalletsRepositoryImpl implements PalletsRepository {
  PalletsRepositoryImpl({
    required BarcodeService palletsProvider,
  }) : _palletsProvider = palletsProvider;

  final BarcodeService _palletsProvider;

  @override
  Future<bool> sendBarcodes({required ListPallets listPallets}) {
    try {
      return _palletsProvider.sendBarcodes(listPallets: listPallets);
    } catch (e) {
      rethrow;
    }
  }
}

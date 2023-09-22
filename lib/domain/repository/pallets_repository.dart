import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';

abstract class PalletsRepository {
  Future<bool> postBarcodes({required ModelsPallet pallets});
}

class PalletsRepositoryImpl implements PalletsRepository {
  PalletsRepositoryImpl({
    required BarcodeService palletsProvider,
  }) : _palletsProvider = palletsProvider;

  final BarcodeService _palletsProvider;

  @override
  Future<bool> postBarcodes({required ModelsPallet pallets}) {
    try {
      return _palletsProvider.postBarcodes(pallets: pallets);
    } catch (e) {
      rethrow;
    }
  }
}

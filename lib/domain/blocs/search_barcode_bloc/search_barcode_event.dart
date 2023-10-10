part of 'search_barcode_bloc.dart';

@freezed
class SerachBarcodeEvent with _$SerachBarcodeEvent {
  const factory SerachBarcodeEvent.searchBarcode(
      {required ListPallets listPallets,
      required String barcode}) = SerachBarcodeEventSerachBarcode;
  const factory SerachBarcodeEvent.clearInfo() = SerachBarcodeEventClearInfo;
}

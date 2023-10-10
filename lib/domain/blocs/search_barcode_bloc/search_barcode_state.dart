part of 'search_barcode_bloc.dart';

@freezed
class SearchBarcodeState with _$SearchBarcodeState {
  const factory SearchBarcodeState.init() = SearchBarcodeStateInit;
  const factory SearchBarcodeState.loaded({String? infoAboutBarcode}) =
      SearchBarcodeStateLoaded;
  const factory SearchBarcodeState.error({String? errorText}) =
      SearchBarcodeStateError;

  factory SearchBarcodeState.fromJson(Map<String, dynamic> json) =>
      _$SearchBarcodeStateFromJson(json);
}

part of 'pallets_bloc.dart';

@freezed
class PalletsState with _$PalletsState {
  const factory PalletsState.loading() = PalletsStateLoading;
  const factory PalletsState.loaded({
    required ListPallets listPallets,
    required List<Item> units,
    required Set<String> allBarcodeHistory,
    required int countBarcodes,
    required int maxIndexUnitInBox,
    required int countBox,
    TypeOfBarcode? currentTypeBarcode,
  }) = PalletsStateLoaded;
  const factory PalletsState.error({String? errorText}) = PalletsStateError;

  factory PalletsState.fromJson(Map<String, dynamic> json) =>
      _$PalletsStateFromJson(json);
}

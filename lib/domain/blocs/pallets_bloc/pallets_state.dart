part of 'pallets_bloc.dart';

@freezed
class PalletsState with _$PalletsState {
  const factory PalletsState.loading() = PalletsStateLoading;
  const factory PalletsState.closeApp() = PalletsStateCloseApp;
  const factory PalletsState.loaded({
    required ListPallets listPallets,
    required List<Item> units,
    required Set<String> allBarcodeHistory,
    required Set<String> currentBarcodeHistory,
    required int countBarcodes,
    required int maxIndexUnitInBox,
    required int countBox,
  }) = PalletsStateLoaded;
  const factory PalletsState.error({String? errorText}) = PalletsStateError;

  factory PalletsState.fromJson(Map<String, dynamic> json) =>
      _$PalletsStateFromJson(json);
}

part of 'pallets_bloc.dart';

@freezed
class PalletsEvent with _$PalletsEvent {
  const factory PalletsEvent.fetch() = PalletsEventFetch;
  // const factory PalletsEvent.onSubmited({
  //   required String barcode,
  // }) = PalletsEventOnSubmited;

  const factory PalletsEvent.clearBoxByIndex(
      {required int indexBox,
      required int indexPallet}) = PalletsEventClearBoxByIndex;
  const factory PalletsEvent.deleteBoxByIndex({
    required int indexBox,
    required int indexPallet,
    required String barcodeBox,
  }) = PalletsEventDeleteBoxByIndex;
  const factory PalletsEvent.createUnitByIndex({
    required int indexBox,
    required int indexPallet,
    required String barcode,
  }) = PalletsEventCreateUnitByIndex;
  const factory PalletsEvent.clearAllCurrentUnits() =
      PalletsEventClearAllCurrentUnits;
  const factory PalletsEvent.clearCurrentUnitsByBarcode(
      {required String barcode}) = PalletsEventClearCurrentUnitsByBarcode;
  const factory PalletsEvent.changeDateRelease() =
      PalletsEventChangeDateRelease;
  const factory PalletsEvent.createUnit({
    required String barcode,
  }) = PalletsEventCreateUnit;
  const factory PalletsEvent.createBox({
    required String barcode,
  }) = PalletsEventCreateBox;
  const factory PalletsEvent.createPallet({
    required String barcode,
  }) = PalletsEventCreatePallet;
}

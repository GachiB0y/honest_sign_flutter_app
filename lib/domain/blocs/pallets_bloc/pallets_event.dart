part of 'pallets_bloc.dart';

@freezed
class PalletsEvent with _$PalletsEvent {
  const factory PalletsEvent.fetch() = PalletsEventFetch;
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

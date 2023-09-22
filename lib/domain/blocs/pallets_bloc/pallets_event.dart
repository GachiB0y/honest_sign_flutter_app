part of 'pallets_bloc.dart';

@freezed
class PalletsEvent with _$PalletsEvent {
  const factory PalletsEvent.fetch() = PalletsEventFetch;
  const factory PalletsEvent.createUnit(
      {required String barcode,
      required String formattedDateTime}) = PalletsEventCreateUnit;
}

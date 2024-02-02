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
    bool? isLoading,
    String? errorText,
    bool? isNewRelease,
    String? gtin,
  }) = PalletsStateLoaded;
  const factory PalletsState.error({String? errorText}) = PalletsStateError;

  factory PalletsState.fromJson(Map<String, dynamic> json) =>
      _$PalletsStateFromJson(json);
}

// /// {@template pallets_state_placeholder}
// /// Entity placeholder for PalletsState
// /// {@endtemplate}
// typedef PalletsEntity = ModelStatePalletsBloc;

// /// {@template pallets_state}
// /// PalletsState.
// /// {@endtemplate}
// sealed class PalletsState extends _$PalletsStateBase {
//   /// Idling state
//   /// {@macro pallets_state}
//   const factory PalletsState.idle({
//     required PalletsEntity? data,
//     String message,
//   }) = PalletsState$Idle;

//   /// Processing
//   /// {@macro pallets_state}
//   const factory PalletsState.processing({
//     required PalletsEntity? data,
//     String message,
//   }) = PalletsState$Processing;

//   /// Successful
//   /// {@macro pallets_state}
//   const factory PalletsState.successful({
//     required PalletsEntity? data,
//     String message,
//   }) = PalletsState$Successful;

//   /// An error has occurred
//   /// {@macro pallets_state}
//   const factory PalletsState.error({
//     required PalletsEntity? data,
//     String message,
//   }) = PalletsState$Error;

//   /// {@macro pallets_state}
//   const PalletsState({required super.data, required super.message});
// }

// /// Idling state
// /// {@nodoc}
// final class PalletsState$Idle extends PalletsState with _$PalletsState {
//   /// {@nodoc}
//   const PalletsState$Idle({required super.data, super.message = 'Idling'});
// }

// /// Processing
// /// {@nodoc}
// final class PalletsState$Processing extends PalletsState with _$PalletsState {
//   /// {@nodoc}
//   const PalletsState$Processing(
//       {required super.data, super.message = 'Processing'});
// }

// /// Successful
// /// {@nodoc}
// final class PalletsState$Successful extends PalletsState with _$PalletsState {
//   /// {@nodoc}
//   const PalletsState$Successful(
//       {required super.data, super.message = 'Successful'});
// }

// /// Error
// /// {@nodoc}
// final class PalletsState$Error extends PalletsState with _$PalletsState {
//   /// {@nodoc}
//   const PalletsState$Error(
//       {required super.data, super.message = 'An error has occurred.'});
// }

// /// {@nodoc}
// base mixin _$PalletsState on PalletsState {}

// /// Pattern matching for [PalletsState].
// typedef PalletsStateMatch<R, S extends PalletsState> = R Function(S state);

// /// {@nodoc}
// @immutable
// abstract base class _$PalletsStateBase {
//   /// {@nodoc}
//   const _$PalletsStateBase({required this.data, required this.message});

//   /// Data entity payload.
//   @nonVirtual
//   final PalletsEntity? data;

//   /// Message or state description.
//   @nonVirtual
//   final String message;

//   /// Has data?
//   bool get hasData => data != null;

//   /// If an error has occurred?
//   bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

//   /// Is in progress state?
//   bool get isProcessing =>
//       maybeMap<bool>(orElse: () => false, processing: (_) => true);

//   /// Is in idle state?
//   bool get isIdling => !isProcessing;

//   /// Pattern matching for [PalletsState].
//   R map<R>({
//     required PalletsStateMatch<R, PalletsState$Idle> idle,
//     required PalletsStateMatch<R, PalletsState$Processing> processing,
//     required PalletsStateMatch<R, PalletsState$Successful> successful,
//     required PalletsStateMatch<R, PalletsState$Error> error,
//   }) =>
//       switch (this) {
//         PalletsState$Idle s => idle(s),
//         PalletsState$Processing s => processing(s),
//         PalletsState$Successful s => successful(s),
//         PalletsState$Error s => error(s),
//         _ => throw AssertionError(),
//       };

//   /// Pattern matching for [PalletsState].
//   R maybeMap<R>({
//     PalletsStateMatch<R, PalletsState$Idle>? idle,
//     PalletsStateMatch<R, PalletsState$Processing>? processing,
//     PalletsStateMatch<R, PalletsState$Successful>? successful,
//     PalletsStateMatch<R, PalletsState$Error>? error,
//     required R Function() orElse,
//   }) =>
//       map<R>(
//         idle: idle ?? (_) => orElse(),
//         processing: processing ?? (_) => orElse(),
//         successful: successful ?? (_) => orElse(),
//         error: error ?? (_) => orElse(),
//       );

//   /// Pattern matching for [PalletsState].
//   R? mapOrNull<R>({
//     PalletsStateMatch<R, PalletsState$Idle>? idle,
//     PalletsStateMatch<R, PalletsState$Processing>? processing,
//     PalletsStateMatch<R, PalletsState$Successful>? successful,
//     PalletsStateMatch<R, PalletsState$Error>? error,
//   }) =>
//       map<R?>(
//         idle: idle ?? (_) => null,
//         processing: processing ?? (_) => null,
//         successful: successful ?? (_) => null,
//         error: error ?? (_) => null,
//       );

//   @override
//   int get hashCode => data.hashCode;

//   @override
//   bool operator ==(Object other) => identical(this, other);
// }

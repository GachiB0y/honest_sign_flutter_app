part of 'main_view_bloc.dart';

@freezed
class MainViewModelState with _$MainViewModelState {
  const factory MainViewModelState.init() = MainViewModelStateInit;
  const factory MainViewModelState.loaded({
    TypeOfBarcode? currentTypeBarcode,
    bool? isDublicate,
  }) = MainViewModelStateLoaded;
  const factory MainViewModelState.error({String? errorText}) =
      MainViewModelStateError;

  factory MainViewModelState.fromJson(Map<String, dynamic> json) =>
      _$MainViewModelStateFromJson(json);
}

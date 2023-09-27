part of 'main_view_bloc.dart';

@freezed
class MainViewModelEvent with _$MainViewModelEvent {
  const factory MainViewModelEvent.openAlertBox() =
      MainViewModelEventOpenAlertBox;
  const factory MainViewModelEvent.openAlertPallet() =
      MainViewModelEventOpenAlertPallet;
}

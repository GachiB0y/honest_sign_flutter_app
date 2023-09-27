import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:honest_sign_flutter_app/ui/screens/main_screen_copy.dart';

part 'main_view_bloc.freezed.dart';
part 'main_view_bloc.g.dart';
part 'main_view_event.dart';
part 'main_view_state.dart';

class MainViewModelBloc extends Bloc<MainViewModelEvent, MainViewModelState> {
  MainViewModelBloc() : super(const MainViewModelState.init()) {
    on<MainViewModelEvent>((event, emit) async {
      if (event is MainViewModelEventOpenAlertBox) {
        const newState = MainViewModelStateLoaded(
          currentTypeBarcode: TypeOfBarcode.box,
        );
        emit(newState);
      } else if (event is MainViewModelEventOpenAlertPallet) {
        const newState = MainViewModelStateLoaded(
          currentTypeBarcode: TypeOfBarcode.pallet,
        );
        emit(newState);
      }
    });
  }
}

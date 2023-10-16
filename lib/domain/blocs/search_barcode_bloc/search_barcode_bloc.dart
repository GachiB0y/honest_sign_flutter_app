import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';

part 'search_barcode_bloc.freezed.dart';
part 'search_barcode_bloc.g.dart';
part 'search_barcode_event.dart';
part 'search_barcode_state.dart';

class SearchBarcodeBloc extends Bloc<SerachBarcodeEvent, SearchBarcodeState> {
  SearchBarcodeBloc() : super(const SearchBarcodeState.init()) {
    on<SerachBarcodeEvent>((event, emit) async {
      if (event is SerachBarcodeEventSerachBarcode) {
        onSerachByBarcode(event, emit);
      } else if (event is SerachBarcodeEventClearInfo) {
        onClearInfo(emit);
      }
    });
  }

  void onSerachByBarcode(
      SerachBarcodeEventSerachBarcode event, Emitter<SearchBarcodeState> emit) {
    ListPallets listPallets =
        event.listPallets; // Assuming you have an instance of ListPallets

    String targetBarcode = event.barcode; // The barcode you want to search for

    String infoByBarcode = '';

    for (ModelsPallet modelsPallet in listPallets.listModelsPallet) {
      for (Box box in modelsPallet.boxes) {
        for (Item item in box.items) {
          if (item.barcode == targetBarcode) {
            int boxNumber = modelsPallet.boxes.indexOf(box);
            int modelsPalletNumber =
                listPallets.listModelsPallet.indexOf(modelsPallet);

            infoByBarcode =
                'Паллет №${modelsPalletNumber + 1}.\n Коробка №$boxNumber: ${box.barcode} ';
            break;
          }
        }
      }
    }
    if (infoByBarcode == '') {
      infoByBarcode = 'Штрихкод не найден!';
    }

    final newState = SearchBarcodeStateLoaded(infoAboutBarcode: infoByBarcode);
    emit(newState);
  }

  void onClearInfo(Emitter<SearchBarcodeState> emit) {
    const newState = SearchBarcodeStateLoaded(infoAboutBarcode: null);
    emit(newState);
  }
}

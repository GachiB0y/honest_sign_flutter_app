import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';
part 'model_state_pallets_bloc.freezed.dart';
part 'model_state_pallets_bloc.g.dart';

@freezed
class ModelStatePalletsBloc with _$ModelStatePalletsBloc {
  const factory ModelStatePalletsBloc({
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
  }) = _ModelStatePalletsBloc;

  factory ModelStatePalletsBloc.fromJson(Map<String, dynamic> json) =>
      _$ModelStatePalletsBlocFromJson(json);
}

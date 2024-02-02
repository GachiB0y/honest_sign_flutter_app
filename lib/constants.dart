// import 'package:honest_sign_flutter_app/domain/entity/enity.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart';
import 'package:intl/intl.dart';

int countUnitsPerBox = 2; // Заглушка на 7 всего кодов и две коробки
int countAllBarcodesPerPallet = 7;
int countBoxesPerPallet = 2;
Set<String> setBoxs = {'228', '227', '226', '225'};
Set<String> setPallets = {'2007', '2008'};
Set<String> setUnit = {};
int maxIndexUnitInBox = 0;
String numberCardConst = '';
String gtin = '';

String dateOfRelease = '';
String nameFuturePallet = 'Будущая паллета';
String futureBarcodeParty = '';

String createDateNow() {
  DateTime now = DateTime.now();
  String formattedDateTime = DateFormat('dd.MM.yyyy HH:mm').format(now);
  return formattedDateTime;
}

List<ModelsPallet> listPallets = [];

ListPallets modelListPallets = const ListPallets(listModelsPallet: []);

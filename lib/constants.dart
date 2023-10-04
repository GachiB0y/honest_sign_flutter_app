import 'package:honest_sign_flutter_app/domain/entity/enity.dart';
import 'package:intl/intl.dart';

int countUnitsPerBox = 4; // Заглушка на 11 всего кодов и две коробки
int countAllBarcodesPerPallet = 11;
int countBoxesPerPallet = 2;
Set<String> setBoxs = {'228', '227', '226', '225'};
Set<String> setPallets = {'2007', '2008'};
Set<String> setUnit = {};
int maxIndexUnitInBox = 0;
String numberCardConst = '';

String dateOfRelease = '';
String nameFuturePallet = 'Будущая паллета';

String createDateNow() {
  DateTime now = DateTime.now();
  String formattedDateTime = DateFormat('dd.MM.yyyy HH:mm').format(now);
  return formattedDateTime;
}

List<ModelsPallet> listPallets = [];

ListPallets modelListPallets = ListPallets(listPallets: []);

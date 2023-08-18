import 'package:intl/intl.dart';

int countUnitsPerBox = 4; // Заглушка на 11 всего кодов и две коробки
int countAllBarcodesPerPallet = 11;
int countBoxesPerPallet = 2;
Set<String> setBoxs = {'99999997688990', '228'};
Set<String> setPallets = {'99999999389957'};
Set<String> setUnit = {};

const String keyFututrePallet = 'Будущий палет';
String dateOfRelease = '';

String createDateNow() {
  DateTime now = DateTime.now();
  String formattedDateTime = DateFormat('dd.MM.yyyy HH:mm').format(now);
  return formattedDateTime;
}

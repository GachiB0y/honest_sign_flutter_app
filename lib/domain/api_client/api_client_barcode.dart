import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BarcodeService {
  Future<String> getBarcodes({query}) async {
    var url = 'http://10.3.50.96:8000/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return 'резулььтат заглушка';
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<bool> postBarcodes({required ModelsPallet pallets}) async {
    var url = 'http://10.3.50.96:8000/';
    final body = jsonEncode(pallets.toJson());
    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Ошибка отправки палеты!');
    }
  }

  Future<bool> getInfoForBarcodeRealise({required String numberCard}) async {
    var url = 'http://10.3.50.96:8000/get_info/$numberCard';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      countUnitsPerBox = jsonResponse['PalletItems'];

      countBoxesPerPallet = jsonResponse['Pallet'];
      return true;
    } else {
      throw Exception('Ошибка получения данных о разливе!');
    }
  }

  const BarcodeService();
}

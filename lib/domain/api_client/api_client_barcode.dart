import 'package:honest_sign_flutter_app/domain/entity/enity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BarcodeService {
  Future<String> getBarcodes({query}) async {
    var url = 'http://10.3.50.96:8000/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return 'резулььтат заглушка';
      // CategoryList.fromJson(json.decode(response.body));
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
      // CategoryList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Ошибка отправки палеты!');
    }
  }

  const BarcodeService();
}

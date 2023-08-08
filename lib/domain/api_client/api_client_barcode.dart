import 'package:http/http.dart' as http;
import 'dart:convert';

class BarcodeService {
  Future<String> getBarcodes({query}) async {
    var url = 'https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return 'резулььтат заглушка';
      // CategoryList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  const BarcodeService();
}

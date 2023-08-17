import 'dart:io';

import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class BarcodeService {
  Future<bool> getBarcodes() async {
    var url = 'http://10.3.50.96:8000/get_boxes';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // List<String> myList = jsonDecode(response.body);
      List<String> myList =
          (jsonDecode(response.body) as List<dynamic>).cast<String>();

      setBoxs = Set.from(myList);

      return true;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<bool> postBarcodes({required ModelsPallet pallets}) async {
    var url = 'http://10.3.50.96:8000/';
    final body = jsonEncode(pallets.toJson());
    saveData(fileName: 'pallet', pallets: pallets);
    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Ошибка отправки палеты!');
    }
  }

  void saveData(
      {required ModelsPallet pallets, required String fileName}) async {
    if (await Permission.storage.request().isGranted) {
      final file = await createFile('$fileName.json');
      final jsonStr = json.encode(pallets.toJson());
      await file.writeAsString(jsonStr);
    } else {
      print('ERROR');
    }
  }

  Future<File> createFile(String fileName) async {
    final directory = await getExternalStorageDirectory();
    final newPath = '${directory!.path}/Download';
    await Directory(newPath).create(recursive: true);
    final newPathWithFile = '$newPath/$fileName';
    return File(newPathWithFile).create();
  }

  Future<bool> getInfoForBarcodeRelease({required String numberCard}) async {
    var url = 'http://10.3.50.96:8000/get_info/$numberCard';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      countUnitsPerBox = jsonResponse['PalletItems'];
      countBoxesPerPallet = jsonResponse['PalletBox'];

      countAllBarcodesPerPallet =
          jsonResponse['Pallet'] + countBoxesPerPallet + 1;
      return true;
    } else {
      throw Exception('Ошибка получения данных о разливе!');
    }
  }

  const BarcodeService();
}

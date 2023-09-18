import 'dart:async';
import 'dart:io';

import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class BarcodeService {
  Future<bool> getBarcodesBoxes() async {
    var url = 'http://10.3.50.96:8000/get_boxes';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // List<String> myList = jsonDecode(response.body);
      List<String> myList =
          (jsonDecode(response.body) as List<dynamic>).cast<String>();

      setBoxs = Set.from(myList);
      setBoxs.add('228');

      return true;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<bool> getBarcodesPallets() async {
    var url = 'http://10.3.50.96:8000/get_pallet';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // List<String> myList = jsonDecode(response.body);
      List<String> myList =
          (jsonDecode(response.body) as List<dynamic>).cast<String>();

      setPallets = Set.from(myList);

      return true;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<bool> postBarcodes({required ModelsPallet pallets}) async {
    // http.Response response;
    // var url = 'http://10.3.50.96:8000/';
    var headers = {
      'Content-Type': 'text/plain',
      'Authorization': 'Basic R3Jhc3NFeGNoYW5nZTphbG9iQTY0'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://srv1c2.grass.local/GrassChZn/hs/GrassChZnAPI//V1/cards'));

    final copyPallets = pallets.copyWith();

    bool isNewPallet = true;

    if (pallets.status == 'NotFull') {
      modelListPallets.listPallets.forEach((element) {
        if (element.status == pallets.status) {
          isNewPallet = false;
        } else {
          isNewPallet = true;
        }
      });
      if (isNewPallet) {
        modelListPallets.listPallets.add(pallets);
      }
    } else {
      // modelListPallets.listPallets.removeLast();
      final isConatins = modelListPallets.listPallets.contains(copyPallets);
      if (!isConatins) {
        modelListPallets.listPallets.add(copyPallets);
      }
    }

    final bodyTwo = jsonEncode(modelListPallets.toJson());
    await savePalletsInCash(
        modelListPallets: modelListPallets, fileName: 'palletCash');

    final isConnect = await checkInternetConnection();
    if (isConnect) {
      try {
        request.body =
            '''{"CardId":"977065","Action":"Update","Pallets":$bodyTwo}''';
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();
        // response = await http
        //     .post(Uri.parse(url), body: bodyTwo)
        //     .timeout(const Duration(seconds: 3));
        if (response.statusCode == 200) {
          return true;
        } else {
          // return false;
          throw Exception('Ошибка отправки палеты!');
        }
      } on TimeoutException {
        throw Exception('Время отправки выше 3секунд.');
      } catch (e) {
        rethrow;
      }
    } else {
      return false;
    }
  }

  // Future<bool> postIntermediateBarcodes({required ModelsPallet pallets}) async {
  //   http.Response response;
  //   const url = 'http://10.3.50.96:8000/';
  //   final body = jsonEncode(pallets.toJson());
  //   await saveData(fileName: 'palletIntermediateCash', pallets: pallets);
  //   final isConnect = await checkInternetConnection();
  //   if (isConnect) {
  //     response = await http.post(Uri.parse(url), body: body);
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false; //throw Exception('Ошибка отправки промежуточных данных!');
  //     }
  //   } else {
  //     return false;
  //   }
  // }

  // Future<void> saveData(
  //     {required ModelsPallet pallets, required String fileName}) async {
  //   if (await Permission.storage.request().isGranted) {
  //     final file = await createFile('$fileName.json');
  //     final jsonStr = json.encode(pallets.toJson());
  //     await file.writeAsString(jsonStr);
  //   } else {
  //     print('ERROR');
  //   }
  // }

  Future<void> savePalletsInCash(
      {required ListPallets modelListPallets, required String fileName}) async {
    if (await Permission.storage.request().isGranted) {
      final file = await createFile('$fileName.json');
      final jsonStr = json.encode(modelListPallets.toJson());
      await file.writeAsString(jsonStr);
    } else {
      print('ERROR');
    }
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
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
    var headers = {
      'Content-Type': 'text/plain',
      'Authorization': 'Basic R3Jhc3NFeGNoYW5nZTphbG9iQTY0'
    };
    var url = 'http://srv1c2.grass.local/GrassChZn/hs/GrassChZnAPI//V1/cards';
    var request = http.Request('POST', Uri.parse(url));
    request.body = '''{"CardId":$numberCard,"Action":"Create"}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    // var url = 'http://10.3.50.96:8000/get_info/$numberCard';

    // final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);

      countUnitsPerBox = jsonData['Message']['PalletBox'];

      final int allBarcodeUnitsPallet = jsonData['Message']['PalletItems'];
      countBoxesPerPallet = countUnitsPerBox ~/ allBarcodeUnitsPallet;

      countAllBarcodesPerPallet = allBarcodeUnitsPallet +
          countBoxesPerPallet +
          1; // РАССКОМЕНТИРОВАТЬ В РЕЛИЗЕ ВЕРСИИ
      return true;
    } else {
      throw Exception('Ошибка получения данных о разливе!');
    }
  }

  const BarcodeService();
}

import 'dart:async';
import 'dart:io';

import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_service.dart';
import 'package:honest_sign_flutter_app/domain/entity/new_entity.dart'
    as newEntity;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class BarcodeService {
  const BarcodeService();
  Future<(List<String>, List<String>)> getFreeCodes();

  Future<bool> sendBarcodes(
      {required newEntity.ListPallets listPallets, required bool isDone});

  Future<bool> checkInternetConnection();
  Future<void> savePalletsInCash(
      {required newEntity.ListPallets modelListPallets,
      required String fileName});
  Future<void> savePalletsInCashNew(
      {required newEntity.ListPallets modelListPallets,
      required String fileName});
  Future<File> createFile(String fileName);
  Future<bool> getInfoForBarcodeRelease({required String numberCard});
}

class BarcodeServiceImpl extends BarcodeService {
  final IHTTPService _httpService;
  BarcodeServiceImpl(this._httpService);
  @override
  Future<(List<String>, List<String>)> getFreeCodes() async {
    try {
      final http.StreamedResponse response = await _httpService.post(
          uri:
              'http://srv1c2.grass.local/GrassChZn/hs/GrassChZnAPI//V1/FreeCodes',
          body: null,
          contentType: false);

      if (response.statusCode == 200) {
        final jsonResponse = await response.stream.bytesToString();
        final jsonData = jsonDecode(jsonResponse);

        List<String> listBoxes =
            (jsonData['Message']['Box'] as List<dynamic>).cast<String>();
        List<String> listPallets =
            (jsonData['Message']['Pallet'] as List<dynamic>).cast<String>();

        (List<String>, List<String>) record = (listBoxes, listPallets);
        return record;
      } else {
        throw Exception('Ошибка получения данных о разливе!');
      }
    } on TimeoutException {
      throw Exception('Время отправки выше 8 секунд.\nОбратитесь к мастеру!');
    } catch (e) {
      throw Exception('Ошибка получения данных о разливе!');
    }
  }

  @override
  Future<bool> sendBarcodes(
      {required newEntity.ListPallets listPallets,
      required bool isDone}) async {
    final bodyTwo = jsonEncode(listPallets.toJson());

    final isConnect = await checkInternetConnection();
    if (isConnect) {
      try {
        final http.StreamedResponse response = await _httpService.post(
            uri:
                'http://srv1c2.grass.local/GrassChZn/hs/GrassChZnAPI//V1/cards',
            body:
                // '''{"CardId":"$numberCardConst","Action":"Update","IsDone":false,"Pallets":$bodyTwo}''',
                '''{"CardId":"$numberCardConst","Action":"Update","IsDone":$isDone,"Pallets":$bodyTwo}''', // РАССКОМЕНИТЬ В РЕЛИЗЕ
            contentType: true);

        if (response.statusCode == 200) {
          return true;
        } else {
          throw Exception('Ошибка отправки палеты!\nОбратитесь к мастеру!');
        }
      } on TimeoutException {
        throw Exception(
            'Время отправки выше 25 секунд.\nОбратитесь к мастеру!');
      } catch (e) {
        rethrow;
      }
    } else {
      return false;
    }
  }

  @override
  Future<void> savePalletsInCash(
      {required newEntity.ListPallets modelListPallets,
      required String fileName}) async {
    if (await Permission.storage.request().isGranted) {
      final file = await createFile('$fileName.json');
      final jsonStr = json.encode(modelListPallets.toJson());
      await file.writeAsString(jsonStr);
    } else {
      print('ERROR');
    }
  }

  @override
  Future<void> savePalletsInCashNew(
      {required newEntity.ListPallets modelListPallets,
      required String fileName}) async {
    if (await Permission.storage.request().isGranted) {
      final file = await createFile('$fileName.json');
      final jsonStr = json.encode(modelListPallets.toJson());
      await file.writeAsString(jsonStr);
    } else {
      print('ERROR');
    }
  }

  @override
  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  Future<File> createFile(String fileName) async {
    final directory = await getExternalStorageDirectory();
    final newPath = '${directory!.path}/Download';
    await Directory(newPath).create(recursive: true);
    final newPathWithFile = '$newPath/$fileName';
    return File(newPathWithFile).create();
  }

  @override
  Future<bool> getInfoForBarcodeRelease({required String numberCard}) async {
    final http.StreamedResponse response = await _httpService.post(
        uri: 'http://srv1c2.grass.local/GrassChZn/hs/GrassChZnAPI//V1/cards',
        body: '''{"CardId":$numberCard,"Action":"Create"}''',
        contentType: true);

    try {
      if (response.statusCode == 200) {
        final jsonResponse = await response.stream.bytesToString();
        final jsonData = jsonDecode(jsonResponse);

        gtin = jsonData['Message']['GTIN'].toString();
        final int allBarcodeUnitsPallet = jsonData['Message']['PalletItems'];
        countBoxesPerPallet = jsonData['Message']['PalletBox'];
        countUnitsPerBox = allBarcodeUnitsPallet ~/ countBoxesPerPallet;
        countAllBarcodesPerPallet = allBarcodeUnitsPallet +
            countBoxesPerPallet +
            1; // РАССКОМЕНТИРОВАТЬ В РЕЛИЗЕ ВЕРСИИ
        return true;
      } else if (response.statusCode == 404) {
        throw Exception(
            'Карточка отработала!\n Вы пыдаетесь запустить по ней розлив вне смены!');
      } else {
        throw Exception('Ошибка получения данных о разливе!');
      }
    } on TimeoutException {
      throw Exception('Время отправки выше 8 секунд.\nОбратитесь к мастеру!');
    } catch (e) {
      throw Exception('Ошибка получения данных о разливе!');
    }
  }
}

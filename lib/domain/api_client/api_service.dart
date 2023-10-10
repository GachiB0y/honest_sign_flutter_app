import 'package:http/http.dart';

abstract interface class IHTTPService {
  // Future<Response> get();
  Future<StreamedResponse> post(
      {required String uri, required String? body, required bool contentType});
}

class HTTPServiceImpl implements IHTTPService {
  HTTPServiceImpl();

  // Future<Response> get(Uri uri) {
  // 	return _dio.get(uri);
  // }

  @override
  Future<StreamedResponse> post(
      {required String uri,
      required String? body,
      required bool contentType}) async {
    var headers = {'Authorization': 'Basic R3Jhc3NFeGNoYW5nZTphbG9iQTY0'};
    if (contentType) headers.addAll({'Content-Type': 'text/plain'});

    var request = Request('POST', Uri.parse(uri));
    if (body != null) request.body = body;

    request.headers.addAll(headers);

    StreamedResponse response =
        await request.send().timeout(const Duration(seconds: 8));
    return response;
  }
}

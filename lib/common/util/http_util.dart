import 'package:dio/dio.dart';

class HttpUtil {
  static get(String url) async {
    try {
      Response response;
      Dio dio = Dio();
      dio.options.contentType = 'application/json;charset=UTF-8';
      response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('service error');
      }
    } catch (e) {
      return print('error: ${e.toString()}');
    }
  }
}

import 'package:dio/dio.dart';

class APIClientService {
  static Future getData({
    required String url,
    Map<String, dynamic>? parameters,
  }
  ) async {
     //initializing Dio
    Dio dio = Dio();

    //add header dio authorization
    dio.options.headers["X-Requested-With"] = 'XMLHttpRequest';


    try {
      Response response = await dio.get(
        url,
        queryParameters: parameters == null || parameters.isEmpty ? {} : Map.from(parameters),
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 600;
          },
        ),
      );
      if (response.statusCode == 200) {
        return {
          "response": response,
          "message": "success",
        };
      } else {
        return {
          "response": response,
          "message": "failed",
        };
      }
    // ignore: deprecated_member_use
    } on DioError catch (e) {
     // ignore: deprecated_member_use
     if (e.type == DioErrorType.connectionTimeout) {
        return {
          "response": "Waktu untuk memuat data sudah habis",
          "message": "connection_timeout",
        };
      } else {
        // ignore: deprecated_member_use
        if (e.type == DioErrorType.receiveTimeout) {
          return {
            "response": e.error,
            "message": "receive_timeout",
          };
        } else {
          return {
            "response": e.response.toString(),
            "message": e.error,
          };
        }
      }
    }
  }
}
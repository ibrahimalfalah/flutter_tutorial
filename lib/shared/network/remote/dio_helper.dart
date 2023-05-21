
import 'package:dio/dio.dart';


class DioHelper {
  static late Dio dio;

  static init() {

    dio = Dio(
      BaseOptions(

        baseUrl: 'url/',
        receiveDataWhenStatusError: true,
        followRedirects: false,
      ),
    );
  }
  static Future<Response> getData(

      {required String methodUrl,
        Map<String, dynamic> ? query,}) async {

    dio.options.headers = {
      "Content-Type":"application/json",
      "Authorization": "Bearer token",
    };
    return await dio.get(methodUrl, queryParameters: query);
  }

  static Future<Response> postData(
      { required String methodUrl,
        required Map<String,dynamic>  data}) async {
    dio.options.headers = {
      "Content-Type":"application/json",
      "Authorization": "Bearer ",
    };
    return await dio.post(
      methodUrl,
      data: data,
    );
  }
}


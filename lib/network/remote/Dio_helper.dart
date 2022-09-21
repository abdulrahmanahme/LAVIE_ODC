import 'package:dio/dio.dart';

import 'end_point/end_point.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Base_Url,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
      String? token,
  }) async {
  
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'

    };
    return await dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
      
    );
  }


  static Future<Response> getData({
    required String url,
  
    required String token,

    Map<String, dynamic>? queryParameters,
  }) async {
  
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    };
    return await dio.get(
      url,
      queryParameters: queryParameters,
     
    );
  }


  static Future<Response> getD({
    required String url,
  
    required String token,

    Map<String, dynamic>? queryParameters,
  }) async {
  
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    };
    return await dio.get(
      url,
      queryParameters: queryParameters,
     
    );
  }

  static Future<Response> patchData({
    required String url,
    required String token,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
  }) async {
  
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    };
    return await dio.patch(
      url,
      queryParameters: queryParameters,
      data: data,
     
    );
  }
}

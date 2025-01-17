import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../injection_container/injection_container.dart';
import '../constants/end_points/end_point.dart';
import '../constants/errors/exceptions.dart';
import '../local/auth_local_data_source.dart';

class ApiBaseHelper{
  Dio dio = Dio();
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": 'multipart/form-data',
  };
  Options options = Options(
    validateStatus: (_) => true,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );

  void dioInit(){
    dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(milliseconds: 25000);
    dio.options.sendTimeout = const Duration(milliseconds: 25000);
    dio.options.receiveTimeout = const Duration(milliseconds: 25000);
    dio.options.headers = headers;
    dio.interceptors.add(AuthInterceptor());
  }

  Future<dynamic>post({required String url,required Map<String,dynamic>body,String? token,})async{
    FormData formData = FormData.fromMap(body);
    try{
      Response response = await dio.post(url,data: formData,options: options);
      return _returnResponseJson(response);

    }on DioException catch(e){

      throw ServerException(
          message: e.response!.data != null
              ? e.response!.data["error"].toString() ?? "Something went wrong"
              : "Something went wrong");
    }on SocketException {
      throw ServerException(message: "No internet, please try again later");
    }on IOException catch(e){
      throw ServerException(message: e.toString());
    }


  }
  void updateLocalHeader(String locale){
    headers["lang"] = locale;
    dio.options.headers = headers;
  }

  Future<dynamic>get({required String url,String? token,Map<String,dynamic>? query})async{
    try{
      Response response = await dio.get(url,queryParameters: query);
      return _returnResponseJson(response);
    }on DioException catch(e){
      throw ServerException(
          message: e.response!.data != null
              ? e.response!.data["error"].toString() ?? "Something went wrong"
              : "Something went wrong");
    }on SocketException {
      throw ServerException(message: "No internet, please try again later");
    }
  }
  Future<dynamic> delete({required String url, String? token}) async {
    try {
      dio.interceptors.add(AuthInterceptor());
      debugPrint("url => $url");
      final Response response = await dio.delete(
          url,options: options
      );

      return _returnResponseJson(response);
    } on DioException catch (e) {
      throw ServerException(
          message: e.response != null
              ? e.response!.data["msg"] ?? "Something Went Wrong"
              : " Something went wrong");
    } on SocketException {
      throw ServerException(message: "No internet please try again later");
    }
  }
  dynamic _returnResponseJson(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 400:
        throw ServerException(message: response.data["msg"]);
      case 422:
        throw UnprocessableContentException(message: response.data["message"] );
      case 401:
        throw UnAuthorizedException(message: response.data["message"]);
      case 403:
        throw response.data["message"];
      case 404:
        throw NotFoundException(message: response.data["message"]);
      case 500:
        throw ServerException(
            message:
            'Error occurred while Communication with Server with StatusCode :'
                ' ${response.statusCode} ${response.data}');
      default:
        debugPrint(
            "Error occurred while Communication with Server with StatusCode : "
                "${response.statusCode} ${response.data}");
        throw ServerException(
            message:
            "Error occurred while Communication with Server with StatusCode : "
                "${response.statusCode} ${response.data}");
    }
  }
}
class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = sharedPreferences.get(cacheTokenConst);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    } else {
      options.cancelToken;
    }
    super.onRequest(options, handler);
  }
}
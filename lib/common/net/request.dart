import 'dart:convert' ;

import 'package:dio/dio.dart';
import 'package:f_test/common/ext.dart';
import 'package:f_test/common/net/bean.dart';
import 'package:f_test/common/net/interceptor.dart' as interceptor;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../constants.dart';

class Request {
  static final Request _instance = Request._internal();

  factory Request() => _instance;

  Request._internal() {
    _init();
  }

  late Dio _dio;

  void _init() {
    _dio = Dio()
      ..options = BaseOptions(
        baseUrl: Constants.formal_base_url,
        connectTimeout: 50000,
        receiveTimeout: 30000,
      )
      ..interceptors.add(interceptor.HeaderInterceptor())
      ..interceptors.add(
        LogInterceptor(
          request: false,
          requestHeader: false,
          responseHeader: false,
          requestBody: true,
          responseBody: true,
        ),
      )
      ..interceptors.add(interceptor.LoginInterceptor());
  }

  static Future<ApiResponse<T>> _request<T>(
    String path, {
    String? method,
    Map<String, dynamic>? params,
    data,
  }) async {
    EasyLoading.show();
    try {
      final Response response = await _instance._dio.request(
        path,
        data: data,
        queryParameters: params,
        options: Options(method: method),
      );
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        EasyLoading.dismiss();
        return ApiResponse.fromJson(response.data);
      } else {
        EasyLoading.showInfo('HTTP错误，状态码为：${response.statusCode}');
        _handleHttpError(response.statusCode ?? 0);
        return Future.error('HTTP错误');
      }
    } on DioError catch (e) {
      e.message.log();
      EasyLoading.showInfo(_dioError(e));
      return Future.error(_dioError(e));
    } catch (e) {
      e.log();
      return Future.error('未知异常');
    }
  }

  // 处理 Dio 异常
  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.receiveTimeout:
        return "服务器异常，请稍后重试！";
      case DioErrorType.sendTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.response:
        return "服务器异常，请稍后重试！";
      case DioErrorType.cancel:
        return "请求已被取消，请重新请求";
      case DioErrorType.other:
        return "网络异常，请稍后重试！";
      default:
        return "Dio异常";
    }
  }

  // 处理 Http 错误码
  static void _handleHttpError(int errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        message = '请求失败，错误码：$errorCode';
    }
    EasyLoading.showError(message);
  }

  static Future<ApiResponse<T>> get<T>(String path, {Map<String, dynamic>? params}) {
    return _request(path, method: 'get', params: params);
  }

  static Future<ApiResponse<T>> post<T>(String path,
      {Map<String, dynamic>? params, data}) {
    return _request(path, method: 'post', params: params, data: data);
  }
}

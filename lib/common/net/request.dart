import 'package:dio/dio.dart';
import 'package:f_test/common/ext.dart';
import 'package:f_test/common/net/bean.dart';
import 'package:f_test/common/net/error.dart';
import 'package:f_test/common/net/interceptor.dart' as interceptor;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../res/constants.dart';

class Request with Error {
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
        sendTimeout: 30000,
        responseType: ResponseType.json,
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
      ..interceptors.add(interceptor.ResponseInterceptor());
  }

  static Future<ApiResponse> _request<ApiResponse>(
    String path, {
    String? method,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
    data,
  }) async {
    EasyLoading.show();
    try {
      final Response<ApiResponse> response =
          await _instance._dio.request<ApiResponse>(
        path,
        data: data,
        cancelToken: cancelToken,
        queryParameters: params,
        options: Options(method: method),
      );
      if (response.statusCode == HttpStatus.ok && response.data != null) {
        EasyLoading.dismiss();
        return response.data!;
      } else {
        _instance.handleHttpError(response.statusCode ?? 0);
        return Future.error('HTTP错误');
      }
    } on DioError catch (e) {
      e.message.log();
      final error = _instance.dioError(e);
      EasyLoading.showError(error);
      return Future.error(error);
    } catch (e) {
      e.log();
      EasyLoading.showError("未知异常");
      return Future.error('未知异常');
    }
  }

  static Future<ApiResponse> get(String path,
      {Map<String, dynamic>? params, CancelToken? ct}) {
    return _request(
      path,
      method: 'get',
      params: params,
      cancelToken: ct,
    );
  }

  static Future<ApiResponse> post(String path,
      {Map<String, dynamic>? params, data, CancelToken? ct}) {
    return _request(
      path,
      method: 'post',
      params: params,
      data: data,
      cancelToken: ct,
    );
  }
}

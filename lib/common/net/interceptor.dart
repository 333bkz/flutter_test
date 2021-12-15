import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:f_test/common/net/bean.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../app_cache.dart';

///公共headers
class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Content-Type"] = "application/json;charset=UTF-8";
    options.headers["token"] = AppCache.instance.token ?? "";
    handler.next(options);
  }
}

///只返回ApiResponse json格式的数据，如果有其他格式的数据可以以请求地址[response.requestOptions.path]判断去解析数据
class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    int? code;
    String? msg;
    if (response.statusCode == HttpStatus.ok) {
      final map = response.data;
      code = map["code"];
      msg = map["text"];
      if (code == 200) {
        response.data = ApiResponse(
          data: jsonEncode(map["data"]),
          text: msg,
          code: code,
        );
        handler.next(response);
        return;
      }
    }
    response.data = ApiResponse(data: '', text: msg, code: code);
    handler.next(response);
  }
}

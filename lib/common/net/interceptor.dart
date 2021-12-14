import 'package:dio/dio.dart';

import '../app_cache.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Content-Type"] = "application/json;charset=UTF-8";
    options.headers["token"] = AppCache.instance.token ?? "";
    super.onRequest(options, handler);
  }
}

class LoginInterceptor extends Interceptor {

}

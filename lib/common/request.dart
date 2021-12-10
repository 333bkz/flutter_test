
import 'dart:convert' as c show jsonDecode;
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Request {
  static final BaseOptions _options = BaseOptions(
    baseUrl: 'http://api.iotaichi.com',
    connectTimeout: 50000,
    receiveTimeout: 30000,
  );
  static final Dio _dio = Dio(_options);

  ///sadas
  static Future<T> _request<T>(String path,
      {String? method, Map? params, data}) async {
    try {
      EasyLoading.show();
      Response response = await _dio.request(path,
          data: data,
          options: Options(
            method: method,
            contentType: Headers.formUrlEncodedContentType,
          ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        //如果请求到，则关闭弹窗动画
        EasyLoading.dismiss();
        var data = c.jsonDecode(response.data);
        try {
          if (data['code'] != 0) {
            EasyLoading.showInfo("提示: ${data['msg']}");
          }
          return data;
        } catch (e) {
          return Future.error('解析响应数据异常');
        }
      } else {
        EasyLoading.showInfo('HTTP错误，状态码为：${response.statusCode}');
        _handleHttpError(response.statusCode!);
        return Future.error('HTTP错误');
      }
    } on DioError catch (e) {
      EasyLoading.showInfo(_dioError(e));
      return Future.error(_dioError(e));
    } catch (e) {
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

  static Future<T> get<T>(String path, {Map? params}) {
    return _request(path, method: 'get', params: params);
  }

  static Future<T> post<T>(String path, {Map? params, data}) {
    return _request(path, method: 'post', params: params, data: data);
  }
}

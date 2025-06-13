import 'package:dio/dio.dart';

class ErrorHandler {
  static final ErrorHandler _instance = ErrorHandler._internal();
  void Function(dynamic error)? _globalErrorHandler;

  factory ErrorHandler() {
    return _instance;
  }

  ErrorHandler._internal();

  // 设置全局错误处理器
  void setGlobalErrorHandler(void Function(dynamic error) handler) {
    _globalErrorHandler = handler;
  }

  // 处理错误
  void handleError(dynamic error) {
    if (error is DioException) {
      _handleDioError(error);
    } else {
      _globalErrorHandler?.call(error);
    }
  }

  // 处理 Dio 错误
  void _handleDioError(DioException error) {
    String errorMessage;
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = '连接超时';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = '请求超时';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = '响应超时';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleResponseError(error.response);
        break;
      case DioExceptionType.cancel:
        errorMessage = '请求已取消';
        break;
      case DioExceptionType.connectionError:
        errorMessage = '网络连接错误';
        break;
      case DioExceptionType.unknown:
        errorMessage = '未知错误';
        break;
      default:
        errorMessage = '未知错误';
    }
    _globalErrorHandler?.call(errorMessage);
  }

  // 处理响应错误
  String _handleResponseError(Response? response) {
    if (response == null) return '服务器响应错误';
    
    final statusCode = response.statusCode;
    final data = response.data;

    if (data is Map<String, dynamic> && data.containsKey('message')) {
      return data['message'];
    }

    switch (statusCode) {
      case 400:
        return '请求错误';
      case 401:
        return '未授权，请重新登录';
      case 403:
        return '拒绝访问';
      case 404:
        return '请求的资源不存在';
      case 500:
        return '服务器内部错误';
      case 502:
        return '网关错误';
      case 503:
        return '服务不可用';
      case 504:
        return '网关超时';
      default:
        return '未知错误';
    }
  }
} 
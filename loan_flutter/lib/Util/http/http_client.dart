import 'package:dio/dio.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:loan_flutter/Entity/base_response.dart';
import 'package:loan_flutter/Util/http/base_model.dart';
import 'package:loan_flutter/Util/http/callback_config.dart';
import 'package:loan_flutter/Util/http/error_handler.dart';
import 'package:loan_flutter/Util/http/request_config.dart';
import 'package:loan_flutter/Util/http/request_manager.dart';


class HttpClient {
  static HttpClient? _instance;
  late Dio _dio;
  String _baseUrl = '';
  final _requestManager = RequestManager();
  final _errorHandler = ErrorHandler();

  // 私有构造函数
  HttpClient._internal() {
    _dio = Dio();
    _initDio();
  }

  // 单例模式
  static HttpClient get instance {
    _instance ??= HttpClient._internal();
    return _instance!;
  }

  // 设置全局错误处理器
  void setGlobalErrorHandler(void Function(dynamic error) handler) {
    _errorHandler.setGlobalErrorHandler(handler);
  }

  // 初始化 Dio 配置
  void _initDio() {
    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 在请求发送前做一些处理
        LogUtil.d("--------- 请求地址: ${options.uri} ---------\n "
            "--------- 请求参数: ${options.queryParameters} ----------");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // 在响应返回时做一些处理
        LogUtil.d("--------- 请求地址: ${response.headers}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // 在发生错误时做一些处理
        _errorHandler.handleError(e);
        return handler.next(e);
      },
    ));
  }

  // 更新基础 URL
  void updateBaseUrl(String newBaseUrl) {
    _baseUrl = newBaseUrl;
    _dio.options.baseUrl = _baseUrl;
  }

  // 处理响应数据
  BaseResponse<T> _handleResponse<T extends BaseModel>(
    Response response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (response.data is Map<String, dynamic>) {
      BaseResponse<T> res = BaseResponse();
      res.convertFromJson(response.data, (json) => fromJson(json));
      return res;
    }
    throw DioException(
      requestOptions: response.requestOptions,
      error: 'Invalid response format',
    );
  }

  // 处理回调
  void _handleCallback<T extends BaseModel>(
    BaseResponse<T> response,
    CallbackConfig<T>? callback,
  ) {
    if (response.isSuccess && response.data != null) {
      callback?.onSuccess?.call(response.data!);
    } else {
      final error = response.message ?? 'Unknown error';
      _errorHandler.handleError(error);
      callback?.onError?.call(error);
    }
  }

  // 获取取消令牌
  CancelToken _getCancelToken(String path, {Map<String, dynamic>? queryParameters}) {
    final requestId = _requestManager.generateRequestId(path, queryParameters: queryParameters);
    return _requestManager.getCancelToken(requestId) ?? 
           _requestManager.createCancelToken(requestId);
  }

  // 取消指定请求
  void cancelRequest(String path, {Map<String, dynamic>? queryParameters}) {
    final requestId = _requestManager.generateRequestId(path, queryParameters: queryParameters);
    _requestManager.cancelRequest(requestId);
  }

  // 取消所有请求
  void cancelAllRequests() {
    _requestManager.cancelAllRequests();
  }

  // GET 请求
  Future<BaseResponse<T>> get<T extends BaseModel>(
    String path, {
    required RequestConfig<T> config,
    CallbackConfig<T>? callback,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken ?? _getCancelToken(path, queryParameters: queryParameters),
      );
      final result = _handleResponse(response, config.fromJson);
      _handleCallback(result, callback);
      return result;
    } catch (e) {
      _errorHandler.handleError(e);
      callback?.onError?.call(e);
      rethrow;
    }
  }

  // POST 请求
  Future<BaseResponse<T>> post<T extends BaseModel>(
    String path, {
    required RequestConfig<T> config,
    CallbackConfig<T>? callback,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: config.requestData,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken ?? _getCancelToken(path, queryParameters: queryParameters),
      );
      final result = _handleResponse(response, config.fromJson);
      _handleCallback(result, callback);
      return result;
    } catch (e) {
      _errorHandler.handleError(e);
      callback?.onError?.call(e);
      rethrow;
    }
  }

  // PUT 请求
  Future<BaseResponse<T>> put<T extends BaseModel>(
    String path, {
    required RequestConfig<T> config,
    CallbackConfig<T>? callback,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: config.requestData,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken ?? _getCancelToken(path, queryParameters: queryParameters),
      );
      final result = _handleResponse(response, config.fromJson);
      _handleCallback(result, callback);
      return result;
    } catch (e) {
      _errorHandler.handleError(e);
      callback?.onError?.call(e);
      rethrow;
    }
  }

  // DELETE 请求
  Future<BaseResponse<T>> delete<T extends BaseModel>(
    String path, {
    required RequestConfig<T> config,
    CallbackConfig<T>? callback,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: config.requestData,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken ?? _getCancelToken(path, queryParameters: queryParameters),
      );
      final result = _handleResponse(response, config.fromJson);
      _handleCallback(result, callback);
      return result;
    } catch (e) {
      _errorHandler.handleError(e);
      callback?.onError?.call(e);
      rethrow;
    }
  }
} 
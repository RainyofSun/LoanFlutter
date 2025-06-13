import 'package:dio/dio.dart';

class RequestManager {
  static final RequestManager _instance = RequestManager._internal();
  final Map<String, CancelToken> _cancelTokens = {};

  factory RequestManager() {
    return _instance;
  }

  RequestManager._internal();

  // 创建取消令牌
  CancelToken createCancelToken(String requestId) {
    final token = CancelToken();
    _cancelTokens[requestId] = token;
    return token;
  }

  // 获取取消令牌
  CancelToken? getCancelToken(String requestId) {
    return _cancelTokens[requestId];
  }

  // 取消指定请求
  void cancelRequest(String requestId) {
    _cancelTokens[requestId]?.cancel('Request cancelled by user');
    _cancelTokens.remove(requestId);
  }

  // 取消所有请求
  void cancelAllRequests() {
    for (var token in _cancelTokens.values) {
      token.cancel('All requests cancelled');
    }
    _cancelTokens.clear();
  }

  // 生成请求ID
  String generateRequestId(String path, {Map<String, dynamic>? queryParameters}) {
    final queryString = queryParameters?.entries
        .map((e) => '${e.key}=${e.value}')
        .join('&');
    return queryString != null ? '$path?$queryString' : path;
  }
} 
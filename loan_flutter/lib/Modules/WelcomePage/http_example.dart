
import 'package:loan_flutter/Entity/user_entity.dart';

import '../../Util/http/http_client.dart';
import '../../Util/http/request_config.dart';
import '../../Util/http/callback_config.dart';

class HttpExample {
  // 获取 HttpClient 实例
  final _client = HttpClient.instance;

  // 初始化
  HttpExample() {
    _initErrorHandler();
  }

  // 初始化错误处理器
  void _initErrorHandler() {
    _client.setGlobalErrorHandler((error) {
      print('Global Error Handler: $error');
      // 这里可以添加全局错误处理逻辑，比如：
      // - 显示错误提示
      // - 记录错误日志
      // - 处理特定类型的错误（如登录过期）
    });
  }

  // 示例：切换基础 URL
  void switchBaseUrl(String newBaseUrl) {
    _client.updateBaseUrl(newBaseUrl);
  }

  // 示例：GET 请求获取用户信息
  Future<void> fetchUser(int userId) async {
    await _client.get<UserEntity>(
      '/api/users/$userId',
      config: RequestConfig<UserEntity>(
        fromJson: UserEntity.fromJson,
      ),
      callback: CallbackConfig<UserEntity>(
        onSuccess: (user) {
          print('Success: User ${user.name} fetched successfully');
        },
        onError: (error) {
          print('Local Error Handler: Failed to fetch user: $error');
          // 这里可以添加特定请求的错误处理逻辑
        },
      ),
    );
  }

  // 示例：取消获取用户请求
  void cancelFetchUser(int userId) {
    _client.cancelRequest('/api/users/$userId');
  }

  // 示例：POST 请求创建用户
  Future<void> createUser(UserEntity user) async {
    await _client.post<UserEntity>(
      '/api/users',
      config: RequestConfig<UserEntity>(
        fromJson: UserEntity.fromJson,
        data: user,
      ),
      callback: CallbackConfig<UserEntity>(
        onSuccess: (createdUser) {
          print('Success: User ${createdUser.name} created successfully');
        },
        onError: (error) {
          print('Local Error Handler: Failed to create user: $error');
          // 这里可以添加特定请求的错误处理逻辑
        },
      ),
    );
  }

  // 示例：PUT 请求更新用户
  Future<void> updateUser(int userId, UserEntity user) async {
    await _client.put<UserEntity>(
      '/api/users/$userId',
      config: RequestConfig<UserEntity>(
        fromJson: UserEntity.fromJson,
        data: user,
      ),
      callback: CallbackConfig<UserEntity>(
        onSuccess: (updatedUser) {
          print('Success: User ${updatedUser.name} updated successfully');
        },
        onError: (error) {
          print('Local Error Handler: Failed to update user: $error');
          // 这里可以添加特定请求的错误处理逻辑
        },
      ),
    );
  }

  // 示例：取消所有请求
  void cancelAllRequests() {
    _client.cancelAllRequests();
  }
} 
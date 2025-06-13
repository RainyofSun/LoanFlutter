
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loan_flutter/Main/theme_widget.dart';
import 'package:loan_flutter/Util/http/http_client.dart';
import 'package:loan_flutter/global_model/global_entity.dart';
import 'package:provider/provider.dart';

void main() {
  // 确保 Flutter 绑定初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 设置全局错误处理器
  _setupGlobalErrorHandler();
  // 设置请求地址
  HttpClient.instance.updateBaseUrl(kReleaseMode ? "http://8.219.200.27/quen/" : "http://8.219.200.27/quen/");
  runApp(const MyApp());
}

void _setupGlobalErrorHandler() {
  final httpClient = HttpClient.instance;

  httpClient.setGlobalErrorHandler((error) {
    // 处理网络错误
    if (error is String) {
      _showErrorToast(error);
    } else {
      _showErrorToast('发生未知错误');
    }

    // 记录错误日志
    _logError(error);

    // 处理特定类型的错误
    _handleSpecificErrors(error);
  });
}

void _showErrorToast(String message) {
  // 这里可以使用你喜欢的 Toast 库来显示错误提示
  // 例如：Fluttertoast.showToast(msg: message);
  debugPrint('Error Toast: $message');
}

void _logError(dynamic error) {
  // 这里可以添加错误日志记录逻辑
  // 例如：使用 logger 包记录错误
  debugPrint('Error Log: $error');
}

void _handleSpecificErrors(dynamic error) {
  // 处理特定类型的错误
  if (error is String) {
    if (error.contains('未授权') || error.contains('请重新登录')) {
      // 处理登录过期的情况
      _handleLoginExpired();
    } else if (error.contains('网络连接错误')) {
      // 处理网络连接错误
      _handleNetworkError();
    }
  }
}

void _handleLoginExpired() {
  // 处理登录过期的逻辑
  // 例如：清除用户信息、跳转到登录页面等
  debugPrint('处理登录过期');
}

void _handleNetworkError() {
  // 处理网络错误的逻辑
  // 例如：显示网络错误提示、重试机制等
  debugPrint('处理网络错误');
}

class MyApp extends StatefulWidget {
  static GlobalEntity entity = GlobalEntity();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MyApp.entity)
        ],
        child: const ThemeWidget(),
      )
    );
  }
}

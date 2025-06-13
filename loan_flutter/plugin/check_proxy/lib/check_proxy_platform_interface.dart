import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'check_proxy_method_channel.dart';

abstract class CheckProxyPlatform extends PlatformInterface {
  /// Constructs a CheckProxyPlatform.
  CheckProxyPlatform() : super(token: _token);

  static final Object _token = Object();

  static CheckProxyPlatform _instance = MethodChannelCheckProxy();

  /// The default instance of [CheckProxyPlatform] to use.
  ///
  /// Defaults to [MethodChannelCheckProxy].
  static CheckProxyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CheckProxyPlatform] when
  /// they register themselves.
  static set instance(CheckProxyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  ///
  /// 是否开启了 VPN
  /// [isVPNActive] : 方法名称
  ///
  Future<bool?> isVPNActive() {
    throw UnimplementedError('isVPNActive() has not been implemented.');
  }

  ///
  /// 是否手动设置了代理
  /// [isManualProxySet] : 方法名称
  ///
  Future<bool?> isManualProxySet(String uri) {
    throw UnimplementedError('isManualProxySet() has not been implemented.');
  }
}

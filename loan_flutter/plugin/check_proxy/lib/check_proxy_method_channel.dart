import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'check_proxy_platform_interface.dart';

/// An implementation of [CheckProxyPlatform] that uses method channels.
class MethodChannelCheckProxy extends CheckProxyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('check_proxy');

  @override
  Future<bool?> isVPNActive() async {
    final result = await methodChannel.invokeMethod<bool>('isVPNActive');
    return result;
  }

  @override
  Future<bool?> isManualProxySet(String uri) async {
    final result = await methodChannel.invokeMethod<bool>('isManualProxySet', {"uri": uri});
    return result;
  }
}

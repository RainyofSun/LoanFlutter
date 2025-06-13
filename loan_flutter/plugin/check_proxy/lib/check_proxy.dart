import 'check_proxy_platform_interface.dart';

class CheckProxy {
  Future<bool?> isVPNActive() {
    return CheckProxyPlatform.instance.isVPNActive();
  }

  Future<bool?> isManualProxySet(String uri) {
    return CheckProxyPlatform.instance.isManualProxySet(uri);
  }
}

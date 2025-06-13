import 'package:flustars_flutter3/flustars_flutter3.dart';

class APPSPUtil {
  ///
  /// 系统相关 key
  ///
  static const String uuid = "uuid";
  static const String firstInstall = "firstInstall";

  /// 设备信息
  static const String appVersion = "appVersion";
  static const String version = "version";
  static const String deviceOS = "deviceOS";
  static const String deviceOSSystemVersion = "deviceOSSystemVersion";
  static const String deviceId = "deviceId";

  /// 是否是第一次安装
  static bool isFirstInstallerAPP() {
    bool isFirstInstaller = SpUtil.getBool(firstInstall) ?? true;
    return isFirstInstaller;
  }

  /// 保存标识第一次安装
  static saveMarkForInstallerAPP() {
    SpUtil.putBool(firstInstall, false);
  }
}
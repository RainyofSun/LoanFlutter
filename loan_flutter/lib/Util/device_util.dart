import 'package:device_info_plus/device_info_plus.dart';
import 'package:loan_flutter/Util/app_sp_util.dart';
import 'package:loan_flutter/Util/device_ios_name_map_util.dart';
import 'package:loan_flutter/Util/keychain_util.dart';
import 'package:loan_flutter/Util/uuid_util.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceUtil {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  static String? _deviceId;

  ///获取 默认的设备信息
  static Future<BaseDeviceInfo> getBaseDeviceInfo() async {
    BaseDeviceInfo baseDeviceInfo;
    if (APPSPUtil.isFirstInstallerAPP()) {
      baseDeviceInfo = BaseDeviceInfo({});
      return baseDeviceInfo;
    }
    return _deviceInfoPlugin.deviceInfo;
  }

  /// 当前设备平台
  static Future<String> getPlatform() async {
    var deviceInfo = await getBaseDeviceInfo();

    if (deviceInfo is AndroidDeviceInfo) {
      return "android";
    } else if (deviceInfo is IosDeviceInfo) {
      return "iOS";
    } else if (deviceInfo is WebBrowserInfo) {
      return "web";
    } else {
      return "unknown";
    }
  }

  /// samsung - S3930C / Apple-iphone 14 pro max
  static Future<String> getDeviceName() async {
    var deviceInfo = await getBaseDeviceInfo();
    if (deviceInfo is AndroidDeviceInfo) {
      return "${deviceInfo.brand}-${deviceInfo.model}";
    } else if (deviceInfo is IosDeviceInfo) {
      String deviceName = DeviceIosNameMap.getIosDeviceDisplayName(deviceInfo.utsname.machine);
      return "Apple-$deviceName";
    } else if (deviceInfo is WebBrowserInfo) {
      return (deviceInfo).browserName.toString();
    }

    return "unknown";
  }

  /// 获取设备唯一 id
  static Future<String?> getDeviceId() async {
    var deviceInfo = await getBaseDeviceInfo();
    if (deviceInfo is IosDeviceInfo) {
      //_deviceId = deviceInfo.identifierForVendor;
      //print('打印获取到的苹果设备唯一标识：${getIosUUID()}');
      _deviceId = await getIosUUID();
    }
    if (_deviceId == null || _deviceId == "") {
      try {
        return _getUniqueDeviceId();
      } catch (e) {
        return "web_uuid";
      }
    }
    return _deviceId;
  }

  /// 自己生成 uuid
  static _getUniqueDeviceId() async {
    var uuid = SpUtil.getString(APPSPUtil.uuid);
    if (uuid != null && uuid != "") {
      return uuid;
    }
    uuid = UUIDUtils.getUuid();
    await SpUtil.putString(APPSPUtil.uuid, uuid);
    return uuid.toString();
  }

  /// app 自定义版本号 v 1.0.0-beta
  static Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// app 系统版本号 20241212
  static Future<String> getBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  /// 获取系统版本号
  static Future<String> getDeviceSystemVersion() async {
    String deviceSystemVersion = '';
    try {
      var deviceInfo = await getBaseDeviceInfo();

      if (deviceInfo is AndroidDeviceInfo) {
        deviceSystemVersion = deviceInfo.version.release;
      } else if (deviceInfo is IosDeviceInfo) {
        deviceSystemVersion = deviceInfo.systemVersion;
      } else if (deviceInfo is WebBrowserInfo) {
        deviceSystemVersion = (deviceInfo).userAgent ?? 'unknown';
      } else {
        deviceSystemVersion = 'unknown';
      }
    } catch (e, stack) {
      LogUtil.d(stack);
    }
    return deviceSystemVersion;
  }

  /// 苹果 设备 ID 存钥匙串
  static Future<String?> getIosUUID() async {
    var deviceInfo = await getBaseDeviceInfo();
    String? iOSUuid = await KeyChainUtil.getData(APPSPUtil.deviceId);
    if (iOSUuid == '' || iOSUuid == null) {
      if (deviceInfo is IosDeviceInfo) {
        String? deviceId = deviceInfo.identifierForVendor;
        String iosUUID = deviceId ?? UUIDUtils.getUuid();
        KeyChainUtil.setData(APPSPUtil.deviceId, iosUUID);
        return iosUUID;
      }
    }
    return iOSUuid;
  }
}
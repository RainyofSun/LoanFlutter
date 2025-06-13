import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//苹果 使用存储 钥匙串,  支持其他平台, Android (Android 4.3 (API level 18)之后) / web  /  chrom / linux
class KeyChainUtil {
  //存储 uuid
  static const String purchaseUUID = "inPurchaseDeviceUUID";
  static const String purchaseVIP = "inPurchaseVIP";
  static const String purchaseOrderId = "inPurchaseOrderId";

  //存储设备 id
  static Future<void> setInPurchaseUUID(String uuid) async {
    storage.write(key: purchaseUUID, value: uuid);
  }

  //读取设备 id
  static Future<String?> getInPurchaseUUID() {
    return storage.read(key: purchaseUUID);
  }

  static const storage = FlutterSecureStorage();

  /// 赋值数据
  static Future<void> setData(String key, String value) async {
    storage.write(key: key, value: value);
  }

  /// 读取数据
  static Future<String?> getData(String key) {
    return storage.read(key: key);
  }

  /// 读取所有
  static Future<Map<String, String>> getAllData() {
    return storage.readAll();
  }

  /// 删除某个 key
  static Future<void> delData(String key) async {
    storage.delete(key: key);
  }

  /// 删除所有 数据
  static Future<void> delAllData() async {
    storage.deleteAll();
  }
}

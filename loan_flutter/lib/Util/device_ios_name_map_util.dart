import 'dart:io';

class DeviceIosNameMap {
  //获取 苹果   设备名称
  static String getIosDeviceDisplayName(String platform) {
    // iPhone
    if (platform == "iPhone1,1") return "iPhone 2G";
    if (platform == "iPhone1,2") return "iPhone 3G";
    if (platform == "iPhone2,1") return "iPhone 3GS";
    if (platform == "iPhone3,1") return "iPhone 4";
    if (platform == "iPhone3,2") return "iPhone 4";
    if (platform == "iPhone3,3") return "iPhone 4";
    if (platform == "iPhone4,1") return "iPhone 4S";
    if (platform == "iPhone5,1") return "iPhone 5";
    if (platform == "iPhone5,2") return "iPhone 5";
    if (platform == "iPhone5,3") return "iPhone 5c";
    if (platform == "iPhone5,4") return "iPhone 5c";
    if (platform == "iPhone6,1") return "iPhone 5s";
    if (platform == "iPhone6,2") return "iPhone 5s";
    if (platform == "iPhone7,2") return "iPhone 6";
    if (platform == "iPhone7,1") return "iPhone 6 Plus";
    if (platform == "iPhone8,1") return "iPhone 6s";
    if (platform == "iPhone8,2") return "iPhone 6s Plus";
    if (platform == "iPhone8,4") return "iPhone SE";
    if (platform == "iPhone9,1") return "iPhone 7";
    if (platform == "iPhone9,3") return "iPhone 7";
    if (platform == "iPhone9,2") return "iPhone 7 Plus";
    if (platform == "iPhone9,4") return "iPhone 7 Plus";
    if (platform == "iPhone10,1") return "iPhone 8";
    if (platform == "iPhone10,4") return "iPhone 8";
    if (platform == "iPhone10,2") return "iPhone 8 Plus";
    if (platform == "iPhone10,5") return "iPhone 8 Plus (A1897)";
    if (platform == "iPhone10,3") return "iPhone X";
    if (platform == "iPhone10,6") return "iPhone X";
    if (platform == "iPhone11,2") return "iPhone XS";
    if (platform == "iPhone11,4") return "iPhone XS Max";
    if (platform == "iPhone11,6") return "iPhone XS Max";
    if (platform == "iPhone11,8") return "iPhone XR";
    if (platform == "iPhone12,1") return "iPhone 11";
    if (platform == "iPhone12,3") return "iPhone 11 Pro";
    if (platform == "iPhone12,5") return "iPhone 11 Pro Max";
    if (platform == "iPhone12,8") return "iPhone SE (2nd generation)";
    if (platform == "iPhone13,1") return "iPhone 12 mini";
    if (platform == "iPhone13,2") return "iPhone 12";
    if (platform == "iPhone13,3") return "iPhone 12 Pro";
    if (platform == "iPhone13,4") return "iPhone 12 Pro Max";
    if (platform == "iPhone14,4") return "iPhone 13 mini";
    if (platform == "iPhone14,5") return "iPhone 13";
    if (platform == "iPhone14,2") return "iPhone 13 Pro";
    if (platform == "iPhone14,3") return "iPhone 13 Pro Max";
    if (platform == "iPhone14,6") return "iPhone SE (3rd generation)";
    if (platform == "iPhone14,7") return "iPhone 14";
    if (platform == "iPhone14,8") return "iPhone 14 Plus";
    if (platform == "iPhone15,2") return "iPhone 14 Pro";
    if (platform == "iPhone15,3") return "iPhone 14 Pro Max";
    if (platform == "iPhone15,4") return "iPhone 15";
    if (platform == "iPhone15,5") return "iPhone 15 Plus";
    if (platform == "iPhone16,1") return "iPhone 15 Pro";
    if (platform == "iPhone16,2") return "iPhone 15 Pro Max";

    if (platform == "iPhone17,1") return "iPhone 16";
    if (platform == "iPhone17,2") return "iPhone 16 Plus";
    if (platform == "iPhone17,3") return "iPhone 16 Pro";
    if (platform == "iPhone17,4") return "iPhone 16 Pro Max";
    if (platform == "iPhone17,5") return "iPhone SE (4rd generation)";

    // iPad
    if (platform == "iPad1,1") return "iPad";
    if (platform == "iPad2,1") return "iPad 2";
    if (platform == "iPad2,2") return "iPad 2";
    if (platform == "iPad2,3") return "iPad 2";
    if (platform == "iPad2,4") return "iPad 2";
    if (platform == "iPad3,1") return "iPad (3rd generation)";
    if (platform == "iPad3,2") return "iPad (3rd generation)";
    if (platform == "iPad3,3") return "iPad (3rd generation)";
    if (platform == "iPad3,4") return "iPad (4th generation)";
    if (platform == "iPad3,5") return "iPad (4th generation)";
    if (platform == "iPad3,6") return "iPad (4th generation)";
    if (platform == "iPad6,11") return "iPad (5th generation)";
    if (platform == "iPad6,12") return "iPad (5th generation)";
    if (platform == "iPad7,5") return "iPad (6th generation)";
    if (platform == "iPad7,6") return "iPad (6th generation)";
    if (platform == "iPad7,11") return "iPad (7th generation)";
    if (platform == "iPad7,12") return "iPad (7th generation)";
    if (platform == "iPad11,6") return "iPad (8th generation)";
    if (platform == "iPad11,7") return "iPad (8th generation)";
    if (platform == "iPad12,1") return "iPad (9th generation)";
    if (platform == "iPad12,2") return "iPad (9th generation)";

    // iPad Air
    if (platform == "iPad4,1") return "iPad Air";
    if (platform == "iPad4,2") return "iPad Air";
    if (platform == "iPad4,3") return "iPad Air";
    if (platform == "iPad5,3") return "iPad Air 2";
    if (platform == "iPad5,4") return "iPad Air 2";
    if (platform == "iPad11,3") return "iPad Air (3rd generation)";
    if (platform == "iPad11,4") return "iPad Air (3rd generation)";
    if (platform == "iPad13,1") return "iPad Air (4th generation)";
    if (platform == "iPad13,2") return "iPad Air (4th generation)";
    if (platform == "iPad13,16") return "iPad Air (5th generation)";
    if (platform == "iPad13,17") return "iPad Air (5th generation)";

    // iPad mini
    if (platform == "iPad2,5") return "iPad mini";
    if (platform == "iPad2,6") return "iPad mini";
    if (platform == "iPad2,7") return "iPad mini 1";
    if (platform == "iPad4,4") return "iPad mini 2";
    if (platform == "iPad4,5") return "iPad mini 2";
    if (platform == "iPad4,6") return "iPad mini 2";
    if (platform == "iPad4,7") return "iPad mini 3";
    if (platform == "iPad4,8") return "iPad mini 3";
    if (platform == "iPad4,9") return "iPad mini 3";
    if (platform == "iPad5,1") return "iPad mini 4";
    if (platform == "iPad5,2") return "iPad mini 4";
    if (platform == "iPad11,1") return "iPad mini (5th generation)";
    if (platform == "iPad11,2") return "iPad mini (5th generation)";
    if (platform == "iPad14,1") return "iPad mini (6th generation)";
    if (platform == "iPad14,2") return "iPad mini (6th generation)";

    // iPad Pro
    if (platform == "iPad6,3") return "iPad Pro (9.7-inch)";
    if (platform == "iPad6,4") return "iPad Pro (9.7-inch)";
    if (platform == "iPad6,7") return "iPad Pro (12.9-inch)";
    if (platform == "iPad6,8") return "iPad Pro (12.9-inch)";
    if (platform == "iPad7,1") return "iPad Pro (12.9-inch) (2nd generation)";
    if (platform == "iPad7,2") return "iPad Pro (12.9-inch) (2nd generation)";
    if (platform == "iPad7,3") return "iPad Pro (10.5 inch)";
    if (platform == "iPad7,4") return "iPad Pro (10.5-inch)";
    if (platform == "iPad8,1") return "iPad Pro (11-inch)";
    if (platform == "iPad8,2") return "iPad Pro (11-inch)";
    if (platform == "iPad8,3") return "iPad Pro (11-inch)";
    if (platform == "iPad8,4") return "iPad Pro (11-inch)";
    if (platform == "iPad8,5") return "iPad Pro (12.9-inch) (3rd generation)";
    if (platform == "iPad8,6") return "iPad Pro (12.9-inch) (3rd generation)";
    if (platform == "iPad8,7") return "iPad Pro (12.9-inch) (3rd generation)";
    if (platform == "iPad8,8") return "iPad Pro (12.9-inch) (3rd generation)";
    if (platform == "iPad8,9") return "iPad Pro (11-inch) (2nd generation)";
    if (platform == "iPad8,10") return "iPad Pro (11-inch) (2nd generation)";
    if (platform == "iPad8,11") return "iPad Pro (12.9-inch) (4th generation)";
    if (platform == "iPad8,12") return "iPad Pro (12.9-inch) (4th generation)";
    if (platform == "iPad13,4") return "iPad Pro (11-inch) (3rd generation)";
    if (platform == "iPad13,5") return "iPad Pro (11-inch) (3rd generation)";
    if (platform == "iPad13,6") return "iPad Pro (11-inch) (3rd generation)";
    if (platform == "iPad13,7") return "iPad Pro (11-inch) (3rd generation)";
    if (platform == "iPad13,8") return "iPad Pro (12.9-inch) (5th generation)";
    if (platform == "iPad13,9") return "iPad Pro (12.9-inch) (5th generation)";
    if (platform == "iPad13,10") return "iPad Pro (12.9-inch) (5th generation)";
    if (platform == "iPad13,11") return "iPad Pro (12.9-inch) (5th generation)";
    if (platform == "iPad14,5") return "iPad Pro (12.9-inch) (6th generation)";

    // iPod Touch
    if (platform == "iPod1,1") return "iPod Touch";
    if (platform == "iPod2,1") return "iPod Touch 2";
    if (platform == "iPod3,1") return "iPod Touch 3";
    if (platform == "iPod4,1") return "iPod Touch 4)";
    if (platform == "iPod5,1") return "iPod Touch 5";
    if (platform == "iPod7,1") return "iPod Touch 6";
    if (platform == "iPod9,1") return "iPod Touch 7";

    // Apple Watch
    if (platform == "Watch1,1") return "Apple Watch";
    if (platform == "Watch1,2") return "Apple Watch";
    if (platform == "Watch2,6") return "Apple Watch Series 1";
    if (platform == "Watch2,7") return "Apple Watch Series 1";
    if (platform == "Watch2,3") return "Apple Watch Series 2";
    if (platform == "Watch2,4") return "Apple Watch Series 2";
    if (platform == "Watch3,1") return "Apple Watch Series 3";
    if (platform == "Watch3,2") return "Apple Watch Series 3";
    if (platform == "Watch3,3") return "Apple Watch Series 3";
    if (platform == "Watch3,4") return "Apple Watch Series 3";

    // Apple TV
    if (platform == "AppleTV5,3") return "Apple TV";

    // 模拟器
    if (platform == "i386") return "iPhone Simulator";
    if (platform == "x86_64") return "iPhone Simulator";

    // 通过进程信息获取模拟器名称
    if (platform == "i386" || platform == "x86_64") {
      // 通过进程信息获取
      Map<String, String> processDict = Platform.environment;
      String? processDeviceName = processDict["SIMULATOR_DEVICE_NAME"];
      return "$processDeviceName Simulator";
    }

    // 没有匹配到设备
    return platform;
  }
}

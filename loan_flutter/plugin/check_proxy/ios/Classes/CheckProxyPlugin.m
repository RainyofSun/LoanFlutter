#import "CheckProxyPlugin.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <NetworkExtension/NetworkExtension.h>

@interface CheckProxyPlugin ()

@property (nonatomic, strong) FlutterMethodChannel* channel;

@end

@implementation CheckProxyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"check_proxy" binaryMessenger:[registrar messenger]];
  CheckProxyPlugin* instance = [[CheckProxyPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
  instance.channel = channel;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"isVPNActive" isEqualToString:call.method]) {
      //是否使用了VPN
//      result(@([self isVPNConnected]));
        result(@NO);
  }else if([@"isManualProxySet" isEqualToString:call.method]){
      //是否手动设置了代理
//      result(@([self isProxyEnabled]));
      result(@NO);
  } else {
      result(FlutterMethodNotImplemented);
  }
}

/*
//是否 使用了 代理 或者 VPN
- (bool)checkNetworkStatus {
    if ([self isVPNConnected] || [self isProxyEnabled]) {
        return YES;
    }
    return NO;
}


//是否使用了 代理
- (bool)isProxyEnabled {
    NSDictionary *proxySettings = (__bridge NSDictionary *)CFNetworkCopySystemProxySettings();

    if (proxySettings) {
        NSString *proxyHost = proxySettings[(NSString *)kCFNetworkProxiesHTTPProxy];
        if (proxyHost) {
            return YES;
        }
    }
    return NO;
}


//是否使用了 VPN
- (bool)isVPNConnected {
    __block bool isConnected = NO;

    // 获取共享的 VPN 管理器实例
    NEVPNManager *vpnManager = [NEVPNManager sharedManager];

    // 加载 VPN 配置信息
    [vpnManager loadFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error loading VPN preferences: %@", error.localizedDescription);
            return;
        }

        // 检查 VPN 连接状态
        if (vpnManager.connection.status == NEVPNStatusConnected) {
            isConnected = YES;
        } else {
            isConnected = NO;
        }

        // 打印 VPN 状态
//        NSLog(@"VPN connected: %@", isConnected ? @"YES" : @"NO");
    }];

    // 由于 loadFromPreferences 是异步的，这里不能立即返回正确结果
    // 你可以使用回调方式将结果传递出去
    return isConnected;
}
*/

@end

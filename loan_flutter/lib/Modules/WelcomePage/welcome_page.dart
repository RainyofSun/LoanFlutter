import 'package:flutter/material.dart';
import 'package:loan_flutter/Entity/app_init_entity.dart';
import 'package:loan_flutter/Util/http/callback_config.dart';
import 'package:loan_flutter/Util/http/http_client.dart';
import 'package:loan_flutter/Util/http/request_config.dart';
import 'package:permission_handler/permission_handler.dart';

class WelcomePage extends StatelessWidget {
  Future<void> _requestLocationPermission(BuildContext context) async {
    // 首先检查权限状态
    var status = await Permission.locationWhenInUse.status;
    
    if (status.isGranted) {
      // 权限已经被授予
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('定位权限已授予')),
      );
    } else if (status.isDenied) {
      // 请求权限
      status = await Permission.locationWhenInUse.request();
      if (status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('定位权限已授予')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('定位权限被拒绝')),
        );
      }
    } else if (status.isPermanentlyDenied) {
      // 权限被永久拒绝，需要用户手动开启
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('请在设置中手动开启定位权限'),
          action: SnackBarAction(
            label: '去设置',
            onPressed: () => openAppSettings(),
          ),
        ),
      );
    }
  }

  Future<void> _requestPhotosPermission(BuildContext context) async {
    var status = await Permission.photos.status;
    
    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('相册权限已授予')),
      );
    } else if (status.isDenied) {
      status = await Permission.photos.request();
      if (status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('相册权限已授予')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('相册权限被拒绝')),
        );
      }
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('请在设置中手动开启相册权限'),
          action: SnackBarAction(
            label: '去设置',
            onPressed: () => openAppSettings(),
          ),
        ),
      );
    }
  }

  Future<void> _requestContactsPermission(BuildContext context) async {
    var status = await Permission.contacts.status;
    
    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('通讯录权限已授予')),
      );
    } else if (status.isDenied) {
      status = await Permission.contacts.request();
      if (status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('通讯录权限已授予')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('通讯录权限被拒绝')),
        );
      }
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('请在设置中手动开启通讯录权限'),
          action: SnackBarAction(
            label: '去设置',
            onPressed: () => openAppSettings(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fsdffdskfjh'),
      ),
      body: Center(
        child: Column(
          children: [
            FloatingActionButton(onPressed: () {
              HttpClient.instance.post("said/concerning",
                queryParameters: {"concerning":"en", "discoveries": 0, "physiology":1},
                config: RequestConfig<AppInitEntity>(
                fromJson: AppInitEntity.fromJson,
              ),
                callback: CallbackConfig<AppInitEntity>(
                  onSuccess: (user) {
                    print('Success: User ${user.circuit?.transistors} fetched successfully');
                    HttpClient.instance.updateBaseUrl("http://www.baidu.com");
                  },
                  onError: (error) {
                    print('Local Error Handler: Failed to fetch user: $error');
                    HttpClient.instance.updateBaseUrl("http://8.219.200.27/quen/");
                  },
                ),);
            },),
            FloatingActionButton(
              onPressed: () => _requestLocationPermission(context),
              child: Text("定位权限"),
            ),
            FloatingActionButton(
              onPressed: () => _requestPhotosPermission(context),
              child: Text("相册权限"),
            ),
            FloatingActionButton(
              onPressed: () => _requestContactsPermission(context),
              child: Text("通讯录权限"),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loan_flutter/Entity/app_init_entity.dart';
import 'package:loan_flutter/Util/http/callback_config.dart';
import 'package:loan_flutter/Util/http/http_client.dart';
import 'package:loan_flutter/Util/http/request_config.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('fsdffdskfjh'),
      ),
      body: Center(
        child: FloatingActionButton(onPressed: () {
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
                // 这里可以添加特定请求的错误处理逻辑
                HttpClient.instance.updateBaseUrl("http://8.219.200.27/quen/");
              },
            ),);
        },),
      ),
    );
  }
}
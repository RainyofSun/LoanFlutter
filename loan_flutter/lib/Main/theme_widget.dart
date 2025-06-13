
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_flutter/Modules/WelcomePage/welcome_page.dart';
import 'package:loan_flutter/Util/app_sp_util.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({super.key});

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white, // 设置底部导航栏颜色
            // systemNavigationBarIconBrightness:
            //     MyApp.themes(context).isDarkTheme ? Brightness.light : Brightness.dark, // 设置底部图标颜色
            // systemNavigationBarDividerColor: Colors.yellow, // 底部导航栏分隔线颜色
      ),
    );

    return MaterialApp(
      title: '新概念AI版',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // 设置背景色
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF333333)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
      ),
      debugShowCheckedModeBanner: false,
      home: currentSplashView(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: child!,
        );
      }
    );
  }

  Widget currentSplashView() {
    if (APPSPUtil.isFirstInstallerAPP()) {
      return WelcomePage();
    }
    // if (toMainPageFlag) {
    //   return const NCMainView();
    // }
    // return const NCLoginView(null);
    return WelcomePage();
  }
}
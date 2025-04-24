import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mshaikh_sudan/screens/splash/splash_screen.dart';

import 'config/themes/app_theme.dart';

class MshaikhApp extends StatelessWidget {
  const MshaikhApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'Mshaikh Sudan',
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          locale: const Locale('Ar'), // Locale for Arabic, or any RTL language
          home: SplashScreen(),
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl, // Force RTL globally
              child:
                  EasyLoading.init()(context, child), // Initialize EasyLoading
            );
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application/routes/RouteUtils.dart';
import 'package:flutter_application/routes/routes.dart';
import 'package:flutter_application/screens/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

// // 设计尺寸
// Size get designSize => {
//   final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return OKToast(
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            navigatorKey: RouteUtils.navigatorKey,
            onGenerateRoute: Routes.generateRoute,
            initialRoute: RoutePath.home,
          ),
        );
      },
    );
  }
}

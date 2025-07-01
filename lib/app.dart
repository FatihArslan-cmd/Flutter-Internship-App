import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Color.fromARGB(255, 255, 255, 255),
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        title: 'Flutter internship app',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.loginPage,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
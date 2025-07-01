import 'package:flutter/material.dart';
import 'core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter internship app',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginPage,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/forgotpassword_page.dart';

class AppRoutes {
  static const String loginPage = '/';
  static const String registerPage = '/register';
  static const String forgotPasswordPage = '/forgot-password';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page = const SizedBox.shrink();

    final String routeName = settings.name ?? '';

    switch (routeName) {
      case AppRoutes.loginPage:
        page = const LoginScreen();
        break;
      case AppRoutes.registerPage:
        page = const HomeScreen();
        break;
        case AppRoutes.forgotPasswordPage:
        page = const ForgotpasswordPage();
        break;
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
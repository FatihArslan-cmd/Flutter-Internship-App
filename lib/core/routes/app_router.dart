import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/test_page.dart';
import '../../features/splash/splash_page.dart';

class AppRoutes {
  static const String loginPage = '/';
  static const String registerPage = '/register';
  static const String forgotPasswordPage = '/forgot-password';
  static const String homePage = '/home-page';
  static const String testPage = '/test-page';
  static const String splashPage = '/splash';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page = const SizedBox.shrink();

    final String routeName = settings.name ?? '';

    switch (routeName) {
      case AppRoutes.loginPage:
        page = LoginScreen();
        break;
      case AppRoutes.registerPage:
        page = RegisterPage();
        break;
      case AppRoutes.forgotPasswordPage:
        page = ForgotpasswordPage();
        break;
      case AppRoutes.homePage:
        page = HomeScreen();
        break;
         case AppRoutes.splashPage:
        page = SplashPage();
        break;
      case AppRoutes.testPage:
        page = TestScreen();
        break;
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}

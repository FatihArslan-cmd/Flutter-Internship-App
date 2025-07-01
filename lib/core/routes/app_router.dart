import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import 'page_transitions.dart';

class AppRoutes {
  static const String loginScreen = '/';
  static const String homeScreen = '/home';
  static const String error = '/error';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    Widget page;
    final String routeName = settings.name ?? '';

    switch (routeName) {
      case AppRoutes.loginScreen:
        page = const LoginScreen();
        break;
      case AppRoutes.homeScreen:
        page = const HomeScreen();
        break;
      case AppRoutes.error:
        final String? errorMessage = args is String ? args : 'An unknown error occurred or the route was not found.';
        page = _errorRouteWidget(errorMessage);
        break;

      default:
        page = _errorRouteWidget('Route not found: "$routeName"');
    }

    return buildScaleFadeTransitionRoute(page);
  }

  static Widget _errorRouteWidget(String? message) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            message ?? 'An error occurred.',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
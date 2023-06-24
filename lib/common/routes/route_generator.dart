import 'package:flutter/material.dart';
import 'package:task_management/common/routes/route_name.dart';
import 'package:task_management/features/auth/pages/login_page.dart';
import 'package:task_management/features/auth/pages/otp_page.dart';
import 'package:task_management/features/onboarding/pages/onboarding_page.dart';
import 'package:task_management/features/todo/pages/home_page.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );
      case RouteName.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case RouteName.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case RouteName.otp:
        return MaterialPageRoute(
          builder: (_) => const OtpPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Halaman tidak ditemukan'),
        ),
      );
    });
  }
}

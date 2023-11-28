
import 'package:flutter/material.dart';
import 'package:wander_animation/login/login_screen.dart';
import 'package:wander_animation/login/otp_screen.dart';
import 'package:wander_animation/login/password_screen.dart';
import 'package:wander_animation/login/recovery_option_screen.dart';

import '../../pages_page/home_page.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'HomePage':
        {
          return MaterialPageRoute(
              builder: (context) => const HomePage());
        }
      case 'LoginScreen':
        {
          return MaterialPageRoute(
              builder: (context) => const LoginPage());
        }
      case 'RecoveryOptionsScreen':
        {
          return MaterialPageRoute(
              builder: (context) => const RecoveryScreen());
        }
      case 'OtpScreen':
        {
          return MaterialPageRoute(builder: (context)=> const OTPPage());
        }
      case 'PassScreen':
        {
          return MaterialPageRoute(builder: (context)=>const PassPage());
        }
     
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}

import 'package:e_commerce_app/core/theme/app_theme.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const LoginScreen(),
    );
  }
}

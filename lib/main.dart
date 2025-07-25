import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_theme.dart';
import 'package:flutter_task/views/login_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: LoginView()),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}

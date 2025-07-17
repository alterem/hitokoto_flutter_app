import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: '一言',
      theme: CupertinoThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(
              isDarkMode: _isDarkMode,
              toggleTheme: toggleTheme,
            ),
      },
    );
  }
}

import 'package:e_commerce/screens/auth_ui/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CJF ComputerShop',
      theme: themeData,
      home: Welcome(),
    );
  }
}


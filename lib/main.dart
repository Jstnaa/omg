import 'package:e_commerce/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce/screens/auth_ui/welcome/welcome.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/constants/theme.dart';

import 'firebase_helper/firebase_option/firebase_Options.dart';
import 'package:e_commerce/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.current_Platform,
  );


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
      home:  StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          }
          return const Welcome();
        }
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/top_tiles/top_tiles.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
          TopTiles(
            subtitle: "Welcome back to CJF Computer Shop", title: "Login"),
          TextFormField(),
          ],
        ),
      ),
    );
  }
}
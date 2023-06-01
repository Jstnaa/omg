import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/constants/asset_images.dart';
import 'package:e_commerce/widgets/primarybutton/primary_button.dart';
import 'package:e_commerce/widgets/top_tiles/top_tiles.dart';
import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/screens/auth_ui/login/login.dart';

import 'package:e_commerce/screens/auth_ui/sign_up/signUp.dart';


class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopTiles(
            subtitle: "Looking for the best deals on cutting-edge tech products? Look no further than CJF Computer Shop, your one-stop-shop for all things tech in the Philippines!", 
            title: "Welcome to CJF Computer Shop"
          ),
          const SizedBox(
            height: kToolbarHeight + 12,
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: Image.asset(
              AssetsImage.instance.welcomeImage,
          ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.facebook,
                  size: 50,
                  color: Colors.blue,
                ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
              ),
            PrimaryButton(
               title: "Login",
               onPressed: () {
                Routes.instance.push(widget: const Login(), context: context);
               },
               ), 
            const SizedBox(
              height: 18.0,
            ),
            PrimaryButton(
               title: "Sign Up",onPressed: (){
                 Routes.instance.push(widget: const Signup(), context: context);
               },
               ), 
        ],
      ),
      ),);
  }
}
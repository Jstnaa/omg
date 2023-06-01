// ignore_for_file: use_build_context_synchronously, file_names

import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/top_tiles/top_tiles.dart';
import 'package:e_commerce/widgets/primarybutton/primary_button.dart';

import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

    @override
    State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isShowPassword = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
          const TopTiles(
            subtitle: "Nice to see you here at CJF Computer Shop", title: "Create Account"),
            const SizedBox(
              height: 46.0,
            ),
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              hintText: "Name",
              prefixIcon: Icon(
                Icons.person_outlined,
              )
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "E-mail",
              prefixIcon: Icon(
                Icons.email_outlined,
              )
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            controller: phone,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: "Phone",
              prefixIcon: Icon(
                Icons.phone_outlined,
              )
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            controller: password,
            obscureText: isShowPassword,
            decoration:  InputDecoration(
              hintText: "Password",
              prefixIcon: const Icon(
                Icons.password_sharp,
              ),
              suffixIcon: CupertinoButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                padding: EdgeInsets.zero,
                child: const Icon(
                Icons.visibility,
                color: Colors.grey,
                ),
            ),
            ),
          ),
          const SizedBox(
            height: 36.0,
          ),
         PrimaryButton(
          title: "Create an Account",
          onPressed: () async{
            bool isValidated = signUpValidation(
              email.text, password.text, name.text, phone.text);
          if(isValidated) {
          bool isLogined = await FirebaseAuthHelper.instance
                .signUp(email.text, password.text, context);
                if(isLogined){
                  Routes.instance.pushAndRemoveUntil(
                    widget: const Home(), context: context);
              }
             }
          },
          ),
          const SizedBox(
            height: 24.0,
          ),
          const Center(
            child:Text(
            "Already have an account?")),
          const SizedBox(
            height: 12.0,
            ),
            const Center(
            child:Text(
            "Click Login")),
          const SizedBox(
            height: 12.0,
            ),
            Center(
              child: CupertinoButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.black),
            ),
            ),
              ),
          ],
        ),
      ),
      ),  
    );
  }
}
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login_screen/core/color_constants.dart';
import 'package:login_screen/core/image_constants.dart';
import 'package:login_screen/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Autumn"), centerTitle: true),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(ImageConstant.bgImage))),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Logged In",
              style: TextStyle(
                  color: ColorConstant.primaryWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences userObj =
                      await SharedPreferences.getInstance();
                  userObj.setBool("isLogged", false);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      ((route) => false));
                },
                child: Text("Logout"))
          ],
        )),
      ),
    );
  }
}

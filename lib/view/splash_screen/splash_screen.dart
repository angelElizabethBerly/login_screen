import 'package:flutter/material.dart';
import 'package:login_screen/core/color_constants.dart';
import 'package:login_screen/core/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(ImageConstant.bgImage))),
        child: Center(
            child: Text(
          "Autumn",
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: ColorConstant.primaryWhite),
        )),
      ),
    );
  }
}

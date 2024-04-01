import 'package:flutter/material.dart';
import 'package:login_screen/core/color_constants.dart';
import 'package:login_screen/core/image_constants.dart';
import 'package:login_screen/view/home_screen/home_screen.dart';
import 'package:login_screen/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) async {
        SharedPreferences userObj = await SharedPreferences.getInstance();
        final isLogged = userObj.getBool("isLogged");
        if (isLogged == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
    );
    super.initState();
  }

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

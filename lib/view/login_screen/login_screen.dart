// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_screen/core/image_constants.dart';
import 'package:login_screen/core/color_constants.dart';
import 'package:login_screen/view/home_screen/home_screen.dart';
import 'package:login_screen/view/registration_screen/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(ImageConstant.bgImage))),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorConstant.primaryWhite.withOpacity(0.5)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.primaryWhite,
                      fontSize: 30),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: userNameController,
                  cursorColor: ColorConstant.primaryWhite,
                  style: TextStyle(color: ColorConstant.primaryWhite),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.primaryWhite, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.primaryWhite, width: 2)),
                      hintText: "Enter Username",
                      hintStyle: TextStyle(color: ColorConstant.primaryWhite)),
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  cursorColor: ColorConstant.primaryWhite,
                  style: TextStyle(color: ColorConstant.primaryWhite),
                  controller: passwordController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.primaryWhite, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.primaryWhite, width: 2)),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: ColorConstant.primaryWhite)),
                ),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        onPressed: () async {
                          SharedPreferences userObj =
                              await SharedPreferences.getInstance();
                          final savedUserName = userObj.getString("userName");
                          final savedPassword = userObj.getString("password");

                          if ((userNameController.text.isNotEmpty) &&
                              (passwordController.text.isNotEmpty)) {
                            if (savedUserName == userNameController.text &&
                                savedPassword == passwordController.text) {
                              userObj.setBool("isLogged", true);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Wrong username or password")));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login failed")));
                          }
                        },
                        child: Text("Login"))),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text("Don't have an account, register first",
                        style: TextStyle(
                            color: ColorConstant.primaryWhite,
                            fontWeight: FontWeight.w500)))
              ],
            ),
          ),
        )),
      ),
    );
  }

  Future<bool> showLoginPage() async {
    SharedPreferences loginObj = await SharedPreferences.getInstance();
    bool? user = loginObj.getBool("loggedIn");
    return user == null;
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_screen/core/color_constants.dart';
import 'package:login_screen/core/image_constants.dart';
import 'package:login_screen/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? registeredName;
  String? registeredPwd;

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
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.primaryWhite,
                      fontSize: 30),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: userNameController,
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
                          if (userNameController.text != "" &&
                              passwordController.text != "") {
                            SharedPreferences userObj =
                                await SharedPreferences.getInstance();
                            userObj.setString(
                                "userName", userNameController.text);
                            SharedPreferences pwdObj =
                                await SharedPreferences.getInstance();
                            pwdObj.setString(
                                "password", passwordController.text);
                            registeredName = userObj.getString("userName");
                            registeredPwd = pwdObj.getString("password");
                            setState(() {});
                          }
                        },
                        child: Text("Register"))),
                SizedBox(height: 5),
                Text(
                  (registeredName != null && registeredPwd != null)
                      ? "Registration successful. Login to continue"
                      : "",
                  style: TextStyle(
                      color: ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                Visibility(
                  visible: (registeredName != null && registeredPwd != null)
                      ? true
                      : false,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: ColorConstant.primaryWhite, fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

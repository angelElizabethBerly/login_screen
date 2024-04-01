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
                          if (userNameController.text != "" &&
                              passwordController.text != "") {
                            SharedPreferences userObj =
                                await SharedPreferences.getInstance();
                            userObj.setString(
                                "userName", userNameController.text);

                            userObj.setString(
                                "password", passwordController.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Invalid username or password")));
                          }
                        },
                        child: Text("Register"))),
                SizedBox(height: 5),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text("Already have an account? Login",
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
}

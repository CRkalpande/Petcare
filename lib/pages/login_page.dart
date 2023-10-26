// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:petcare/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SafeArea(
          child: Form(
            key: _formkey,
            child: Column(children: [
              Image.asset("assets/images/login_image.png"),
              Text(
                "Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter UserName",
                        labelText: "UserName",
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Username cannot be Empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                          hintText: " Enter Password",
                          labelText: "Password",
                          suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              })),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Password cannot be Empty";
                        } else if (value != null && value.length < 6) {
                          return "password length should be atleat 6";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, MyRoutes.homeRoute);
                      }
                    },
                    style: ElevatedButton.styleFrom(fixedSize: Size(125, 50)),
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Don't have an account ? ",
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: "Sign up",
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, MyRoutes.signinRoute);
                      })
              ]))
            ]),
          ),
        ));
  }
}

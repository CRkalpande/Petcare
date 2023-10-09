// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool passwordVisible = false;

  final _formkey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey1,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/hey2.png",
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter first name",
                          labelText: "First Name",
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "First name cannot be Empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Last name",
                          labelText: "Last Name",
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Last name cannot be Empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter User name",
                          labelText: "User Name",
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
                            hintText: "Enter enter password",
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            )),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "password cannot be empty";
                          } else if (value != null && value.length < 6) {
                            return "password length atleast 6";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        // keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            hintText: "Enter Date of Birth ", labelText: "DOB"),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "DOB cannot be Empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "Enter Mobile No.",
                            labelText: "Mobile No."),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "mobile no. cannot be Empty";
                          } else if (value != null &&
                              (value.length < 10 || value.length > 10)) {
                            return "enter a valid mobile no.";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Enter Email", labelText: "Email"),
                            validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Email cannot be Empty";
                          }
                          else if(value!=null && !value.contains("@gmail.com"))
                          {
                            return "enter valid email";
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
                        if (_formkey1.currentState!.validate()) {}
                      },
                      style: ElevatedButton.styleFrom(fixedSize: Size(125, 50)),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Already have account ? ",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "Log in here",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.popUntil(
                              context, (ModalRoute.withName("/")));
                        })
                ])),SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

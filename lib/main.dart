
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:petcare/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/pages/signin_page.dart';
import 'package:petcare/utils/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute:  MyRoutes.loginRoute,
      routes: {
        "/":(context) => LoginPage(),
        MyRoutes.loginRoute:(context) => LoginPage(),
        MyRoutes.signinRoute:(context) => SignIn(),
      
      },
    );
  }
}

import 'package:dailyrecord/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:dailyrecord/signup.dart';

void main() {
  runApp(new MaterialApp(
    home: Signup()
  ));
}

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 15,
      backgroundColor: Color(0xff000000),
      image: Image.network("https://myenglishmatters.com/wp-content/uploads/2020/11/placeholder.png"),
      loaderColor: Color(0xffffffff),
      photoSize: 150.00,
      navigateAfterSeconds: Login(),
    );
  }
}

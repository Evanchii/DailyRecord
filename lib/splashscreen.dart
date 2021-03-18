import 'package:dailyrecord/login.dart';
import 'package:dailyrecord/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:dailyrecord/user.dart';

void main() {
  //check if user has active session
  if(false) {
    Dashboard();
  }

  runApp(new MaterialApp(
    home: User(),
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      primaryColor: Color(0xffffd84d),
      accentColor: Color(0xffF7971D),

      // Define the default font family.
      // fontFamily: 'Georgia',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
      ),
    ),
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

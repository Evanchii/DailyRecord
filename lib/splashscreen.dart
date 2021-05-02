import 'package:dailyrecord/apply.dart';
import 'package:dailyrecord/login.dart';
import 'package:dailyrecord/dashframe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  // permissionCheck();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //check if user has active session

  if (FirebaseAuth.instance.currentUser != null) {
    runApp(new MaterialApp(
      home: Login(),
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Color(0xffffd84d),
        accentColor: Color(0xffF7971D),
        backgroundColor: Color(0xff303030),
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
  } else {
    runApp(new MaterialApp(
      home: Splashscreen(),
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Color(0xffffd84d),
        accentColor: Color(0xffF7971D),
        backgroundColor: Color(0xff303030),
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
}

void permissionCheck() async {
  var status = await Permission.camera.status;
  while (!(status.isGranted || status.isLimited)) Permission.camera.request();
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
      backgroundColor: Theme.of(context).backgroundColor,
      image: Image.asset("assets/logo.png"),
      loaderColor: Color(0xffffffff),
      photoSize: 150.00,
      navigateAfterSeconds: Login(),
    );
  }
}

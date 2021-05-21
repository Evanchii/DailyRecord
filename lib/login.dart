import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'dashframe.dart';
import 'signup.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State {
  bool fail = false;
  final email = TextEditingController(),
      password = TextEditingController(),
      forgotEmail = TextEditingController();

  DatabaseReference dbRef = FirebaseDatabase().reference();

  @override
  void dispose() {
    forgotEmail.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void login() async {
    FocusScope.of(context).unfocus();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Container(
            height: 100,
            padding: EdgeInsets.all(15),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                new CircularProgressIndicator(),
                new SizedBox(
                  width: 15,
                ),
                new Text("Logging in..."),
              ],
            ),
          ),
        );
      },
    );

    if (email.text.isNotEmpty && password.text.isNotEmpty) {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email.text, password: password.text);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashFrame()),
          );
        } on FirebaseAuthException catch (e) {
          Navigator.pop(context);
          if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("User not found!")));
          } else if (e.code == 'wrong-password') {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Wrong password!")));
          }
        }
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please provide all needed information")));
    }
  }

  void success() {
    if(!fail) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email has been sent!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  "Email Address does not exists!")));
    }
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    void forgotPassword() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Forgot password',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: forgotEmail,
                    decoration: InputDecoration(hintText: "Email Address"),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if(forgotEmail.text.contains('@dailyrecord.com'))
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Feature is disabled for Demo Accounts.')));
                        else {
                          fail = false;
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: forgotEmail.text)
                              .onError((error, stackTrace) => fail = true)
                              .whenComplete(() => success());
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          });
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    //form
                    padding: EdgeInsets.only(top: height * .15),
                    alignment: Alignment.center,
                    height: height * .80,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Log in',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            fillColor: Color(0x66B6B6B6),
                            filled: true,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                decorationColor: Colors.white),
                          ),
                          cursorColor: Theme.of(context).accentColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: password,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            fillColor: Color(0x66B6B6B6),
                            filled: true,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              decorationColor: Colors.white,
                            ),
                          ),
                          cursorColor: Theme.of(context).accentColor,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: login,
                          child: Text('Log in'),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                          ),
                        ),
                        TextButton(
                          onPressed: forgotPassword,
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Don\'t have an account?\nSign up!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'dashframe.dart';
import 'signup.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State {
  final stdNo = TextEditingController(),
      password = TextEditingController(),
      email = TextEditingController();

  String strEmail;

  DatabaseReference dbRef = FirebaseDatabase().reference();

  @override
  void dispose() {
    email.dispose();
    stdNo.dispose();
    password.dispose();
    super.dispose();
  }

  Future<String> checkUser() async {
    await dbRef.child('student').child(stdNo.text).child('email').once().then((DataSnapshot data){
      print('std'+data.value);
      if(data.value != null) {
        strEmail = data.value;
      }
    });
    await dbRef.child('faculty').child(stdNo.text).child('email').once().then((DataSnapshot data){
      // print('fac'+data.value);
      if(data.value != null) {
        print('fac: true');
        strEmail = data.value;
      }
    });
    await dbRef.child('admin').child(stdNo.text).child('email').once().then((DataSnapshot data){
      // print('ad'+data.value);
      if(data.value != null) {
        print('ad: true');
        strEmail = data.value;
      }
    });
    return null;
  }

  void login() async {
    print('Pressed!');
    print('ID/PW\t'+stdNo.text+'\t'+password.text);
    if (stdNo.text.isNotEmpty && password.text.isNotEmpty) {
      await checkUser();
      if(strEmail.isNotEmpty) {
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: strEmail.toString(),
              password: password.text);
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashFrame()),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("User not found!")));
          } else if (e.code == 'wrong-password') {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Wrong password!")));
          }
        }
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User not found!")));
      }
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please provide all needed information")));
    }
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    void forgotPassword() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Forgot password'),
              content: TextField(
                controller: email,
                decoration: InputDecoration(hintText: "Email Address"),
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
                  // Container(
                  //   //for logo
                  //   height: height * .15,
                  //   child: Center(
                  //     child: Image(
                  //       image: AssetImage('assets/banner.png'),
                  //     )
                  //   ),
                  // ),
                  Container(
                    //form
                    padding: EdgeInsets.only(top: height * .15),
                    alignment: Alignment.center,
                    height: height*.80,
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
                          controller: stdNo,
                          decoration: InputDecoration(
                            hintText: 'Student Number',
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

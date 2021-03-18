import 'package:dailyrecord/dashframe.dart';
import 'package:dailyrecord/signup.dart';
import 'package:dailyrecord/user.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    final stdNo = TextEditingController(),
        password = TextEditingController(),
        email = TextEditingController();

    void login() {
      print('Pressed!');
      if(true) {//user found
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashFrame()),
        );
      }
    }

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
      backgroundColor: Colors.grey[2000],
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(//for logo
                    height: height*.15,
                    child: Center(
                      child: Text('Placeholder'),
                    ),
                  ),
                  Container(//form
                    alignment: Alignment.center,
                    height: height*.60,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child:Text(
                            'Log in',
                            style: TextStyle(fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: stdNo,
                          decoration: InputDecoration(
                            hintText: 'Student Number',
                            fillColor: Color(0x66B6B6B6),
                            filled: true,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                decorationColor: Colors.white
                            ),
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

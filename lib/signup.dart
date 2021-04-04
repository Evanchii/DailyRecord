import 'package:dailyrecord/signUpGetterAndSetter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool exist;
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("student");
  TextEditingController email = TextEditingController(),
      stdNo = TextEditingController(),
      password = TextEditingController(),
      confPass = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    stdNo.dispose();
    password.dispose();
    confPass.dispose();
    super.dispose();
  }

  Future<bool> rootFirebaseIsExists(DatabaseReference databaseReference) async {
    DataSnapshot snapshot = await databaseReference.once();
    return snapshot != null;
  }

  void signUp() async {
    FocusScope.of(context).unfocus();
    print('hi');
    if (email.text != null &&
        stdNo.text != null &&
        password.text != null &&
        confPass.text != null) {
      print('2');
      print(password.text+"\n"+confPass.text);
      if (password.text == confPass.text) {
        print('3');
        try {
          await databaseReference.child(stdNo.text).child("email").once().then((DataSnapshot data) {
            print(data.value);
            exist = data.value != null;
            print("AAA "+exist.toString());
            print(exist);
            if(!exist) {
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email.text, password: password.text);
              print(email.text+'\t'+stdNo.text+'\t'+password.text);
              databaseReference
                  .child(stdNo.text)
                  .set({'usertype': "student"});
              databaseReference
                  .child("${stdNo.text}")
                  .set({'park': false});
              databaseReference
                  .child(stdNo.text)
                  .set({'email': email.text});
              Navigator.pop(context);
            } else
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Student ID is in use")));
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("The password provided is too weak")));
          } else if (e.code == 'email-already-in-use') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("The account already exists for that email.")));
          }
        } catch (e) {
          print(e);
        }
      } else
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Passwords must match!")));
    } else
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please provide all needed information")));
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: height * .15,
                    child: Center(
                      child: Text('Placeholder'),
                    ),
                  ),
                  Container(
                    height: height * .60 < 328.0 ? 328.0 : height * .60,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                          controller: stdNo,
                          decoration: InputDecoration(
                            hintText: 'Student Number',
                            fillColor: Color(0x66B6B6B6),
                            filled: true,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              decorationColor: Colors.white,
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
                        TextField(
                          controller: confPass,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
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
                          onPressed: signUp,
                          child: Text('Sign Up'),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Already have an account?\nLog in!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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

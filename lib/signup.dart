
import 'package:dailyrecord/signUpGetterAndSetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class SignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    signInGetterAndSetter getterAndSetter = new signInGetterAndSetter();
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

    final email = TextEditingController(),
        stdNo = TextEditingController(),
        password = TextEditingController(),
        confPass = TextEditingController();



    void _getterAndSetter(){
      getterAndSetter.setEmail = email.text;
      getterAndSetter.setStudentNumber = stdNo.text;
      if(password.text==confPass.text){
        getterAndSetter.setPass = password.text;
      }else{
        print("Wrong PASSWORD!!!!!!!!!");
      }
    }


    void auth()async{

      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: "${(getterAndSetter.Email).toString()}",
            password: "${(getterAndSetter.Password).toString()}"
        );
        databaseReference.child("Students").set({
          'Student ID':"${(getterAndSetter.studentNo).toString()}"
        });
        print("SUCCESSSSSS...........");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }



    double height = MediaQuery.of(context).size.height;

    void signUp() {
      //insert codes here
      Navigator.pop(context);
    }

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
                    height: height*.15,
                    child: Center(
                      child: Text('Placeholder'),
                    ),
                  ),
                  Container(
                    height: height*.60 < 328.0 ? 328.0 : height*.60,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child:Text(
                            'Sign up',
                            style: TextStyle(fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),),
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
                                decorationColor: Colors.white
                            ),
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
                          onPressed: (){
                            print("Click...............................");
                            _getterAndSetter();
                            auth();

                          },
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

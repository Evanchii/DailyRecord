import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    //for image
                    // child: Image.asset(
                    //
                    // ),
                    padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 11.0),
                    alignment: Alignment.center,
                  ),

                ],
              ),
              new Container(
                child: Text(
                  "Sign Up",
                  style: TextStyle(

                      fontSize: 35.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 50.0),
                alignment: Alignment.center,
              ),
              new Container(
                child: TextField(

                  // controller: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: "Email",
                    
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                alignment: Alignment.center,
              ),
              new Container(
                child: TextField(
                  // controller: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: "Student Number",
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                alignment: Alignment.center,
              ),
              new Container(
                child: TextField(
                  obscureText: true,
                  // controller: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: "Password",

                  ),
                ),
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                alignment: Alignment.center,
              ),
              new Container(
                child: TextField(
                  obscureText: true,
                  // controller: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: "Confirm Password",
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                alignment: Alignment.center,
              ),
              new Container(
                child:TextButton(
                // new RaisedButton(
                //   onPressed: null,
                //   color: const Color(0xFF000000),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.cyan)
                  ))
                ),
                  onPressed: null,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                alignment: Alignment.center,
              ),
              new Container(
                child: Text(
                  "Allready have a Acount",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                alignment: Alignment.center,
              ),
              new Container(
                child: Text(
                  "Login Here",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                alignment: Alignment.center,
              ),
            ],
          )
        ),
      ),
    );
  }
}

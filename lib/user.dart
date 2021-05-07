import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'aboutus.dart';
import 'login.dart';

class UserData extends StatefulWidget {
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> with WidgetsBindingObserver {

  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  String fName, lName, bDay, address;

  TextEditingController currPassword = TextEditingController(),
  newPassword = TextEditingController(),
  confPassword = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    getData();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getData();
    }
  }

  void getData() async {
    var uid = FirebaseAuth.instance.currentUser.uid;
    fName = (await FirebaseDatabase.instance.reference().child("user/"+uid+"/fName").once()).value;
    lName = (await FirebaseDatabase.instance.reference().child("user/"+uid+"/lName").once()).value;
    bDay = (await FirebaseDatabase.instance.reference().child("user/"+uid+"/bDay").once()).value;
    address = (await FirebaseDatabase.instance.reference().child("user/"+uid+"/address").once()).value;
    setState((){
      print('Hello World');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    void logout() {
      FirebaseAuth.instance.signOut();
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login())
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: height * .15,
                child: Center(
                  child: Image(
                    image: AssetImage('assets/banner.png'),
                    height: 50,
                  ),
                ),
              ),
              Container(
                height: height * .60 < 329.0 ? 329.0 : height * .60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Personal Information",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: null,
                          child: Text('Edit'),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Name:",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),
                        ),
                        Text(
                          lName.toString()+", "+fName.toString(),
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Birthday:",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          bDay.toString(),
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Adress:",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          address.toString(),
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 10.0,
                      color: Colors.white,
                      thickness: 2.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Account Information",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () async {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Change Password',
                                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: currPassword,
                                          decoration: InputDecoration(hintText: "Current Password"),
                                          obscureText: true,
                                        ),
                                        TextField(
                                          controller: newPassword,
                                          decoration: InputDecoration(hintText: "New Password"),
                                          obscureText: true,
                                        ),
                                        TextField(
                                          controller: confPassword,
                                          decoration: InputDecoration(hintText: "Confirm Password"),
                                          obscureText: true,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Row(
                                            children: [
                                              TextButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              TextButton(
                                                child: Text('OK'),
                                                onPressed: null,
                                              ),
                                            ],
                                          ),
                                          ),
                                    ],
                                        ),
                                  );
                                });
                          },
                          child: Text(
                            "Change",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.cyan),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: logout,
                      child: Text('Log out'),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).accentColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AboutUs())
                        );
                      },
                      child: Text(
                        "About Us ->",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.cyan),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
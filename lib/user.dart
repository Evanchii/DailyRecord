import 'package:dailyrecord/scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              height: height*.15,
              child: Center(
                child: Text(
                  'Place Holder',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            Container(
              height: height*.60 < 328.0 ? 328.0 : height*.60,
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
                          "%last_name%first_name%middle_name",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
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
                            "Birthday:",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            "MM/DD/YY",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
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
                            "Adress:",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            "%user_adress%",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
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
                           color: Theme.of(context).primaryColor
                         ),
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
                                color: Colors.white
                            ),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Change",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.cyan
                              ),
                            ),
                          ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text('Log out'),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                    ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      "About Us ->",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.cyan
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded),
              label: 'User'
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[400],
        child: Icon(Icons.camera_alt),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Scan(),),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

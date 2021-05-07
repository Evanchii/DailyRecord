import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'apply.dart';
import 'arealist.dart';
import 'history.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with WidgetsBindingObserver {
  DatabaseReference dbRef = FirebaseDatabase().reference();
  String uid = "LOADING", type = "NULL";
  int space = 0;
  bool ins = false, admin = false;

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
    dbRef.child('admin').onChildChanged.forEach((element) {
      setState(() {
        space = int.parse(element.snapshot.value.toString());
        print(element.snapshot.value.toString());
      });
      print('debug[1]: ' + space.toString());
    });
    space = (await FirebaseDatabase.instance
            .reference()
            .child("admin/parkingSpace")
            .once())
        .value;
    print('debug[2]: ' + space.toString());
    type = (await FirebaseDatabase.instance
            .reference()
            .child(
                "users/" + FirebaseAuth.instance.currentUser.uid + "/userType")
            .once())
        .value;
    setState(() {
      uid = FirebaseAuth.instance.currentUser.displayName;
      if (type == "instructor") {
        ins = true;
        admin = false;
      } else if (type == "admin") {
        ins = true;
        admin = true;
      } else {
        ins = false;
        admin = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 100;
    final double itemWidth = MediaQuery.of(context).size.width - 100 / 2;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage('assets/banner.png'),
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                  ),
                  FittedBox(
                    child: Center(
                      child: Container(
                        width: 375.0,
                        height: 140.0,
                        decoration: BoxDecoration(
                          color: Color(0x90404040),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Center(
                            child: Text(
                              "Welcome, " +
                                  uid +
                                  "! \n\nCurrently, there are " +
                                  space.toString() +
                                  " parking\nspaces left in PHINMA UPANG",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(20.0),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                  ),
                  Container(
                    height: 200,
                    child: GridView.count(
                      padding: EdgeInsets.all(20),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: (itemWidth / itemHeight),
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => History(),
                                  settings: RouteSettings(
                                    arguments: "user",
                                  ),
                                ),
                              );
                            },
                            child: Text('History')),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Apply()),
                            );
                          },
                          child: Text(
                            'Apply Parking\nSpace',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Visibility(
                          visible: ins,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AreaList(),
                                    settings: RouteSettings(
                                      arguments: "2",
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Room\nHistory',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Visibility(
                          visible: admin,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AreaList(),
                                    settings: RouteSettings(
                                      arguments: "1",
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Capacity\nLimit',
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
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

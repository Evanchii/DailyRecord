import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {

  void b1() {
  }

  void b2() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                          'DailyRecord',
                          style: TextStyle(fontSize: 25),
                      ),
                    ),

                    new Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                    ),

                    new FittedBox(
                      child: Center(
                        child: Container(
                          width: 375.0,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: Color(0xffF7971D),
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Center(
                            child: Text(
                                "Welcome, %USER%! \n\nCurrently, there are %amount% parking\nspaces left in PHINMA UPANG",
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

                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // ignore: deprecated_member_use
                          new RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 45),
                            onPressed: (){
                              b1();
                              print("Testing Button 1");
                            },
                            color: Color(0xffffd84d),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Text(
                              "Button 1",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),

                          new Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                          ),

                          // ignore: deprecated_member_use
                          new RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 45),
                            onPressed: (){
                              b1();
                              print("Testing Button 2");
                            },
                            color: Color(0xffffd84d),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Text(
                              "Button 2",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ]
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

import 'package:flutter/material.dart';

import 'apply.dart';
import 'arealist.dart';
import 'history.dart';

class Dashboard extends StatelessWidget {
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
                  Center(
                    child: Text(
                      'DailyRecord',
                      style: TextStyle(fontSize: 25),
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
                                    arguments: "UserHis",
                                  ),
                                ),
                              );
                            },
                            child: Text('History')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Apply()
                                ),
                              );
                            },
                            child: Text('Apply Parking\nSpace')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AreaList(),
                                  settings: RouteSettings(
                                    arguments: "AdminHis",
                                  ),
                                ),
                              );
                            },
                            child: Text('Admin\nHistory')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AreaList(),
                                  settings: RouteSettings(
                                    arguments: "CapCtrl",
                                  ),
                                ),
                              );
                            },
                            child: Text('Capacity\nLimit')),
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

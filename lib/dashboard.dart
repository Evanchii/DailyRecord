import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
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
                      child: Text('Dashboard Screen'),
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

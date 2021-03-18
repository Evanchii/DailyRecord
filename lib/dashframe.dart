import 'package:dailyrecord/dashboard.dart';
import 'package:dailyrecord/scan.dart';
import 'package:dailyrecord/user.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class DashFrame extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State {
  int currentIndex = 0;
  final List<Widget> page = [
    Dashboard(),
    User(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
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
        onPressed: () async {
          var status = await Permission.camera.status;
          if(status.isGranted || status.isLimited)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Scan(),),
            );
          else
            Permission.camera.request();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

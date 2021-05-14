import 'package:dailyrecord/confirmdata.dart';
import 'package:dailyrecord/dashboard.dart';
import 'package:dailyrecord/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DashFrame extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<DashFrame> {
  int currentIndex = 0;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  var notifData;
  final List<Widget> page = [
    Dashboard(),
    UserData(),
  ];

  @override
  void initState() {
    initNotification();
    super.initState();
  }

  void initNotification() async {
    await dbRef.child("notification").onValue.forEach((element) {
      if (element.snapshot.value.toString().contains("room")) getNotifData();
    });
  }

  void getNotifData() async {
    notifData = (await dbRef.child("notification").once()).value;

    //Notification
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        new FlutterLocalNotificationsPlugin();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project

    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');

    InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
    });

    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      'Hello <i>${FirebaseAuth.instance.currentUser.displayName}</i>, We have detected that you may have came in contact with a suspected case! We advise you to contact 1555 or 02-894-26843. Get <b>Tested</b> and <b>Isolate!</b><br/><br/>Issuing date: ${notifData["issuingDate"]}',
      htmlFormatBigText: true,
      contentTitle: 'Suspected Case|DailyRecord',
      htmlFormatContentTitle: true,
      htmlFormatSummaryText: true,
    );

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('0', 'COVID 19 Alert',
            'A notification channel for COVID 19 Alerts inside the campus.',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            styleInformation: bigTextStyleInformation);

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    dbRef
        .child("roomHistory/${notifData['room']}")
        .once()
        .then((DataSnapshot data) {
      data.value.forEach((key, value) {
        if (value['uid'] == FirebaseAuth.instance.currentUser.uid) {
          double toDouble(TimeOfDay myTime) =>
              myTime.hour + myTime.minute / 60.0;
          TimeOfDay time = TimeOfDay(
                  hour: int.parse(value['time'].toString().split(':')[0]),
                  minute: int.parse(value['time'].toString().split(':')[1])),
              minTime = TimeOfDay(
                  hour:
                      int.parse(notifData['minTime'].toString().split(':')[0]),
                  minute:
                      int.parse(notifData['minTime'].toString().split(':')[1])),
              maxTime = TimeOfDay(
                  hour:
                      int.parse(notifData['maxTime'].toString().split(':')[0]),
                  minute:
                      int.parse(notifData['maxTime'].toString().split(':')[1]));
          if (toDouble(time) >= toDouble(minTime) &&
              toDouble(time) <= toDouble(maxTime)) {
            DateTime issuingDate = DateTime(
                    int.parse(
                        notifData['issuingDate'].toString().split('-')[0]),
                    int.parse(
                        notifData['issuingDate'].toString().split('-')[1]),
                    int.parse(
                        notifData['issuingDate'].toString().split('-')[2]))
                .add(Duration(days: 14));
            if (issuingDate.isAfter(DateTime.now()) ||
                issuingDate.isAtSameMomentAs(DateTime.now())) {
              flutterLocalNotificationsPlugin.show(
                  1,
                  "Suspected Case|DailyRecord",
                  "We have detected that there is a suspected case! We advise you to contact 1555 or 02-894-26843.",
                  platformChannelSpecifics);
            }
          }
        }
      });
    });
  }

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
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded), label: 'User'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[400],
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          var status = await Permission.camera.status;
          if (status.isGranted || status.isLimited)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmData(),
              ),
            );
          else
            Permission.camera.request();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

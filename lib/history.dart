import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var uid = FirebaseAuth.instance.currentUser.uid;
  var history, visible = false, data = "0", room;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    history = (await dbRef.child("users/$uid/history").once()).value;
    data = ModalRoute.of(context).settings.arguments;
    if(data != "user") {
      visible = true;
      history = (await dbRef.child("roomHistory/$data").once()).value;
    }
    setState((){
      print('uwu hello sir ^.^');
    });
  }

  Widget createTable() {
    if (history != null) {
      List<TableRow> rows = [];
      rows.add(
        TableRow(children: [
          Text(
            'Date',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Details',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      );
      if(data == "user") {
        history.forEach((key, value) {
          rows.add(TableRow(children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "${value['date']}\n${value['time']}",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "${value['room']}",
                textAlign: TextAlign.center,
              ),
            ),
          ]));
        });
      }
      else {
        history.forEach((key, value) {
          rows.add(TableRow(children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "${value['date']}\n${value['time']}",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "${value['stdNo']}",
                textAlign: TextAlign.center,
              ),
            ),
          ]));
        });
      }
      return Table(
        children: rows,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Image(
            image: AssetImage('assets/banner.png'),
            height: 50,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'History',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: createTable(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: visible,
        child: FloatingActionButton(
          child: Icon(Icons.notifications),
          onPressed: null,
        ),
      ),
    );
  }
}

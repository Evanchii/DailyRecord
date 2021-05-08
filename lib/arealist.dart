import 'package:dailyrecord/history.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AreaList extends StatefulWidget {
  @override
  _AreaListState createState() => _AreaListState();
}

class _AreaListState extends State<AreaList> {
  TextEditingController changeCapacity = new TextEditingController();
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  var rooms, lvl = "0", type = "user", title = "";

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    type = (await dbRef
            .child("users/${FirebaseAuth.instance.currentUser.uid}/userType")
            .once())
        .value;
    rooms = (await dbRef.child("room").once()).value;
    if (type == "instructor")
      rooms = (await dbRef
              .child("users/${FirebaseAuth.instance.currentUser.uid}/rooms/")
              .once())
          .value;
    setState(() {
      lvl = ModalRoute.of(context).settings.arguments;
      if (lvl == "1") {
        title = "Capacity Counter";
      } else {
        title = "Rooms";
      }
    });
  }

  Future<void> dialogCapacity(BuildContext context, String key) async {
    changeCapacity.text =
        (await dbRef.child('room/${key}').once()).value.toString();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Change Capacity',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: changeCapacity,
                  decoration: InputDecoration(
                    hintText: 'Capacity',
                    fillColor: Color(0x66B6B6B6),
                    filled: true,
                    hintStyle: TextStyle(
                        color: Colors.grey, decorationColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),
                    ElevatedButton(
                        onPressed: () async {
                          await dbRef
                              .child('room')
                              .update({key: int.parse(changeCapacity.text)});
                          Navigator.pop(context);
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Updated!")));
                            getData();
                          });
                        },
                        child: Text("Confirm")),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget createTable() {
    List<TableRow> rows = [];
    if (rooms != null && lvl == "1") {
      rows.add(
        TableRow(children: [
          Text(
            'Room',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Capacity',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      );
      rooms.forEach((key, value) {
        rows.add(TableRow(children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              key,
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
              onPressed: () {
                dialogCapacity(context, key.toString());
              },
              child: Text(value.toString())),
        ]));
      });
      return Table(
        children: rows,
      );
    } else if (lvl == "2") {
      rows.add(
        TableRow(children: [
          Text(
            'Room',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      );
      rooms.forEach((key, value) {
        rows.add(TableRow(children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => History(),
                        settings: RouteSettings(arguments: key.toString())));
              },
              child: Text(key.toString())),
        ]));
      });
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
                        title,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(rooms.toString());
          print(lvl);
        },
      ),
    );
  }
}

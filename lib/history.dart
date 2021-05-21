import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var uid = FirebaseAuth.instance.currentUser.uid;
  var history, visible = false, data = "0", room;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedMinTime = TimeOfDay.now(),
      selectedMaxTime = TimeOfDay.now();
  TextEditingController date = TextEditingController(),
      minTime = TextEditingController(),
      maxTime = TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    history = (await dbRef.child("users/$uid/history").once()).value;
    data = ModalRoute.of(context).settings.arguments;
    print(data.toString());
    if (data != "user") {
      visible = true;
      history = (await dbRef.child("roomHistory/$data").once()).value;
    }
    setState(() {
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
      if (data == "user") {
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
      } else {
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
    } else {
      List<TableRow> rows = [];
      rows.add(
        TableRow(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'No Data Found',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ]),
      );
      return Table(
        children: rows,
      );
    }
  }

  Future<void> sendAlert(BuildContext context) {
    date.text = DateFormat('MM/dd/yyyy').format(selectedDate);
    // minTime.text = selectedMinTime.format(context);
    // maxTime.text = selectedMaxTime.format(context);
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
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: date,
                        decoration: InputDecoration(hintText: "MM/DD/YYYY"),
                      ),
                    ),
                    TextButton(
                      child: Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: minTime,
                        decoration: InputDecoration(hintText: "Min Time"),
                      ),
                    ),
                    TextButton(
                      child: Icon(Icons.access_time),
                      onPressed: () {
                        _selectTime(context, "min");
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: maxTime,
                        decoration: InputDecoration(hintText: "Max Time"),
                      ),
                    ),
                    TextButton(
                      child: Icon(Icons.access_time),
                      onPressed: () {
                        _selectTime(context, "max");
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text("Send Alert"),
                        onPressed: () {
                          if (date.text.isNotEmpty &&
                              minTime.text.isNotEmpty &&
                              maxTime.text.isNotEmpty) {
                            dbRef.child('notification').remove();
                            dbRef.child('notification').set({
                              'date': date.text,
                              'issuingDate': DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()),
                              'maxTime': maxTime.text,
                              'minTime': minTime.text,
                              'room': data
                            });
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Alert sent!')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                Text('Please enter all required data!')));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date.text = DateFormat('MM/dd/yyyy').format(selectedDate);
      });
  }

  Future<void> _selectTime(BuildContext context, String mode) async {
    TimeOfDay picked;
    if (mode == "min") {
      picked =
      await showTimePicker(context: context, initialTime: selectedMinTime);
    } else {
      picked =
      await showTimePicker(context: context, initialTime: selectedMaxTime);
    }
    if (picked != null)
      setState(() {
        if (mode == "min") {
          selectedMinTime = picked;
          minTime.text = selectedMinTime.format(context);
        } else {
          selectedMaxTime = picked;
          maxTime.text = selectedMaxTime.format(context);
        }
      });
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
                        width: 1,
                      ),),
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
          onPressed: () {
            sendAlert(context);
          },
        ),
      ),
    );
  }
}
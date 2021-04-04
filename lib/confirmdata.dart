import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ConfirmData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    TextEditingController code = new TextEditingController();
    double width = MediaQuery.of(context).size.width;

    void scan() async {
      await Permission.camera.request();
      String barcode = await scanner.scan();
      if (barcode == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid QR Code!")));
      } else {
          code.text = barcode;
      }
    }

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
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 100,
                              height: 140,
                              child: InkWell(
                                onTap: scan,
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
                                      Divider(height: 20),
                                      Expanded(flex: 1, child: Text("Scan")),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: 10.0,
                              color: Colors.white,
                              thickness: 1.0,
                            ),
                            SizedBox(
                              width: width - 140,
                              height: 140,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Text('Enter Room Code:'),
                                      TextField(
                                        decoration:
                                            InputDecoration(hintText: 'ABC123'),
                                        controller: code,
                                      ),
                                      ElevatedButton(onPressed: null, child: Text('Submit')),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.white,
                    thickness: 1.0,
                  ),
                  Container(
                    //ConfirmData
                    height: height * .60 < 329.0 ? 329.0 : height * .60,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Confirm Data",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Area:",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              "%RM%/AREA%",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
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
                              "Time:",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              "%time%",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
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
                              "Date:",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              "%date%",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 250,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: null,
                                child: Text('Decline'),
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: null,
                                child: Text('Confirm'),
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                ),
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
          ],
        ),
      ),
    );
  }
}

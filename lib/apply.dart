import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

// class Apply extends StatelessWidget {
class Apply extends StatefulWidget {
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  File _imageFileDL;
  File _imageFileORCR;
  File _imageFileSchoolID;

  FirebaseStorage storage = FirebaseStorage.instance;
  DatabaseReference dbRef = FirebaseDatabase().reference();

  TextEditingController fName = TextEditingController(),
  lName = TextEditingController(),
  plateNumber = TextEditingController();

  final picker = ImagePicker();

  void _openGallerySchoolID(BuildContext context) async {
    var _pictureSchoolID = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      if (_pictureSchoolID != null) {
        _imageFileSchoolID = File(_pictureSchoolID.path);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No Image Selected')));
      }
    });
    Navigator.of(context).pop();
  }

  void _openCameraSchoolID(BuildContext context) async {
    var _pictureSchoolID = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if (_pictureSchoolID != null) {
        _imageFileSchoolID = File(_pictureSchoolID.path);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No Image Selected')));
      }
    });
    Navigator.of(context).pop();
  }

  Future<void> _showDialogSchoolID(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Make a Choice",
              style: TextStyle(
                  fontSize: 20.5,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      _openGallerySchoolID(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text(
                      "Camera",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      _openCameraSchoolID(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openGalleryDL(BuildContext context) async {
    var _pictureDL = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      if (_pictureDL != null) {
        _imageFileDL = File(_pictureDL.path);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No Image Selected')));
      }
    });
    Navigator.of(context).pop();
  }

  void _openCameraDL(BuildContext context) async {
    var _pictureDL = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if (_pictureDL != null) {
        _imageFileDL = File(_pictureDL.path);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No Image Selected')));
      }
    });
    Navigator.of(context).pop();
  }

  Future<void> _showDialogDL(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Make a Choice",
              style: TextStyle(
                  fontSize: 20.5,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      _openGalleryDL(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text(
                      "Camera",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      _openCameraDL(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openGalleryORCR(BuildContext context) async {
    var _pictureORCR = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      if (_pictureORCR != null) {
        _imageFileORCR = File(_pictureORCR.path);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No Image Selected')));
      }
    });
    Navigator.of(context).pop();
  }

  void _openCameraORCR(BuildContext context) async {
    var _pictureORCR = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if (_pictureORCR != null) {
        _imageFileORCR = File(_pictureORCR.path);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('No Image Selected')));
      }
    });
    Navigator.of(context).pop();
  }

  Future<void> _showDialogORCR(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Make a Choice",
              style: TextStyle(
                  fontSize: 20.5,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      _openGalleryORCR(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text(
                      "Camera",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      _openCameraORCR(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void upload() async {
    var extDL = _imageFileDL.path.toString().split('.');
    var extORCR = _imageFileORCR.path.toString().split('.');
    var extSchoolID = _imageFileSchoolID.path.toString().split('.');

    await storage
        .ref()
        .child(
            "Driver License/${FirebaseAuth.instance.currentUser.uid}.${extDL[extDL.length - 1]}")
        .putFile(_imageFileDL);
    await storage
        .ref()
        .child(
            "ORCR/${FirebaseAuth.instance.currentUser.uid}.${extDL[extORCR.length - 1]}")
        .putFile(_imageFileORCR);
    await storage
        .ref()
        .child(
            "SchoolID/${FirebaseAuth.instance.currentUser.uid}.${extDL[extSchoolID.length - 1]}}")
        .putFile(_imageFileSchoolID);
    dbRef
        .child('users/${FirebaseAuth.instance.currentUser.uid}/parking')
        .update({
      'firstName': fName.text,
      'lastName': lName.text,
      'plateNumber': plateNumber.text,
      'status': 'On-going',
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
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Apply Parking Space",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                            Text(
                              "First Name: ",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white),
                            ),
                             TextField(
                                controller: fName,
                                decoration: InputDecoration(
                                  hintText: 'Juan',
                                  fillColor: Color(0x66B6B6B6),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      decorationColor: Colors.white),
                                ),
                                cursorColor: Theme.of(context).accentColor,
                              ),
                        SizedBox(
                          height: 10.0,
                        ),
                            Text(
                              "Last Name: ",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white),
                            ),
                            TextField(
                              controller: lName,
                              decoration: InputDecoration(
                                hintText: 'Dela Cruz',
                                fillColor: Color(0x66B6B6B6),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    decorationColor: Colors.white),
                              ),
                              cursorColor: Theme.of(context).accentColor,
                            ),
                        SizedBox(
                          height: 10.0,
                        ),
                            Text(
                              "Plate Number: ",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.white),
                            ),
                            TextField(
                              controller: plateNumber,
                              decoration: InputDecoration(
                                hintText: 'ABC 1234',
                                fillColor: Color(0x66B6B6B6),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    decorationColor: Colors.white),
                              ),
                              cursorColor: Theme.of(context).accentColor,
                            ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "School ID",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _showDialogSchoolID(context);
                              },
                              child: Text('Select'),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            child: _imageFileSchoolID == null
                                ? Text('')
                                : Image.file(
                                    _imageFileSchoolID,
                                    width: 300.0,
                                    height: 300.0,
                                  )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Photo of Drivers License",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _showDialogDL(context);
                              },
                              child: Text('Select'),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            child: _imageFileDL == null
                                ? Text('')
                                : Image.file(
                                    _imageFileDL,
                                    width: 300.0,
                                    height: 300.0,
                                  )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Photo of ORCR",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _showDialogORCR(context);
                              },
                              child: Text('Select'),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            child: _imageFileORCR == null
                                ? Text('')
                                : Image.file(
                                    _imageFileORCR,
                                    width: 300.0,
                                    height: 300.0,
                                  )),
                        SizedBox(
                          height: 50.0,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              upload();
                            },
                            child: Text('Submit'),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

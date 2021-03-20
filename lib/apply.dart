import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// class Apply extends StatelessWidget {
class Apply extends StatefulWidget {
  _apply createState()=>_apply();
}

class _apply extends State<Apply>{

  File _imageFileDL;
  File _imageFileORCR;

  final picker = ImagePicker();

  void _openGalleryDL(BuildContext context) async {
    var _pictureDL = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      if(_pictureDL!=null){
        _imageFileDL = File(_pictureDL.path);
      }else{
        print("No Image Selected");
      }
    });
    Navigator.of(context).pop();
  }

  void _openCameraDL(BuildContext context)async{
   var _pictureDL = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if(_pictureDL!=null){
        _imageFileDL = File(_pictureDL.path);
      }else{
        print("No Image Selected");
      }
    });
    Navigator.of(context).pop();
  }



  Future<void> _showDialogDL(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Make a Choice",style: TextStyle(fontSize: 20.5,color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),),
                onTap: (){
                  _openGalleryDL(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Camera",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),),
                onTap: (){
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
    var _pictureORCR= await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      if(_pictureORCR!=null){
        _imageFileORCR = File(_pictureORCR.path);
      }else{
        print("No Image Selected");
      }
    });
    Navigator.of(context).pop();
  }

  void _openCameraORCR(BuildContext context)async{
    var _pictureORCR = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if(_pictureORCR!=null){
        _imageFileORCR = File(_pictureORCR.path);
      }else{
        print("No Image Selected");
      }
    });
    Navigator.of(context).pop();
  }

  Future<void> _showDialogORCR(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Make a Choice",style: TextStyle(fontSize: 20.5,color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
        content: SingleChildScrollView(
            child:
              ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),),
                    onTap: (){
                      _openGalleryORCR(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),),
                    onTap: (){
                      _openCameraORCR(context);
                    },
                  ),
                ],
              ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder'),
      ),
      body: ListView(
          children:<Widget>[
        SafeArea(
          child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  // Container(
                  //   height: height*.15,
                  //   child: Text(
                  //     "Log in",
                  //     style: TextStyle(fontSize: 24.0),
                  //   ),
                  //   alignment: Alignment.center,
                  // ),
                // SingleChildScrollView(
                //   child:
                  Container(
                        // height: height * .60 < 329.0 ? 329.0 : height * .60,
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
                            Row(
                              children: <Widget>[
                                Text(
                                  "First Name: ",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white
                                  ),
                                ),
                                Text(
                                  "PlaceHolder",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Last Name: ",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  "PlaceHolder",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Plate Number: ",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  "PlaceHolder",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
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
                                  onPressed: (){
                                    _showDialogDL(context);
                                  },
                                  child: Text('Select'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: 10.0,
                            // ),
                            Container(
                              child: _imageFileDL ==null? Text("Image Here"):Image.file(_imageFileDL,width: 300.0,height: 300.0,)),
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
                                  onPressed: (){
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
                                child: _imageFileORCR ==null? Text("Image Here"):Image.file(_imageFileORCR,width: 300.0,height: 300.0,)),
                            SizedBox(
                              height: 50.0,
                            ),


                        Center(

                            child:ElevatedButton(
                              onPressed: null,
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

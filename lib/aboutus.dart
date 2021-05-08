import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/pablo_test.jpg'),
                  height: 110,
                  width: 110,
                ),

                Center(child:Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
                    child: Text('CASTILLO, Al Evan C. \nDeveloper',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20)
                    )
                )
                ),
              ],
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),

            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/pablo_test.jpg'),
                  height: 110,
                  width: 110,
                ),

                Center(child:Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
                    child: Text('VILLANUEVA, Ryan L. \nDeveloper',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20)
                    )
                )
                ),
              ],
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),

            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/pablo_test.jpg'),
                  height: 110,
                  width: 110,
                ),

                Center(child:Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
                    child: Text('TEJANO, Shawn Josh S. \nDeveloper',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20)
                    )
                )
                ),
              ],
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),

            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/pablo_test.jpg'),
                  height: 110,
                  width: 110,
                ),

                Center(child:Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
                    child: Text('PABLO, Rioweign Kedriech D. \nDeveloper',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17)
                    )
                )
                ),
              ],
            ),

            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),

            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/pablo_test.jpg'),
                  height: 110,
                  width: 110,
                ),

                Center(child:Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
                    child: Text('FERNANDEZ, Arniel C. \nDeveloper',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20)
                    )
                )
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipOval(
                  child: Image(
                    image: AssetImage('assets/team/CASTILLO.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
                Expanded(
                  child: Text('CASTILLO, Al Evan C.\nDeveloper',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),
            Row(
              children: <Widget>[
                ClipOval(
                  child: Image(
                    image: AssetImage('assets/team/FERNANDEZ.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
                Expanded(
                  child: Text('FERNANDEZ, Arniel C.\nDeveloper',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),
            Row(
              children: <Widget>[
                ClipOval(
                  child: Image(
                    image: AssetImage('assets/team/PABLO.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
                Expanded(
                  child: Text('PABLO, Roweign Kedriech D.\nProject Manager',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),
            Row(
              children: <Widget>[
                ClipOval(
                  child: Image(
                    image: AssetImage('assets/team/TEJANO.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
                Expanded(
                  child: Text('TEJANO, Shawn Josh S.\nDeveloper',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),
            Row(
              children: <Widget>[
                ClipOval(
                  child: Image(
                    image: AssetImage('assets/team/VILLANUEVA.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
                Expanded(
                  child: Text('VILLANUEVA, Ryan L.\nDeveloper',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

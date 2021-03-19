import 'package:flutter/material.dart';

class ConfirmData extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
                height: height*.15,
                child: Text(
                  'Login Screen',
                  style: TextStyle(fontSize: 24.0),
                ),
                alignment: Alignment.center,
              ),
              Container(
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
                            color: Colors.white
                        ),
                        ),
                        Text(
                          "%RM%/AREA%",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),
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
                              color: Colors.white
                          ),
                        ),
                        Text(
                          "%time%",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),
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
                              color: Colors.white
                          ),
                        ),
                        Text(
                          "%date%",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 250,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25.0,right: 25.0),
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
      ),
    );
  }
}

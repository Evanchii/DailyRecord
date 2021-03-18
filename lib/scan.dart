import 'package:flutter/material.dart';
import 'package:qr/qr.dart';

class Scan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder'),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Login Screen',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}

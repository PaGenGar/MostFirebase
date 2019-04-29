import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showAppName() {
    return Text('Most Flutter',
        style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
            fontFamily: 'IndieFlower'));
  }

  Widget showLogo() {
    return Image.asset('images/logo001.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.white],
                begin: Alignment(0, -1))),
        padding: EdgeInsets.only(top: 100.0),
        alignment: Alignment(0, -1),
        child: Column(
          children: <Widget>[
            Container(
              width: 100.00,
              height: 100.0,
              child: showLogo(),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: showAppName(),
            ),
          ],
        ),
      ),
    );
  }
}

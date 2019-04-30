import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

Widget passTeatFormField() {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)),
        labelText: 'Password',
        hintText: 'You Password',
        icon: Icon(
          Icons.lock,
          color: Colors.orange,
        )),
  );
}

Widget nameTextFormField() {
  return TextFormField(
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 1.0, color: Colors.grey)),
        labelText: 'Name',
        hintText: 'Type Your Name',
        icon: Icon(
          Icons.face,
          color: Colors.red,
        )),
  );
}

Widget emailTextFormField() {
  return TextFormField(
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)),
        labelText: 'Email',
        hintText: 'you@email.com',
        icon: Icon(
          Icons.email,
          color: Colors.blue,
        )),
  );
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            nameTextFormField(),
            Container(
              margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: emailTextFormField(),
            ),
            passTeatFormField()
          ],
        ),
      ),
    );
  }
}

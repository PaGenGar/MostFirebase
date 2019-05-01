import 'package:flutter/material.dart';
import '../screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //For Form
  final formKey = GlobalKey<FormState>();

  ///Constant
  String titleHavespace = 'กรุณากรอกข้อมูลให้ครบ';
  String titleEmailFail = 'กรุณากรอกรูปแบบ Email ให้ถูกต้อง';
  String titlePasswordFail = 'Password ต้องมีมากกว่า 6 ตัวอักษร';

  Widget showAppName() {
    return Text('Most Flutter',
        style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[600],
            fontFamily: 'IndieFlower'));
  }

  Widget signupButton(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(Icons.system_update_alt),
      label: Text('Sing UP'),
      color: Colors.greenAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: () {
        print('on click sign up');
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget signButton() {
    return RaisedButton.icon(
      icon: Icon(
        Icons.account_box,
      ),
      label: Text('Sign In'),
      color: Colors.yellowAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: () {
        print('You click Sign In');
        if (formKey.currentState.validate()) {}
      },
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email :', hintText: 'you@email.com'),
      validator: (String value) {
        if (value.length == 0) {
          return titleHavespace;
        } else if (!((value.contains('@')) && (value.contains('.')))) {
          return titleEmailFail;
        }
      },
    );
  }

  Widget passWordTextFormField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password :', hintText: 'your Password'),
      validator: (String value) {
        if (value.length<=5) {
          return titlePasswordFail;
        }
      },
    );
  }

  Widget showLogo() {
    return Image.asset('images/logo001.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.greenAccent, Colors.white],
                    begin: Alignment(-1, -1))),
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
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: emailTextFormField(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: passWordTextFormField(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 4.0, right: 4.0),
                          child: signButton(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 4.0, right: 4.0),
                          child: signupButton(context),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

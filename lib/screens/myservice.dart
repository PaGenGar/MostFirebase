import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}
class _MyServiceState extends State<MyService> {
  
  //For firebase
  FirebaseAuth firebaseAuth =FirebaseAuth.instance;
  
  FirebaseDatabase firebaseDatabase =FirebaseDatabase.instance;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('InitState Work');

    readData();
  }

  void readData() async{

    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String currentUid = firebaseUser.uid.toString();

    var objdata =firebaseDatabase.reference().child(currentUid
    );
    // print('object ======> $objdata');
  }

  Widget signOutButton() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        print('You click signout');
        signoutprocess();
      },
    );
  }

  void signoutprocess() async{
    // Signout firebase
    print(firebaseAuth.currentUser().toString());
    await firebaseAuth.signOut();
    // Exit App
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyService'),
        actions: <Widget>[signOutButton()],
      ),
      body: Text('This is Body'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Explicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passWordString;

  //For Firebase
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //For Snackbar
  final snackBarKey = GlobalKey<ScaffoldState>();

  FirebaseDatabase firebaseDatabase =FirebaseDatabase.instance;

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
      validator: (String value) {
        if (value.length <= 5) {
          return 'Please Type Password more Charactor';
        }
      },
      onSaved: (String value) {
        passWordString = value;
      },
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
      validator: (String value) {
        if (value.length == 0) {
          return 'Plase Full Name in the blank';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
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
      validator: (String value) {
        if (value.length == 0) {
          return 'กรุณากรอก email';
        } else if (!((value.contains('@')) && (value.contains('.')))) {
          return 'กรุณากรอก Email ให้ตรง Format';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget uploadButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      tooltip: 'Upload To Firebase',
      onPressed: () {
        print('you click upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'name = $nameString,email = $emailString,password = $passWordString');
          uploadValueToFirebase(context);
        }
      },
    );
  }

  void uploadValueToFirebase(BuildContext context) async {
    FirebaseUser firebaseUser = await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passWordString)
        .then((user) {
      print('Register Success With ===>> $user');

      addValueTofirebaseDatabase(context);
    
      // Navigator.pop(context);
    }).catchError((error) {
      String errorString = error.message;
      print('ERROR ============================>>>>>>>>>>>>>>>>> $errorString');
      showSnackBar(errorString);
    });
  }

  void addValueTofirebaseDatabase(BuildContext context) async{

    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String uidString =firebaseUser.uid.toString();
    print('uidString =====> $uidString');

    // Create Map type
    Map<String,String> map = Map();
    map['name'] = nameString;

    // Update to firebase 
    await firebaseDatabase.reference().child(uidString).set(map);
    Navigator.pop(context);

  }

  void showSnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 7),
      backgroundColor: Colors.redAccent,
      content: Text(messageString),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    snackBarKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: snackBarKey,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Register'),
          actions: <Widget>[uploadButton(context)],
        ),
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.white, Colors.blue],
                    radius: 2.5,
                    center: Alignment(-1, -1))),
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
        ));
  }
}

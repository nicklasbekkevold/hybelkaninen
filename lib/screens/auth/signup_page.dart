import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user.dart';

class SignUpPage extends StatefulWidget {

  @override
  _SignUpPageState createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Enter name';
                  } else if (input.length < 3) {
                    return 'Name must be more than 2 charater';
                  }
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Name'
                ),
                onSaved: (input) => _name = input,
              ),
              TextFormField(
                validator: (input) {
                  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'; // Assume this is right 
                  RegExp regex = RegExp(pattern);
                  if (input.isEmpty){
                    return 'Enter email address';
                  } else if (!regex.hasMatch(input)) {
                    return 'Enter valid email address';
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 8) {
                    return 'Use 8 characters or more for your password';
                  }
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
                onSaved: (input) => _password = input,
                obscureText: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: signUp,
                  child: Text('Sign Up'),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        addUser(User(userID: user.uid, name: _name, email: _email));
        user.sendEmailVerification();
        // Display for user that we sent an email.
        Navigator.of(context).pop();
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage(), fullscreenDialog: true));
      } catch(e) {
        print(e.message);
      }
    }
  }

  static void addUser(User user) async {
    checkUserExist(user.userID).then((value) {
      if (!value) {
        print("user ${user.name} ${user.email} added");
        Firestore.instance
            .document("users/${user.userID}")
            .setData(user.toJson());
      } else {
        print("user ${user.name} ${user.email} exists");
      }
    });
  }

  static Future<bool> checkUserExist(String userID) async {
    bool exists = false;
    try {
      await Firestore.instance.document("users/$userID").get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

}
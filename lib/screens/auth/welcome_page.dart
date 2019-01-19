import 'package:flutter/material.dart';
import 'signin_page.dart';
import 'signup_page.dart';

class WelcomPage extends StatefulWidget {
  @override
  _WelcomPageState createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: NavigareToSignIn,
            child: Text('Sign in'),
          ), 
          RaisedButton(
            onPressed: NavigareToSignUp,
            child: Text('Sign up'),
          ),
        ],
      ),
    );
  }

  void NavigareToSignIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(), fullscreenDialog: true));
  }
  void NavigareToSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}
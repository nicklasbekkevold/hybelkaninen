import 'package:flutter/material.dart';
import 'signin_page.dart';
import 'signup_page.dart';

class WelcomePage extends StatefulWidget {
    
  WelcomePage({
    Key key, 
  }) : super(key: key);
  
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hybelkaninen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: navigareToSignIn,
                child: Text('Sign in'),
              ),
            ),
          ), 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: navigareToSignUp,
                child: Text('Sign up'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigareToSignIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(), fullscreenDialog: true));
  }
  void navigareToSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}
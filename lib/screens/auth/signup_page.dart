import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signin_page.dart';



class SignUpPage extends StatefulWidget {

  @override
  _SignUpPageState createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Provide an email';
                }
              },
              decoration: InputDecoration(
                labelText: 'Email'
              ),
              onSaved: (input) => _email = input,
            ),
            TextFormField(
              validator: (input) {
                if(input.length < 6){
                  return 'Longer password please';
                }
              },
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              onSaved: (input) => _password = input,
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signUp,
              child: Text('Sign Up'),
            ),
          ],
        )
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user.sendEmailVerification();
        // Display for user that we sent an email.
        Navigator.of(context).pop();
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage(), fullscreenDialog: true));
      } catch(e) {
        print(e.message);
      }
    }
  }

}
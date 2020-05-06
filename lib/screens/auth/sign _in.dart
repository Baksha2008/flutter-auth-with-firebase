import 'package:auth_flutter/services/auth.service.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  // create user obj based on FirebaseUser



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('Sign in to app'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child:
              RaisedButton(child: Text('Sign in anon'), onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if(result == null){
                  print('error');
                }
                print(result.uid);
              })),
    );
  }
}

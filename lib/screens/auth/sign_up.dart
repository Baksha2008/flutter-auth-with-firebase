import 'package:auth_flutter/shared/constatns.dart';
import 'package:flutter/material.dart';
import 'package:auth_flutter/services/auth.service.dart';

class SignUp extends StatefulWidget {
  final Function onAuthToggle;
  SignUp({this.onAuthToggle});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: Text('Sign up to app'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.onAuthToggle();
                },
                icon: Icon(Icons.person),
                label: Text('Sign in'))
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (value) =>
                          value.isEmpty ? 'Enter an email' : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      }),
                  SizedBox(height: 20),
                  TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (value) => value.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      }),
                  SizedBox(height: 20),
                  RaisedButton(
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return null;
                        }
                        ;
                        dynamic result = await _auth.onSignUp(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Please apply a vallid email';
                          });
                        }
                      },
                      color: Colors.pink[100],
                      child: Text('Sign up',
                          style: TextStyle(color: Colors.white))),
                  SizedBox(height: 20),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  )
                ]))));
  }
}

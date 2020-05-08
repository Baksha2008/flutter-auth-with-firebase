import 'package:auth_flutter/services/auth.service.dart';
import 'package:auth_flutter/shared/constatns.dart';
import 'package:auth_flutter/shared/loader.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function onAuthToggle;
  SignIn({this.onAuthToggle});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: Text('Sign in to app'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.onAuthToggle();
                },
                icon: Icon(Icons.person),
                label: Text('Sign up'))
          ],
        ),
        body: isLoading
            ? Loader()
            : Container(
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
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
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
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              dynamic result =
                                  await _auth.onSignIn(email, password);
                              print(result);
                              if (result == null) {
                                setState(() {
                                  error =
                                      "Could't sing in with this credantials";
                                  isLoading = false;
                                });
                              }
                            }
                            ;
                          },
                          color: Colors.pink[100],
                          child: Text('Sign in',
                              style: TextStyle(color: Colors.white))),
                      SizedBox(height: 20),
                      RaisedButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await _auth.signInAnon();
                          },
                          color: Colors.pink[100],
                          child: Text('Sign in anon',
                              style: TextStyle(color: Colors.white))),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      )
                    ]))));
  }
}

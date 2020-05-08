import 'package:auth_flutter/screens/auth/sign%20_in.dart';
import 'package:auth_flutter/screens/auth/sign_up.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isLogin = true;
  void onAuthToggle() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? SignIn(onAuthToggle: onAuthToggle)
        : SignUp(onAuthToggle: onAuthToggle);
  }
}

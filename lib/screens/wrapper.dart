import 'package:auth_flutter/models/user.dart';
import 'package:auth_flutter/screens/auth/auth.dart';
import 'package:auth_flutter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Auth();
    }
    return Home();
  }
}

import 'package:auth_flutter/models/brew.dart';
import 'package:auth_flutter/services/auth.service.dart';
import 'package:auth_flutter/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();



  @override
  Widget build(BuildContext context) {
      void _onShowSettings(){
        showModalBottomSheet(context: context, builder: (context){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Text('bottom sheet'),
      );
    });
  }
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text('App'),
          backgroundColor: Colors.blue[400],
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Log out')),
            FlatButton.icon(
                onPressed: () => _onShowSettings(),
                icon: Icon(Icons.settings),
                label: Text("settings"))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}

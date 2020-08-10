import 'package:flutter/material.dart';
import 'package:fyp_cs/login.dart';
import 'package:fyp_cs/models/user.dart';
import 'package:fyp_cs/screens/wrapper.dart';
import 'package:fyp_cs/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        // home: LoginPage(),
        // title: 'Volunteer',
        // theme: new ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}

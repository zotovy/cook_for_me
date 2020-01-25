import 'package:flutter/material.dart';
import 'package:food_app/services/auth.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('logout'),
          onPressed: () => AuthService.logout(),
        ),
      ),
    );
  }
}

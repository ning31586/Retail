import 'package:cf_hand2/src/pages/home/home_pages.dart';
import 'package:cf_hand2/src/pages/login/open_login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomePage(),openlogin
        home: openlogin());
  }
}

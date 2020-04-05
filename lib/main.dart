import 'package:flutter/material.dart';
import 'package:sidebar_elastic/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage()
      },
    );
  }
}
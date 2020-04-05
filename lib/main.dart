import 'package:flutter/material.dart';
import 'package:sidebar_elastic/src/pages/files_pages.dart';
import 'package:sidebar_elastic/src/pages/home_page.dart';
import 'package:sidebar_elastic/src/pages/notifications_page.dart';
import 'package:sidebar_elastic/src/pages/payments_page.dart';
import 'package:sidebar_elastic/src/pages/settings_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'payments': (BuildContext context) => PaymentsPage(),
        'notifications': (BuildContext context) => NotificationsPage(),
        'settings': (BuildContext context) => SettingsPage(),
        'files': (BuildContext context) => FilesPage()
      },
    );
  }
}
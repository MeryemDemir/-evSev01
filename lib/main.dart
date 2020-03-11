import 'package:cevsev01/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'file:///C:/apps/cevsev01/lib/app/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LandingPage(
        authService: FirebaseAuthService(),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'Homeapp.dart';
import 'Login.dart';
import 'Info.dart';
import 'HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Tập Võ',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Homeapp(), 
    );
  }
}
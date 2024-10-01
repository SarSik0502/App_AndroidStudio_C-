import 'package:flutter/material.dart';
import 'package:untitled/Pages/home.dart';
import 'package:untitled/Pages/screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.black,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/todo': (context) => Home(),
    },
  )
  );
}
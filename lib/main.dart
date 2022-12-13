import 'package:flutter/material.dart';
import 'package:lab1/pages/autorization.dart';
import 'package:lab1/pages/home.dart';

void main() => runApp(MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Autorization(),
          '/home': (context) => Home(),
        }));

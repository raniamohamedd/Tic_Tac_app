import 'package:flutter/material.dart';
import 'package:flutter_application_9/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark ,
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF00061a),
        shadowColor:  Color(0xFF001456),
        splashColor:   Color(0xFF4169e8),
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Home(),
    );
  }
}

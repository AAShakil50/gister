import 'package:flutter/material.dart';
import 'package:gister/details/details_page.dart';
import 'package:gister/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gister',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

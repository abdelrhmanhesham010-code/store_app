import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constans.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}

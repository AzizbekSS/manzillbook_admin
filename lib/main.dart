import 'package:flutter/material.dart';
import 'package:manzillbook_admin/ui/pages/create_service_pages/createserver.dart';

import 'ui/pages/main_pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: CreateServer()
    );
  }
}



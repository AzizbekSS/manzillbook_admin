import 'package:flutter/material.dart';
import 'package:manzillbook_admin/ui/pages/create_service_pages/createserver.dart';
import 'package:manzillbook_admin/ui/pages/main_pages/home_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: CreateServer(),
      routes: {HomePage.id: (context) => const HomePage()},
    );
  }
}

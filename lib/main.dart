import 'package:flutter/material.dart';
import 'package:shimmer_effect/example_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer Loading Effect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: const ExamplePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
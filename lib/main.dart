import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactivehub/provider_inherited/home_page.dart';
import 'package:reactivehub/provider_inherited/provider/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MaterialApp(home: MyHomePage()),
    );
  }
}

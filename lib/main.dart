import 'package:flutter/material.dart';
import 'package:reactivehub/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // الحل هنا: بنغلف التطبيق بـ BlocProvider
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reactivehub/controllers/bloc/counter_bloc.dart';
import 'package:reactivehub/controllers/cubit/counter_cubit.dart';
import 'package:reactivehub/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [BlocProvider(create: (context) => CounterBloc())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // الحل هنا: بنغلف التطبيق بـ BlocProvider
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reactivehub/controllers/bloc/counter_bloc.dart';
import 'package:reactivehub/controllers/cubit/counter_cubit.dart';
import 'package:reactivehub/home_page.dart';
import 'package:reactivehub/models/user_model.dart';

void main() {
  UserModel user1 = UserModel(id: 45, name: 'Mohamed');
  UserModel user2 = UserModel(id: 45, name: 'Mohamed');
  print(user1 == user2);
  print(user1.hashCode);
  print(user2.hashCode);

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

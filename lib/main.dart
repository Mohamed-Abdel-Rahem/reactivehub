import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactivehub/counter_bloc.dart';
import 'package:reactivehub/homeScreen.dart';
import 'package:reactivehub/my_observer.dart';
import 'package:reactivehub/theme_bloc.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // الحل هنا: بنغلف التطبيق بـ BlocProvider
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
            brightness: state ? Brightness.dark : Brightness.light,
          ),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },
    );
  }
}

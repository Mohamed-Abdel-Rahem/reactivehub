import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactivehub/bloc_counter_depi/counter_bloc.dart';
import 'package:reactivehub/bloc_counter_depi/counter_event.dart';
import 'package:reactivehub/bloc_counter_depi/sconde_screen.dart';
import 'package:reactivehub/bloc_counter_depi/theme_bloc.dart';
import 'package:reactivehub/bloc_counter_depi/theme_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Change Mode'),
                BlocBuilder<ThemeBloc, bool>(
                  builder: (context, state) {
                    return Switch(
                      value: state,
                      onChanged: (value) {
                        context.read<ThemeBloc>().add(ChangeModeEvent());
                      },
                    );
                  },
                ),
              ],
            ),
            Text('Push the button'),
            BlocConsumer<CounterBloc, int>(
              listener: (context, state) {
                if (state != 0 && state % 10 == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You have reached $state')),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScondeScreen()),
                );
              },
              child: Text('Navigate'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              BlocProvider.of<CounterBloc>(
                context,
                listen: false,
              ).add(IncrementEvent());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent());
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: 'btn3',
            onPressed: () {
              context.read<CounterBloc>().add(ResetEvent());
            },
            child: Text(
              '0',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

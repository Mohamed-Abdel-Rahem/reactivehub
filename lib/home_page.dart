import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactivehub/controllers/bloc/counter_bloc.dart';
import 'package:reactivehub/controllers/cubit/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // الـ build parent هتطبع مرة واحدة بس عند فتح الصفحة
    print('build parent');

    return Scaffold(
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.counter == 5) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Counter is 5'),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Push to increase or decrease the counter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // الـ BlocBuilder دلوقتي بقى "موضعي" فقط حول الجزء المتغير
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    '${state.counter}',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag:
                    'add', // متنساش الـ tags عشان الـ Hero error اللي حليناه
                onPressed: () {
                
                  
                  context.read<CounterBloc>().add(IncremetEvent());
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: 'sub',
                onPressed: () {
                
                  context.read<CounterBloc>().add(DecrementEvent());
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: 'Rest',
                onPressed: () => context.read<CounterBloc>().add(ResetEvent()),
                child: Text('0'),
              ),
            ],
          );
        },
      ),
    );
  }
}

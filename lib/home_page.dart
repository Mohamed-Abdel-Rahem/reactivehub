import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactivehub/controllers/bloc/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // الـ build parent هتطبع مرة واحدة بس عند فتح الصفحة
    print('build parent');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Push to increase or decrease the counter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // الـ BlocBuilder دلوقتي بقى "موضعي" فقط حول الجزء المتغير
            BlocSelector<CounterBloc, CounterState, int>(
              selector: (state) {
                return state.counterA;
              },
              builder: (context, state) {
                return Text(
                  'CounterA: $state',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            SizedBox(height: 20),
            BlocSelector<CounterBloc, CounterState, int>(
              selector: (state) {
                return state.counterB;
              },
              builder: (context, state) {
                return Text(
                  'CounterB: $state',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag:
                        'addA', // متنساش الـ tags عشان الـ Hero error اللي حليناه
                    onPressed: () {
                      context.read<CounterBloc>().add(IncremetEventA());
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    heroTag: 'subA',
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementEventA());
                    },
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: 'RestA',
                    onPressed: () =>
                        context.read<CounterBloc>().add(ResetEvent()),
                    child: Text('0'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag:
                        'addB', // متنساش الـ tags عشان الـ Hero error اللي حليناه
                    onPressed: () {
                      context.read<CounterBloc>().add(IncremetEventB());
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    heroTag: 'subB',
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementEventB());
                    },
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: 'RestB',
                    onPressed: () =>
                        context.read<CounterBloc>().add(ResetEvent()),
                    child: Text('0'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

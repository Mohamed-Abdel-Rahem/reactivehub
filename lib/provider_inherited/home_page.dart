import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactivehub/provider_inherited/provider/counter_provider.dart';
import 'package:reactivehub/provider_inherited/second.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Push the button'),
            Consumer(
              builder: (context, CounterProvider value, child) {
                return Text('${value.counter}', style: TextStyle(fontSize: 40));
              },
            ),
            ElevatedButton(
              onPressed: () {
                CounterProvider provider = Provider.of<CounterProvider>(
                  context,
                  listen: false,
                );
                provider.increment();
              },
              child: Text(
                'Increment',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                CounterProvider provider = Provider.of<CounterProvider>(
                  context,
                  listen: false,
                );
                provider.decrement();
              },
              child: Text(
                'Decrement',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MySecond()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

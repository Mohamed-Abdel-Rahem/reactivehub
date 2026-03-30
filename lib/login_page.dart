import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // هنا شيلنا الـ Condition بتاع الـ LoginLoading والـ BlocConsumer بالكامل
            ElevatedButton(
              onPressed: () {
 
                
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

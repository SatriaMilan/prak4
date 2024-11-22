import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                controller.email.value = value; // Update email
              },
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              onChanged: (value) {
                controller.password.value = value; // Update password
              },
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              onChanged: (value) {
                controller.confirmPassword.value =
                    value; // Update confirm password
              },
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller
                    .register(); // Panggil fungsi register dari controller
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

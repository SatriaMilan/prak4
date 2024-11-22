import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.login(); // Panggil fungsi login dari controller
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.REGISTER); // Navigasi ke halaman register
              },
              child: const Text('Belum punya akun? Daftar di sini!'),
            ),
          ],
        ),
      ),
    );
  }
}

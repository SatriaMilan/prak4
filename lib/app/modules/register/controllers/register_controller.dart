import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void register() async {
    if (password.value != confirmPassword.value) {
      Get.snackbar("Register", "Password dan konfirmasi tidak cocok");
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.snackbar(
          "Register", "Registrasi berhasil! ${userCredential.user?.email}",
          colorText: Colors.white,
          backgroundColor: Colors.greenAccent,
          duration: const Duration(seconds: 3));
      // Navigasi ke halaman home setelah registrasi berhasil
      Get.offNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Register", "Gagal registrasi: ${e.toString()}",
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(255, 249, 91, 0),
          duration: const Duration(seconds: 3));
    }
  }
}

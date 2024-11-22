import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.snackbar("Login", "Login berhasil! ${userCredential.user?.email}",
          colorText: Colors.white,
          backgroundColor: Colors.greenAccent,
          duration: const Duration(seconds: 3));
      Get.offNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Login", "Gagal login: ${e.toString()}",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 3));
    }
  }
}

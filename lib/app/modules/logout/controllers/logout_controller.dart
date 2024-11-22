import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/routes/app_pages.dart';

class LogoutController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logout() async {
    try {
      await _auth.signOut();
      Get.snackbar("Logout", "Anda telah berhasil keluar.",
          colorText: Colors.white,
          backgroundColor: Colors.greenAccent,
          duration: const Duration(seconds: 3));
      // Kembali ke halaman login setelah logout
      Get.offNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar("Logout", "Gagal logout: ${e.toString()}",
          colorText: Colors.white,
          backgroundColor: Colors.greenAccent,
          duration: const Duration(seconds: 3));
    }
  }
}

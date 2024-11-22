import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/logout_controller.dart';

class LogoutView extends GetView<LogoutController> {
  const LogoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Konfirmasi Logout'),
      content: const Text('Apakah Anda yakin ingin logout?'),
      actions: [
        TextButton(
          onPressed: () => Get.back(), // Tutup dialog
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            controller.logout(); // Panggil fungsi logout dari controller
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}

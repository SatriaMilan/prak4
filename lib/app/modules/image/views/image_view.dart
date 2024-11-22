// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:io';

// import '../controllers/image_controller.dart';

// class ImageView extends GetView<ImageController> {
//   const ImageView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final imageController = Get.put(ImageController());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ImageView'),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Obx(() {
//             return imageController.selectedImagePath.value.isEmpty
//                 ? const Text(
//                     'No image selected',
//                     style: TextStyle(fontSize: 20),
//                   )
//                 : Image.file(
//                     File(imageController.selectedImagePath.value),
//                     width: 200,
//                     height: 200,
//                     fit: BoxFit.cover,
//                   );
//           }),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               imageController.pickImage();
//             },
//             child: const Text('Pick Image'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myapp/app/modules/crud/controllers/crud_controller.dart';

// class CrudView extends StatelessWidget {
//   final CrudController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('cruds'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () => Get.to(() => AddCrudView()),
//           ),
//         ],
//       ),
//       body: Obx(() {
//         return ListView.builder(
//           itemCount: controller.crudsList.length,
//           itemBuilder: (context, index) {
//             final crud = controller.crudsList[index];
//             return ListTile(
//               title: Text(crud['title'] ?? 'No Title'),
//               subtitle: Text(crud['content'] ?? 'No Content'),
//               trailing: IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () => controller.deletecrud(crud['id']),
//               ),
//               onTap: () => Get.to(() => AddCrudView(crudId: crud['id'], crud: crud)),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

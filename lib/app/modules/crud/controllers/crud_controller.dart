import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CrudController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList crudsList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchcruds(); // Fetch cruds saat controller diinisialisasi
  }

  void fetchcruds() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('cruds').get();
      crudsList.value = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch cruds: $e");
    }
  }

  Future<void> addcrud(String title, String content) async {
    try {
      await _firestore.collection('cruds').add({
        'title': title,
        'content': content,
        'createdAt': Timestamp.now(),
      });
      fetchcruds();
      Get.back();
      Get.snackbar("Success", "crud added successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to add crud: $e");
    }
  }

  Future<void> updatecrud(String id, String title, String content) async {
    try {
      await _firestore.collection('cruds').doc(id).update({
        'title': title,
        'content': content,
      });
      fetchcruds();
      Get.back();
      Get.snackbar("Success", "crud updated successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to update crud: $e");
    }
  }

  Future<void> deletecrud(String id) async {
    try {
      await _firestore.collection('cruds').doc(id).delete();
      fetchcruds();
      Get.snackbar("Success", "crud deleted successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to delete crud: $e");
    }
  }
}

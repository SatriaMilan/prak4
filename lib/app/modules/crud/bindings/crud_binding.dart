import 'package:get/get.dart';
import 'package:myapp/app/modules/crud/controllers/crud_controller.dart';


class CrudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrudController>(() => CrudController());
  }
}

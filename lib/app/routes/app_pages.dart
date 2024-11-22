import 'package:get/get.dart';

// import '../modules/crud/bindings/crud_binding.dart';
// import '../modules/crud/views/crud_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
// import '../modules/image/bindings/image_binding.dart';
// import '../modules/image/views/image_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/logout/bindings/logout_binding.dart';
import '../modules/logout/views/logout_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/resep/bindings/resep_binding.dart';
import '../modules/resep/views/resep_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => const LogoutView(),
      binding: LogoutBinding(),
    ),
    GetPage(
      name: _Paths.RESEP,
      page: () => const ResepView(),
      binding: ResepBinding(),
    ),
    // GetPage(
    //   name: _Paths.CRUD,
    //   page: () => const CrudView(),
    //   binding: CrudBinding(),
    // ),
    // GetPage(
    //   name: _Paths.IMAGE,
    //   page: () => const ImageView(),
    //   binding: ImageBinding(),
    // ),
  ];
}

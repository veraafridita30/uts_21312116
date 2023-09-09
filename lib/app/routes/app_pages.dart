import 'package:get/get.dart';

import '../modules/add_mahasiswa/bindings/add_product_binding.dart';
import '../modules/add_mahasiswa/views/add_mahasiswa_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/resetpassword/views/resetpassword_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/update_mahasiswa/bindings/update_mahasiswa_binding.dart';
import '../modules/update_mahasiswa/views/update_mahasiswa_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MAHASISWA,
      page: () => const AddMahasiswaView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PRODUCT,
      page: () => const UpdateMahasiswaView(),
      binding: UpdateMahasiswaBinding(),
    ),
  ];
}

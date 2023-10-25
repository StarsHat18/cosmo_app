import 'package:cosmo_app/modules/home/Home_screen.dart';
import 'package:cosmo_app/modules/home/home_bindings.dart';
import 'package:cosmo_app/modules/login/login_binding.dart';
import 'package:cosmo_app/modules/login/login_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}

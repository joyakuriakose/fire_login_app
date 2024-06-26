import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/home/home_bindings.dart';
import '../screens/home/home_view.dart';
import '../screens/login/login_bindings.dart';
import '../screens/login/login_view.dart';
import '../screens/sign_up/sign_up_bindings.dart';
import '../screens/sign_up/sign_up_view.dart';
import '../screens/splash_screen.dart';
import '../screens/third_page/third_page_bindings.dart';
import '../screens/third_page/third_page_view.dart';

class Routes {
  static const splash = '/';
  static const signup = '/signup';
  static const login = '/login';
  static const home = '/home';
  static const thirdpage = '/thirdpage';

  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      binding: SignupViewBindings(),
      name: signup,
      page: () => SignupView(),
    ),
    GetPage(
      binding: LoginViewBindings(),
      name: login,
      page: () => LoginView(),
    ),
    GetPage(
      binding: HomeViewBindings(),
      name: home,
      page: () => HomeView(),
    ),
    GetPage(
      binding: ThirdPageBindings('xxxxx'),
      name: thirdpage,
      page: () => ThirdPageView(),
    ),
  ];
}

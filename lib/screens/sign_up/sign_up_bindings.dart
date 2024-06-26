import 'package:fire_login_app/screens/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';


class SignupViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupViewController>(
          () => SignupViewController(),
    );
  }
}
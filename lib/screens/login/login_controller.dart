

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../services/firebase_auth_services.dart';
import '../../utils/routes.dart';

class LoginViewController extends GetxController {
  final FirebaseAuthService auth = FirebaseAuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool showPassword = false.obs;
  RxBool isSigningUp = false.obs;
  RxBool isLoggingProgress = false.obs;
  RxBool keepLoggedIn = false.obs; // State for checkbox

  void signIn() async {
    isSigningUp.value = true;

    String email = emailController.text;
    String password = passwordController.text;

    User? user = await auth.signInWithEmailAndPassword(email, password);

    isSigningUp.value = false;
    if (user != null) {
      Get.snackbar("User is successfully created", 'Success');
      if (keepLoggedIn.value) {
      }
      Get.toNamed(Routes.home);
    } else {
      Get.snackbar("Some error happened", 'Failed');
    }
  }

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  final FocusNode emailCtrlfocusNode = FocusNode();
  final FocusNode pswdCtrlfocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}



import 'package:fire_login_app/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../services/firebase_auth_services.dart';

class SignupViewController extends GetxController {

  final FirebaseAuthService auth = FirebaseAuthService();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool showPassword = false.obs;
  RxBool isSigningUp = false.obs;

  void signUp() async {
    isSigningUp.value = true;

    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await auth.signUpWithEmailAndPassword(email, password);

    isSigningUp.value = false;
    if (user != null) {
      Get.snackbar("User is successfully created", 'Success');
      Get.toNamed(Routes.login);
    } else {
      Get.snackbar("Some error happened", 'Failed');
    }
  }

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  final FocusNode userCtrlfocusNode = FocusNode();
  final FocusNode emailCtrlfocusNode = FocusNode();
  final FocusNode pswdCtrlfocusNode = FocusNode();
  RxBool isLoggingProgress = false.obs;

@override
  void dispose() {
  usernameController.dispose();
  emailController.dispose();
  passwordController.dispose();
  super.dispose();
}
}

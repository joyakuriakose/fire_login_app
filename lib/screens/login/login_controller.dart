import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../services/firebase_auth_services.dart';
import '../../utils/routes.dart';
import '../home/home_view.dart'; // Import HomeView

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
      Get.snackbar("User is successfully signed in", 'Success');
      if (keepLoggedIn.value) {

      }
      navigateToHome(Get.context!);
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

void navigateToHome(BuildContext context) {
  Navigator.of(context).push(_createRoute());
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomeView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

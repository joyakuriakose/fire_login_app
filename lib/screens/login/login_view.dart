import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../components/app_background.dart';
import '../../components/app_buttons.dart';
import '../../components/rounded_loader.dart';
import '../../utils/my_theme.dart';
import '../../utils/my_utils.dart';
import '../../utils/routes.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginViewController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyUtils.hideKeyboard();
      },
      child: Scaffold(
        body: Background(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.0001),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Sign In",
                          style: MyTheme.regularTextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: Get.height * 0.032,
                          ),
                        ),
                        Form(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Column(
                              children: [
                                SizedBox(height: Get.height * .03),
                                TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                  controller: controller.emailController,
                                  decoration: textBoxDecorationn('User Name'),
                                  textInputAction: TextInputAction.next,
                                ),
                                SizedBox(height: Get.height * .04),
                                Obx(
                                      () => TextFormField(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                    controller: controller.passwordController,
                                    obscureText: !controller.showPassword.value,
                                    decoration: textBoxDecoration(
                                      'Password',
                                      IconButton(
                                        onPressed: () {
                                          controller.togglePasswordVisibility();
                                        },
                                        icon: Icon(controller.showPassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      ),
                                    ),
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.02),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                          () => Checkbox(
                                        value: controller.keepLoggedIn.value,
                                        onChanged: (value) {
                                          controller.keepLoggedIn.value = value!;
                                        },
                                      ),
                                    ),
                                    Text(
                                      'Keep me logged in',
                                      style: MyTheme.regularTextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.05),
                        Obx(
                              () => controller.isLoggingProgress.value
                              ? Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: const RoundedLoader(),
                          )
                              : MAButton(
                            text: 'Sign In',
                            buttonPress: () async {
                              controller.signIn();
                            },
                            isEnabled: true,
                            padding: const EdgeInsets.all(30),
                            height: Get.height * 0.06,
                            width: Get.width * 0.5,
                            clipBehavior: 0,
                            radius: 30,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.08),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.signup);
                          },
                          child: Text(
                            "Don't have an account? Sign Up",
                            style: MyTheme.regularTextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: Get.height * 0.018,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


InputDecoration textBoxDecoration(hintText, suffixicon) {
  return InputDecoration(
    suffixIcon: suffixicon,
    suffixIconColor: Colors.white,
    hintText: hintText,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    hintStyle: MyTheme.regularTextStyle(fontSize: 18, color: Colors.white),
  );
}

InputDecoration textBoxDecorationn(hintText) {
  return InputDecoration(
    hintText: hintText,
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    hintStyle: MyTheme.regularTextStyle(fontSize: 18, color: Colors.white),
  );
}

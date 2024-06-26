import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../components/app_background.dart';
import '../utils/my_theme.dart';
import '../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToSignUp();
  }
  void navigateToSignUp() async {
    await Future.delayed(const Duration(milliseconds: 1400));
    if (FirebaseAuth.instance.currentUser != null) {
      Get.toNamed(Routes.home);
    } else {
      Get.toNamed(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.35),
                child: Column(
                  children: [
                    Lottie.asset(
                      "assets/images/bubbles.json",
                      height: Get.height * 0.2,
                      width: Get.width * 0.5,
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Text(
                      "welcome".toUpperCase(),
                      style: MyTheme.regularTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Get.height * 0.037,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              child: Text(
                "Sign Up To Continue",
                style: MyTheme.regularTextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Get.height * 0.020,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

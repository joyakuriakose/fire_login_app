import 'package:fire_login_app/components/rounded_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/app_background.dart';
import '../../components/app_buttons.dart';
import '../../utils/my_theme.dart';
import '../../utils/my_utils.dart';
import '../../utils/routes.dart';
import '../third_page/third_page_view.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({Key? key}) : super(key: key);

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
              Obx(() {
                if (controller.homePageModels.isEmpty) {
                  return Center(child: RoundedLoader());
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemCount: controller.homePageModels.length,
                    itemBuilder: (context, index) {
                      var item = controller.homePageModels[index];
                      var imageUrl =
                      controller.getFullImageUrl(item.imgUrlPath ?? '');

                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ThirdPageView(categoryId: item.id));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item.name ?? '',
                                  style: MyTheme.regularTextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
              Positioned(
                bottom: 16.0, // Adjust this value as needed
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MAButton(
                    text: 'Sign Out',
                    buttonPress: () async {
                      FirebaseAuth.instance.signOut();
                      Get.toNamed(Routes.login);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import '../../components/app_background.dart';
// import '../../components/app_buttons.dart';
// import '../../utils/my_theme.dart';
// import '../../utils/my_utils.dart';
// import '../../utils/routes.dart';
// import 'home_controller.dart';
//
// class HomeView extends GetView<HomeViewController> {
//   const HomeView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           MyUtils.hideKeyboard();
//         },
//         child: Scaffold(
//             body: Background(
//                 child: Stack(children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("SIgn up  success", style: TextStyle(color: Colors.white, fontSize: 18),),
//               SizedBox(height: Get.height * 0.05),
//
//             ],
//           )
//         ]))));
//   }
// }
// MAButton(
// text: 'Sign Out',
// buttonPress: () async {
// FirebaseAuth.instance.signOut();
// Get.toNamed(Routes.login);
// },
// isEnabled: true,
// padding: const EdgeInsets.all(30),
// height: Get.height * 0.06,
// width: Get.width * 0.5,
// clipBehavior: 0,
// radius: 30,
// fontSize: 20,
// ),

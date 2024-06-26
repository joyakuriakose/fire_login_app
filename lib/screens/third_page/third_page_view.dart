import 'package:fire_login_app/components/rounded_loader.dart';
import 'package:fire_login_app/screens/third_page/third_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../components/app_background.dart';
import '../../utils/my_theme.dart';
import '../../utils/my_utils.dart';

class ThirdPageView extends GetView<ThirdPageController> {
  const ThirdPageView({Key? key, String? categoryId}) : super(key: key);

  String get categoryId => 'xxxxx';

  @override
  Widget build(BuildContext context) {
      Get.put(ThirdPageController(categoryId));
    return GestureDetector(onTap: () {
      MyUtils.hideKeyboard();
    },
        child: Scaffold(
      body: Background(
        child: Obx(() {
          if (controller.subCategoryModels.isEmpty) {
            return Center(child: RoundedLoader());
          } else {
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: controller.subCategoryModels.length,
              itemBuilder: (context, index) {
                var item = controller.subCategoryModels[index];
                var imageUrl =
                    controller.getFullImageUrl(item.imgUrlPath ?? '');

                return GestureDetector(
                  onTap: () {
                    // Handle onTap action if needed
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.name ?? '',
                            style: MyTheme.regularTextStyle(fontSize: 16),
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
      ),
    ));
  }
}

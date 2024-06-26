import 'package:fire_login_app/screens/third_page/third_page_controller.dart';
import 'package:get/get.dart';

class ThirdPageBindings extends Bindings {
  final String categoryId;

  ThirdPageBindings(this.categoryId);

  @override
  void dependencies() {
    Get.lazyPut<ThirdPageController>(
          () => ThirdPageController(categoryId),
    );
  }
}

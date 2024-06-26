import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../models/home_page_model.dart';

class ThirdPageController extends GetxController {
  var subCategoryModels = <HomePageModel>[].obs;
  final String categoryId;
  final String apiUrl = 'https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateSubCategoryList?PrmCmpId=1&PrmBrId=2&PrmCategoryId=';

  ThirdPageController(this.categoryId);

  @override
  void onInit() {
    super.onInit();
    fetchSubCategoryData();
  }

  void fetchSubCategoryData() async {
    final response = await http.get(Uri.parse(apiUrl + categoryId));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      subCategoryModels.value = List<HomePageModel>.from(data.map((item) => HomePageModel.fromJson(item)));
    } else {
      Get.snackbar('Error', 'Failed to load data');
    }
  }

  String getFullImageUrl(String imgUrlPath) {
    return 'https://coinoneglobal.in/crm/$imgUrlPath';
  }
}
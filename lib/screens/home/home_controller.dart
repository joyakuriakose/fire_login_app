import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../models/home_page_model.dart';
import 'package:http/http.dart' as http;

import '../../presets/api_paths.dart';

class HomeViewController extends GetxController {
  var homePageModels = <HomePageModel>[].obs;
  final String staticUrl = "https://coinoneglobal.in/crm/";

  @override
  void onInit() {
    super.onInit();
    fetchHomePageData();
  }

  void fetchHomePageData() async {
    final response = await http.get(Uri.parse(
        'https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateCategoryList?PrmCmpId=1&PrmBrId=2'
    ));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      homePageModels.value = List<HomePageModel>.from(
          data.map((item) => HomePageModel.fromJson(item)));
    } else {
      Get.snackbar('Error', 'Failed to load data');
    }
  }

  String getFullImageUrl(String imgUrlPath) {
    return '$staticUrl$imgUrlPath';
  }
}

// class HomeViewController extends GetxController {
//   var homePageModels = <HomePageModel>[].obs;
//   final String staticUrl = "https://coinoneglobal.in/crm/";
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchHomePageData(1, 2);
//   }
//
//   void fetchHomePageData(int PrmCmpId,int PrmBrId) async {
//     try {
//       ApiResp? apiResp = await HomePageServices.getHomeList(1, 2);
//
//       if (apiResp != null && apiResp.ok == true && apiResp.rdata != null) {
//         var data = json.decode(apiResp.rdata!);
//         homePageModels.value = List<HomePageModel>.from(data.map((item) => HomePageModel.fromJson(item)));
//       } else {
//         Get.snackbar('Error', 'Failed to load data: ${apiResp?.msgs?.first?.msg}');
//       }
//     } catch (e) {
//       print('Error fetching home page data: $e');
//       Get.snackbar('Error', 'An error occurred while fetching data. Please try again.');
//     }
//   }
//
//   String getFullImageUrl(String imgUrlPath) {
//     return '$staticUrl$imgUrlPath';
//   }
// }

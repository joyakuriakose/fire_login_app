import 'package:fire_login_app/utils/my_theme.dart';
import 'package:fire_login_app/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: App.appTitle,
      theme: ThemeData(
        primarySwatch: MyTheme.primaryColor1,
        unselectedWidgetColor: Colors.blue,
      ),
      initialRoute: Routes.splash,
      getPages: Routes.routes,
    ),
  );
}

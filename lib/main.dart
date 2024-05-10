import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/utils/app_routs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

void main() {
  HomeController controller = Get.put(HomeController());
  controller.changeTheme();
  runApp(
    Obx(() => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routs,
      theme: controller.isLight.value?ThemeData.light():ThemeData.dark(),
      ),
    ),
  );
}

import 'dart:ffi';

import 'package:db_miner_app/screen/category_model/category_model.dart';
import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../../utils/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.quotesGetData();
    // controller.quotescategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.black ,

        title: Text("Quotes"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    Get.toNamed('dash');
                  },
                  child: Text("Like"),
                ),
              ];
            },
          ),
          Obx(
            () => Switch(
              value: controller.isLight.value,
              onChanged: (value) {
                ShareHelper shr = ShareHelper.shareHelper;
                shr.setTheme(value);
                controller.changeTheme();
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Image.asset(
          //   ("assets/image/p12.png"),
          //   height: MediaQuery.sizeOf(context).height,
          //   width: MediaQuery.sizeOf(context).width,
          //   fit: BoxFit.cover,
          // ),
          Column(
            children: [
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed('detail',
                              arguments: controller.list[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 100,
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.primaries[index].shade200),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${controller.list[index].name}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: "f6"),
                              ),
                              IconButton(
                                  onPressed: () {
                                    categoryModel model = categoryModel(
                                        name: controller.list[index].name);
                                    DBHelper.helper.insertcategory(model);
                                    controller.quotescategory();
                                    Get.snackbar("Favorite to quotes", "success");
                                  },
                                  icon: Icon(Icons.favorite)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}

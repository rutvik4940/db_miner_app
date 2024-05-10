import 'package:db_miner_app/screen/category_model/category_model.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/controller/home_controller.dart';

class LikeCategoryScreen extends StatefulWidget {
  const LikeCategoryScreen({super.key});

  @override
  State<LikeCategoryScreen> createState() => _LikeCategoryScreenState();
}

class _LikeCategoryScreenState extends State<LikeCategoryScreen> {
  HomeController controller = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    controller.quotescategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("like"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(  () => ListView.builder(itemCount: controller.l1.length,itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('detail',arguments: controller.list[index]);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade400
                      ),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("${controller.l1[index].name}",style: TextStyle(fontSize: 20,fontFamily: "f6",fontWeight: FontWeight.bold),),
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 IconButton(onPressed: (){
                                   DBHelper.helper.deletecategory(controller.l1[index].id!);
                                   controller.quotescategory();

                    }, icon: Icon(Icons.delete)),
                               ],
                             )
                           ],
                         ),
                       ),
                    ),
                  );
                },),
            ),
          ),
        ],
      ),
      );
  }
}

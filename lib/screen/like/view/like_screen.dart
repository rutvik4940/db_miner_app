import 'package:db_miner_app/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/like_controller.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  likeController controller = Get.put(likeController());

  void initState() {
    // TODO: implement initState
    super.initState();
    controller.likeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("like quotes"),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.likelist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${controller.likelist[index].id}"),
                    title: Text(
                      "${controller.likelist[index].quotes}",
                      style: TextStyle(fontSize: 18, fontFamily: "f6"),
                    ),
                    subtitle: Text(
                      "- ${controller.likelist[index].author}",
                      style: TextStyle(fontSize: 18, fontFamily: "f6"),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "are you sure?",
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                DBHelper.helper.deleteQuery(
                                    controller.likelist[index].id!);
                                controller.likeData();
                                Get.back();
                              },
                              child: const Text("Yes"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("No"),
                            ),
                          ],
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

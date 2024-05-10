import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/screen/home/model/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  HomeModel model = Get.arguments;
  HomeController controller=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.name}"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            ("assets/image/p12.png"),
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(

                  itemCount: model.authorList!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed('quotes', arguments: [
                          model.authorList![index],
                          model.quotesList![index],
                          model.imageList![index],
                          model.name
                        ]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "${model.imageList![index]}",
                                height: MediaQuery.sizeOf(context).height,
                                width: MediaQuery.sizeOf(context).width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${model.quotesList![index]}",
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,fontFamily: "f6"),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "- ${model.authorList![index]}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: "f6"),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
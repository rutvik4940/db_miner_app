import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:db_miner_app/screen/db_model/dp_model.dart';
import 'package:db_miner_app/screen/like/controller/like_controller.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuotesDetailsScreen extends StatefulWidget {
  const QuotesDetailsScreen({super.key});

  @override
  State<QuotesDetailsScreen> createState() => _QuotesDetailsScreenState();
}

class _QuotesDetailsScreenState extends State<QuotesDetailsScreen> {
  List l1 = Get.arguments;
  likeController controller = Get.put(likeController());
  GlobalKey data1 = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.likeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("quotes"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              dbModel model =
                  dbModel(quotes: l1[1], author: l1[0], name: l1[3],);
              DBHelper.helper.insertQuery(model);
              controller.likeData();
              Get.snackbar("Favorite to quotes", "success");
            },
            icon: Icon(Icons.favorite),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    Get.toNamed('like');
                  },
                  child: Text("Like"),
                ),
                PopupMenuItem(
                  onTap: () {
                    Get.defaultDialog(title: 'set a wallpepar', actions: [
                      ElevatedButton(
                          onPressed: () async {}, child: Text("Home Screen")),
                      ElevatedButton(
                          onPressed: () async {}, child: Text("Lock Screen ")),
                    ]);
                  },
                  child: Text("set a wallpepar "),
                ),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            "${l1[2]}",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      '${l1[1]}',
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "f6"),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        '- ${l1[0]}',
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "f6"),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

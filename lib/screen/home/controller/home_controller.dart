import 'package:db_miner_app/screen/category_model/category_model.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:db_miner_app/utils/json_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../utils/shared_preferences.dart';
import '../../db_model/dp_model.dart';
import '../model/home_model.dart';

class HomeController extends GetxController
{
  RxList<HomeModel>list=<HomeModel>[].obs;
  RxList<categoryModel>l1=<categoryModel>[].obs;
  RxBool isLight = false.obs;
  Future<void> quotesGetData()
  async {
    List<HomeModel>? l1 =await JsonHelper.helper.getData();
    list.value = l1!;
  }
  Future<void> quotescategory()
  async {
    List<categoryModel>?c1= await DBHelper.helper.readcategory();
    l1.value=c1!;
    print(l1.value);
  }
  void changeTheme() async {
    ShareHelper shr = ShareHelper.shareHelper;
    bool? isTheme = await shr.getTheme();
    isLight.value = isTheme ?? false;
  }

}
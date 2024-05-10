import 'dart:convert';

import 'package:db_miner_app/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'as http;

class JsonHelper
{
 static JsonHelper helper=JsonHelper._();
  JsonHelper._();
  Future<List<HomeModel>?> getData()
  async {
    String data= await rootBundle.loadString("assets/json/quotes.json");
    List<dynamic> json=jsonDecode(data);
    List<HomeModel>list=json.map((e) => HomeModel.mapToModel(e)).toList();
    return list;

  }
}
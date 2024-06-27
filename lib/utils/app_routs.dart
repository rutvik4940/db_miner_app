import 'package:db_miner_app/screen/details/view/details_screen.dart';
import 'package:db_miner_app/screen/home/view/home_screen.dart';
import 'package:db_miner_app/screen/like/view/like_screen.dart';
import 'package:db_miner_app/screen/like_category/view/like_category_screen.dart';
import 'package:db_miner_app/screen/quotes_details/view/quotes_details_screen.dart';
import 'package:db_miner_app/screen/splash/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import '../screen/dash/view/desh_screen.dart';

Map<String,WidgetBuilder>app_routs={
  "/":(context) => const SplashScreen(),
  "Home":(context) => const HomeScreen(),
  "dash":(context) => DeshScreen(),
"detail":(context) => const DetailsScreen(),
"quotes":(context) => const QuotesDetailsScreen(),
  "like":(context) => const LikeScreen(),
  "likec":(context) => const LikeCategoryScreen(),

};
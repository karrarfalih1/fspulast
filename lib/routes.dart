

import 'package:fspulast/core/constant/routesname.dart';
import 'package:fspulast/mvc/view/scree/activity/activity.dart';
import 'package:fspulast/mvc/view/scree/hall.dart';
import 'package:fspulast/mvc/view/scree/home/home.dart';
import 'package:fspulast/mvc/view/scree/home/logo_meaning.dart';
import 'package:fspulast/mvc/view/scree/webviewtest.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> routes=[
GetPage(name: "/",page:()=>const Homepage()),
GetPage(name: Approuts.logoMeaning, page:()=>const LogoMeaning()),
GetPage(name: Approuts.activity, page:()=>const Activity()),
GetPage(name: Approuts.roomView, page:()=>const RoomView()),
GetPage(name:Approuts.webview, page:()=> Webviewtest())
];
//لتغيير اللغات 
//راح نخلي التطبيق يفتح بلغة الجهاز واذا راد يغير اللغه يكدر يغيرها من مكان محدد\
import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/apptheme.dart';
import 'package:fspulast/core/flunctions/fcmconfig.dart';
import 'package:fspulast/core/services/services.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:get/get.dart';
class LocaleController extends GetxController{
Locale? mylang;

MyServices myServices=Get.find();
      ThemeData appTheme=darkthem;
      
changeTheme(bool dartthembool){
  if(dartthembool==true){
    appTheme=darkthem;
myservices.sharedPreferences.setString("them","dark");

  }else{
    appTheme=lightthem;
myservices.sharedPreferences.setString("them","light");}
Get.changeTheme(appTheme);
update();
}
changeLang(){
  Locale locale=const Locale('ar');
  myServices.sharedPreferences.setString("lang", "ar");

 Get.updateLocale(locale);

 
}
@override
  void onInit() {
       requestPermissionNotification();
    fcmconfig();
   String? themeshared=myServices.sharedPreferences.getString("them");
   if(themeshared=="dark"){
    changeTheme(true);
   }else{
    changeTheme(false);
   }

    changeLang();
String?  curntlang= myServices.sharedPreferences.getString("lang");
    if(curntlang=="ar"){
      mylang= const Locale("ar");
    }else if(curntlang=="en"){
   mylang=const Locale("ar");
    }else{

    mylang=Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }

}

import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:fspulast/mvc/view/scree/card/about_as.dart';
import 'package:fspulast/mvc/view/scree/card/boint.dart';
import 'package:fspulast/mvc/view/scree/card/suggestactivityview.dart';
import 'package:fspulast/mvc/view/scree/card/support.dart';
import 'package:get/get.dart';

abstract class CartContrller extends GetxController{
chosecart(index);
}
class CartContrllerImp extends CartContrller{
List<Widget> page=[
   const AboutAs(),
   const BointView(),
 
   
   const Suggestactivityview(),
   const Supportview(),
     
 
];
List datacart=[
  {"icon":AppImagesasset.users,
  "title":"من نحن "},
  
  {"icon":AppImagesasset.point,
  "title":"نقاطي"},
  

     {"icon":AppImagesasset.ak,
  "title":"اقترح نشاط"},
  {"icon":AppImagesasset.hand,
  "title":"ادعمنا",},


];
@override
  chosecart(index){
Get.to( ()=> page[index]);
update();
}
}
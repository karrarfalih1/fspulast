 //في هذه الصفحة نحن نفحص الايميل فقط 
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/constant/routesname.dart';
import 'package:fspulast/core/flunctions/handlingdatacontroller.dart';
import 'package:fspulast/core/services/services.dart';
import 'package:fspulast/mvc/modeldata/data/card/points.dart';
import 'package:fspulast/mvc/modeldata/data/card/slider.dart';
import 'package:fspulast/mvc/modeldata/data/home/home.dart';
import 'package:get/get.dart';
MyServices myservices=Get.find();
abstract class HomeController extends  GetxController{

}

class HomeControllerImp extends HomeController{
  GlobalKey<ScaffoldState>scaffoldkey=GlobalKey();
  Points points =Points(Get.find());
  Homedata homedata=Homedata(Get.find());
//  LocaleController controllerthem=Get.put(LocaleController());
StatusRequest statusRequest=StatusRequest.none;
SliderData sliderData=SliderData(Get.find());
//////////points///////////
RxInt mypoints =0.obs;

List dataActivity=[];
List dataAds=[];
List dataweb=[];

List data=[];

 var total=0;
//////// drower//////////
    int value = 0;
  int? nullableValue;
  bool? positive ;
  bool loading = false;


ThemeData applight=
ThemeData(
   brightness: Brightness.light,
);

ThemeData appdart=
ThemeData(
   brightness: Brightness.dark,
);

positivef(b){
positive=b;

//controllerthem.changeTheme(positive!);
update();

}

 PageController pageController=PageController();
 var currenPage=0.obs;
 @override


  @override
  void onInit() {
FirebaseMessaging fir=FirebaseMessaging.instance;
fir.subscribeToTopic("users");
//startAutoSlide();

    if(myservices.sharedPreferences.getString("them")=="dark"){
      positive=true;
    }else{
      positive=false;
    }
    
    super.onInit();
    getData();
   
  
     
      
      
  }
 getData()async{
    statusRequest=StatusRequest.loading;
      update();
    var response=await homedata.getdata();
    statusRequest=handleingData(response["data"]);
       
    if(StatusRequest.success==statusRequest){
    
      if(response['status']=='success'){
        dataAds.addAll(response['ads']);
        dataActivity.addAll(response['activity']);
        dataweb.addAll(response['website']);
        print(dataActivity);
        
       
  }

    }
    update();
  }

  gotoactivity(){
Get.toNamed(Approuts.activity);
  }
  
/////////////////////////////////
  void startAutoSlide(){ 
    
    Timer.periodic(const Duration(seconds: 10), (timer){
      if(currenPage.value<2){
        currenPage.value++;
      }else{ 
        currenPage.value=0;
      }
      pageController.animateToPage(
        currenPage.value,

       duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);

    });
  }
  @override
  void onClose() async{
    super.onClose();
    
    pageController.dispose();

  }
 



}
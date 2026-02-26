 //في هذه الصفحة نحن نفحص الايميل فقط 
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/constant/routesname.dart';
import 'package:fspulast/core/flunctions/handlingdatacontroller.dart';
import 'package:fspulast/core/localization/changelocal.dart';
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
  
  LocaleController controllerthem=Get.put(LocaleController());
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
late PageController pageControllerForAdv;
 var currentPageAdv=0.obs;
  Timer? _timer;

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

controllerthem.changeTheme(positive!);
update();

}


 //////////////slider

    void startAutoSlide(List addata){ 
    _timer?.cancel();
    Timer.periodic(const Duration(seconds: 5), (timer){
      if(currentPageAdv.value<addata.length-1){
        currentPageAdv.value++;
      }else{ 
        currentPageAdv.value=0;
      }
      if(pageControllerForAdv.hasClients){
      pageControllerForAdv.animateToPage(
        currentPageAdv.value,

       duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      }


    });
  }
/////////////end slider

  @override
  void onInit() {
      pageControllerForAdv=PageController();
       currentPageAdv=0.obs;
FirebaseMessaging fir=FirebaseMessaging.instance;
fir.subscribeToTopic("users");


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
       startAutoSlide(dataAds);
        
       
  }

    }
    update();
  }

  gotoactivity(){
Get.toNamed(Approuts.activity);
  }
  
/////////////////////////////////

  @override
  void onClose() async{
       _timer?.cancel();
   pageControllerForAdv.dispose();
    super.onClose();
    
    

  }
 



}
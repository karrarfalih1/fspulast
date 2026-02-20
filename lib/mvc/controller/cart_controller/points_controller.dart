
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/flunctions/handlingdatacontroller.dart';
import 'package:fspulast/core/services/services.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:fspulast/mvc/modeldata/data/card/getwining_data.dart';
import 'package:get/get.dart';

abstract class PointsController extends GetxController{

}
class PointsControllerImp extends PointsController{
  MyServices myServices=Get.find();
GetwiningData getwiningData =GetwiningData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  List data=[];
 late HomeControllerImp controllerHome;
 late RxInt newpoints=0.obs;
 late RxInt oldpoints=0.obs;
 //////////////للضغط مرة واحدة في اليوم/////////
 Rx<DateTime?> lastClickTime=Rx<DateTime?>(null);// وقت الضغط الأخير
 Rx<Duration> remainingTime=Duration.zero.obs; // الوقت المتبقي
 loadLastClickTime(){
   String? lastclickoneString= myservices.sharedPreferences.getString("lastclikone");
  if(lastclickoneString !=null){
    lastClickTime.value=DateTime.parse(lastclickoneString);
    updataRemainingTime();//تحديث الوقت المتبقي
  }
 }
 updataRemainingTime(){
  if(lastClickTime.value!=null){
    DateTime now=DateTime.now();
    Duration diffrence=now.difference(lastClickTime.value!);//حساب الفرق
    if(diffrence< const Duration(days: 1)){
      remainingTime.value=const Duration(days: 1)-diffrence;

    }else{
      remainingTime.value=Duration.zero;//لا يوجد وقت متبقي
    }
  }
 }
handleButtonClick(){
  if(remainingTime.value>Duration.zero){
     Get.snackbar(
        'تنبيه',
        'لا يمكنك الضغط الآن. الوقت المتبقي: ${remainingTime.value.inHours} ساعة و ${remainingTime.value.inMinutes % 60} دقيقة.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    // تنفيذ الإجراء المطلوب عند الضغط
    Get.snackbar(
      'نجاح',
      'تم الضغط بنجاح!',
      snackPosition: SnackPosition.BOTTOM,
    );

    // حفظ وقت الضغط
    DateTime now = DateTime.now();
   // box.write('lastClickTime', now.toIso8601String());
   myservices.sharedPreferences.setString("lastclikone",now.toIso8601String());
    lastClickTime.value = now; // تحديث وقت الضغط
   updataRemainingTime(); // إعادة حساب الوقت المتبقي
  }

 ////////////////
@override
  void onInit() {
     loadLastClickTime();
  getwiningpoints();
  if(myServices.sharedPreferences.getString("point") !=null){
 oldpoints.value=int.parse(myServices.sharedPreferences.getString("point").toString());
  
  }else{
    myServices.sharedPreferences.setString("point",'0');
    oldpoints.value=int.parse(myServices.sharedPreferences.getString("point").toString());
  
  }
     controllerHome=Get.find<HomeControllerImp>();
    newpoints.value=controllerHome.mypoints.value;
    super.onInit();
  }
funpluspoints(int x){
  print("${myServices.sharedPreferences.getString("lastclikone")}");
  
newpoints.value= newpoints.value +x;

 update();
  
}

 @override
  void onClose() async{
    
     print("-------------newpints--------------");
    print("$newpoints"); 
     print("-------------oldpoins--------------");
    print("$oldpoints");
     
    super.onClose();
   
   
   await myServices.sharedPreferences.setString("point",newpoints.toString());
    
    // TODO: implement onClose
  }

       getwiningpoints() async{
    statusRequest=StatusRequest.loading;
      update();
    var response=await getwiningData.getdata();
    statusRequest=handleingData(response);
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
  
data.addAll(response['data']);
print(data);
  }else{
    statusRequest=StatusRequest.failure; }
}
update();
  }
}
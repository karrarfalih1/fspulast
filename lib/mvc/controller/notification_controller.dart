
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/flunctions/handlingdatacontroller.dart';
import 'package:fspulast/mvc/modeldata/notifay_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{

StatusRequest statusRequest =StatusRequest.none;

  NotifayData notifayData =  NotifayData(Get.find());
  List data=[];
    getdata()async{
data.clear();
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
    update();
//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await notifayData.getntefy(
      "1",//myservices.sharedPreferences.getString("id")!
    ); 

    statusRequest=handleingData(response);

//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
  data.addAll(response['data']);
  }else{
    statusRequest=StatusRequest.failure;
  }
 
}
update();
  }
  @override
  void onInit() {
     getdata();
    super.onInit();

  }
}
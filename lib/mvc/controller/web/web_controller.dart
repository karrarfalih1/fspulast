
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/flunctions/handlingdatacontroller.dart';
import 'package:fspulast/mvc/modeldata/data/web/webdata.dart';
import 'package:get/get.dart';

class WebController extends GetxController {

StatusRequest statusRequest =StatusRequest.none;
List data=[];
Webdata webdata =Webdata(Get.find());

@override
  void onInit() {
     getdata();
   
    super.onInit();
  }

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await webdata.getData();
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
    data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      } 
    }
    update();
  }
}
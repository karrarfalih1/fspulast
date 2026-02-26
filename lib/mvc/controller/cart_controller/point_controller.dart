
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/flunctions/handlingdatacontroller.dart';
import 'package:fspulast/mvc/modeldata/data/card/pointdata.dart';
import 'package:get/get.dart';

class PointController extends GetxController{

  StatusRequest statusRequest =StatusRequest.none;
  Pointdata pointdata =Pointdata(Get.find());
  String  point ="0";
  List data=[];
  @override
  void onInit() {
     getData();
    // TODO: implement onInit
    super.onInit();
  }
  getData()async{
        statusRequest = StatusRequest.loading;
    update();
    var response = await pointdata.getdata(
      "1"// myservices.sharedPreferences.getString("id")
    );
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        point=response['total_points'].toString()=="null"?"0":response['total_points'].toString();
        data.addAll(response['topusers']);
     
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
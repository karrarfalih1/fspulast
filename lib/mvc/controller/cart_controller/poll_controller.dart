import 'package:flutter/material.dart';
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/core/flunctions/handlingdatacontroller.dart';
import 'package:fspulast/core/services/services.dart';
import 'package:fspulast/mvc/modeldata/data/card/poll.dart';
import 'package:get/get.dart';

class PollController extends GetxController {}

class PollControllerImp extends PollController {
 MyServices myServices=Get.find();
  List myshose = ["0", "0", "0", "0"];
  int check = 0;
  Polldata polldata = Polldata(Get.find());

  List data = [];

  StatusRequest statusRequest = StatusRequest.none;

  StatusRequest statusRequestselct = StatusRequest.none;
  shoseone(i, vall) {
    myshose[i] = vall;

    update();
  }

  @override
  onInit() {
    super.onInit();
    getpollview();
  }

  getpollview() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await polldata.getdata(
      myServices.sharedPreferences.getString("id")
    );
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

  cheksnepoll() {
    for (int x = 0; x < myshose.length; x++) {
      if (myshose[x] == "0") {
        Get.dialog( Dialog(
          child: Container(
            height: 200,
            margin:const EdgeInsets.all(10),
          child:const Center(child: Text("هناك حقول فارعة ",style: TextStyle(fontSize: 18),),),),
        ));
        return;
      }
    }

    sendselctpoll();
    Get.back();
  }

  sendselctpoll() async {
    statusRequestselct = StatusRequest.loading;
    update();
    var response = await polldata.slectpoll(myshose[0].toString(),
        myshose[1].toString(), myshose[2].toString(), myshose[3].toString(),myServices.sharedPreferences.getString("id"));
    statusRequestselct = handleingData(response);
    if (StatusRequest.success == statusRequestselct) {
      if (response['status'] == 'success') {
              Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColor.fspucolortwo,
            animationDuration: const Duration(seconds: 2),
            title: "نجاح",
            messageText: const Text("تم اضافة  الاستبيان  بنجاح"));
      } else {
        statusRequestselct = StatusRequest.failure;
      }
    }
    update();
  }
}

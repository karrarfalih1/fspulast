import 'package:flutter/material.dart';
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/flunctions/handlingdatacontroller.dart';
import 'package:fspulast/mvc/modeldata/data/halldata.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class HallController extends GetxController {}

class HallControllerImp extends HallController {
  StatusRequest statusRequest = StatusRequest.none;
    StatusRequest statusRequestimage = StatusRequest.none;
     StatusRequest statusRequestresrvation = StatusRequest.none;
  Halldata halldata = Halldata(Get.find());
List data=[];
List dataimage=[];
  List detels = [
    {"title": "المساحة", "icon": Icons.straighten, "namehall": "hall_size"},
    {"title": "المقاعد", "icon": Icons.chair, "namehall": "hall_chire"},
    {"title": "الطاولات", "icon": Icons.deck, "namehall": "hall_taple"},
    {"title": "مايك", "icon": Icons.mic, "namehall": "hall_mic"},
    {"title": "مكبرات", "icon": Icons.speaker, "namehall": "hall_spekers"},
    {"title": "WC", "icon": Icons.wc, "namehall": "hall_wc"},
    {"title": "مطبخ", "icon": Icons.restaurant, "namehall": "hall_ktichin"},
    {"title": "مكتب", "icon": Icons.desk, "namehall": "hall_desk"},
    {"title": "ستوديو", "icon": Icons.videocam, "namehall": "hall_studio"}
  ];

  @override
  void onInit() {

gethalldetels();
    super.onInit();
  }
Future<void> makePhoneCall(String phoneNumber) async {
  final Uri url = Uri.parse('tel:$phoneNumber');

  try {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } catch (e) {
    throw 'Could not launch $url';
   
  }
}
  gethalldetels() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await halldata.halldata();
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['hall']);
        dataimage.addAll(response['image']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  

 
}

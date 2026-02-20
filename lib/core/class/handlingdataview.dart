

import 'package:flutter/widgets.dart';
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget{
   final StatusRequest statusRequest;
   final Widget widget;
   const HandlingDataView({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
   return 
   statusRequest==StatusRequest.loading? Center(child:Lottie.asset(AppImagesasset.Loading)):
   statusRequest==StatusRequest.offlinefailure? Center(child:Lottie.asset(AppImagesasset.wifi,repeat: true),):
   statusRequest==StatusRequest.serverfailure?const Center(child: Text("serverfailur"),):
   statusRequest==StatusRequest.failure? Center(child:Lottie.asset(AppImagesasset.card),):widget;



  }

}
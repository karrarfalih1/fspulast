import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fspulast/linkapi.dart';
import 'package:fspulast/mvc/controller/hall_controller.dart';
import 'package:get/get.dart';

class ImageHallWidget extends GetView<HallControllerImp>{
  const ImageHallWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    GetBuilder<HallControllerImp>(builder:(controller)=>
        SizedBox(
            height: 200,
            width: double.infinity,
            child: PageView.builder(
                itemCount: controller.dataimage.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    child: CachedNetworkImage(imageUrl:  "${Applink.images}/${controller.dataimage[index]['hallimage_image']}",
                    fit: BoxFit.cover,),
                  );
                }),
          ),
    );
     }}
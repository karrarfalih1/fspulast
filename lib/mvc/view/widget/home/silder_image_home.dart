
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fspulast/core/class/handlingdataview.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:fspulast/core/constant/routesname.dart';
import 'package:fspulast/linkapi.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:get/get.dart';
class SilderImageHome extends GetView<HomeControllerImp> {
 
  const SilderImageHome({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    Stack(
    children: [
     
      SizedBox( 
      
        
         height: 260,
                          //  margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: HandlingDataView(statusRequest: controller.statusRequest, widget: 
                      PageView.builder(
                            //  controller: controller.pageController,
                              itemCount: controller.dataAds.length,
                            
                              onPageChanged: (index) {
                              controller.currenPage.value = index;
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return ClipRRect(
                                  borderRadius:const BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                     bottomLeft: Radius.circular(20)
                                  ),
                                  child:  CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      imageUrl:
                                          "${Applink.images}/${controller.dataAds[index]["ads_image"]}"),
                                );
                              },
                            ),      )
                          ),
                           Positioned(child: SizedBox(
        width: Get.width,
        height: 50,
       // color: Colors.amber,
       child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           
          IconButton(onPressed:(){controller.scaffoldkey.currentState!.openDrawer();}, icon: const Icon(

            Icons.menu,size: 35,color:AppColor.fspucolor,)),
         
             IconButton(onPressed:(){}, icon: const Icon(

            Icons.notifications_outlined,size: 35,color:AppColor.fspucolor,)),
            const Spacer(),
          SizedBox(
        height: 42,
          child: InkWell(
            onTap: (){
              Get.toNamed(Approuts.logoMeaning);
            },
            child:Hero(tag: "1", child:  Image.asset(AppImagesasset.fspulogo1))
            )),
       ],),
          
      )),
    ],
    );
  }
}


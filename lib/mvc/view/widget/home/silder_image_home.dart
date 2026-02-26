
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
         height: 240,
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
          SizedBox(width: 4,),
          InkWell(
            onTap: ()=>controller.scaffoldkey.currentState!.openDrawer(),
            child: Container(
              width: 45,
              height: 45,
              margin: const EdgeInsets.only(top: 1),
              padding:EdgeInsets.all(1),
            
              decoration: BoxDecoration(
                color: AppColor.fspucolor,
                shape: BoxShape.circle,
             
              ),
              
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: "${Applink.images}/karrar.jpg",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    errorWidget: (context, url, error) =>
              Image.asset(AppImagesasset.manuser, fit: BoxFit.cover),
                  ),
                ),
              
            ),
          ),
           
           SizedBox(width: 5,),




            InkWell(
              onTap: ()=>Get.toNamed(Approuts.notification),
              
              child:SizedBox(
                              width: 40,
                              height: 40,
                              child: SvgPicture.asset(
     colorFilter: ColorFilter.mode( AppColor.fspucolor, BlendMode.srcIn),
                      width: 35,
                      AppImagesasset.notfy)))
         /*
             IconButton(onPressed:(){}, icon: const Icon(

            Icons.notifications_outlined,size: 35,color:AppColor.fspucolor,))
            */
            
            
            ,
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


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:fspulast/linkapi.dart';
import 'package:fspulast/mvc/controller/activity/activity_controller.dart';
import 'package:fspulast/mvc/controller/map_controller.dart';
import 'package:fspulast/mvc/modeldata/model/activitymodel.dart';
import 'package:fspulast/mvc/view/widget/activity/stars.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class BostActivity extends GetView<ActivityControllerImp> {
  ActivityModel activityModel;
  BostActivity({super.key,required this.activityModel});
  @override
  Widget build(BuildContext context) {
    MapControllerImp controllermap=Get.put(MapControllerImp());
   
   
        return GetBuilder<ActivityControllerImp>(builder: (controller)=>
        Container(
    margin:const EdgeInsets.only(bottom: 15),
    
         
         width: double.infinity,
      height: 500,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 1,
              child:
           
               
               Stack(
               
                 children: [
                   
                   ClipRRect(
                      
                      borderRadius: BorderRadiusGeometry.circular(30),
                      child: CachedNetworkImage(
                       
                         placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        fit:BoxFit.cover,
                        width: double.infinity,
                        imageUrl: "${Applink.images}/${activityModel.activityImage}",
                      
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                   ),
                    ),
                   Positioned(
                    top: 0,
                    left: 0,
                     child:Stars(point: activityModel.activityPoint??0,)),
                   
                 ],
                 
               ),
              
            ),
            
              Expanded(
              flex: 2,
                child:Container(
              //   padding: EdgeInsets.all(15),
                  child: Column(children: [
                    SizedBox(height: 10,),
                    Text("${activityModel.activityTitle}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColor.fspucolor,),),
                 Divider(
  
                  
                  thickness: 0.8,
                  endIndent: 50,
                  indent: 50,
                  color: AppColor.fspucolor,
                 ),
                          
                         
                    
                   InkWell(onTap: (){
        
                    controllermap.showmap(
                         double.parse(activityModel.activityLangtude.toString()),
                       double.parse(activityModel.activityLatitude.toString())
                     
                      ,activityModel.activityLocationName);
                   },
                     child: ListTile(
                      trailing:const Text("اضهر على الخريطة",style: TextStyle(color: AppColor.fspucolor),),
                        title: const Text("الموقع",style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("${activityModel.activityLocationName}"),
                        leading: const Icon(Icons.location_on,
                        color: AppColor.fspucolor,
                       ),),
                   ),
                   ListTile(
                        title: const Text("الجهة المنفذة",style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("${activityModel.activityGroubId}"),
                        leading: const Icon(Icons.business,
                        color: AppColor.fspucolor,
                       ),),
                       Divider(
                        height: 10,
                        endIndent: 20,
                        indent: 20,
                             ),
           Row(children: [
                            SizedBox(width: 10,),
                            Column(children: [Row(
                              children: [
                                Text("يبدا ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),
                                Text(Jiffy.parse(activityModel.activityDateStart.toString()).format(pattern: 'EEEE dd MMMM | الساعة hh:mm a'),style: TextStyle(fontSize: 13),)
                              ],
                            ),Row(
                              children: [
                                Text("ينتهي ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),
                                Text(Jiffy.parse(activityModel.activityDateEnd.toString()).format(pattern: 'EEEE dd MMMM | الساعة hh:mm a'),style: TextStyle(fontSize: 13),)
                              ],
                            ),
       ],)
                                                  ,Spacer()
                                                  ,Container(
                                                 padding: const EdgeInsets.only(top: 9),
                                               child: Jiffy.parse(activityModel.activityDateStart.toString()).isBefore(Jiffy.now())?Container(
                                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                                 decoration: BoxDecoration(
                                                   color: const Color.fromARGB(255, 240, 148, 142),
                                                   borderRadius: BorderRadius.circular(10)
                                                 ),
                                                 child: const Text("نشط الان",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.black),)):
                                               Text(Jiffy.parse(activityModel.activityDateStart.toString()).fromNow(),style: const TextStyle(fontWeight: FontWeight.bold)),
                                                ),SizedBox(width: 5,),
                           ],),
                     const Spacer(),
                     InkWell(
                      onTap: (){
                        if(controller.isSelect[activityModel.activityId]==0){
                          controller.setActivity(activityModel.activityId, 1);
                           controller.addactivity(activityModel.activityId.toString(),activityModel.activityPoint.toString());
                        }else{
                          Get.defaultDialog(
                            title: "تنبيه",
                            titleStyle: const TextStyle(color:  AppColor.fspucolortwo),
                            middleText: "هل انت متاكد من حذف اسمك من هذا النشاط؟",
                            actions: [
                              ElevatedButton(onPressed:(){
                                Get.back();
                                controller.setActivity(activityModel.activityId, 0);
                                controller.deletactivity(activityModel.activityId.toString());
                    
                              }, child:const Text("نعم",)),
                             const SizedBox(width: 40,),
                                 ElevatedButton(onPressed:(){  Get.back();}, child:const Text("لا"))
                      
                            ]
                          );
                               }
                      },
                      
                       child: Container(
                                           padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        width: double.infinity,
                        child:  Card(color:controller.isSelect[activityModel.activityId]==0? AppColor.fspucolor:AppColor.fspucolortwo,
                        child:  Center(child: Text(controller.isSelect[activityModel.activityId]==0? "اضغط هنا لتسجيل  اسمك":"الغاء النشاط",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                       
                        ),),
                     ),const SizedBox(height: 10,)
                  ],),
                ) )
          ],)))
        );

      
  }
}


import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/mvc/controller/activity/activity_controller.dart';
import 'package:fspulast/mvc/controller/map_controller.dart';
import 'package:fspulast/mvc/modeldata/model/activitymodel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BostActivity extends GetView<ActivityControllerImp> {
  ActivityModel activityModel;
  BostActivity({super.key,required this.activityModel});
  @override
  Widget build(BuildContext context) {
    MapControllerImp controllermap=Get.put(MapControllerImp());
    DateTime parsedDate=DateTime.parse(activityModel.activityDateCreate.toString());
    DateTime currentDate=DateTime.now();
    DateTime justdatyfuter=DateTime(parsedDate.year,parsedDate.month,parsedDate.day);
    
    DateTime justdatynow=DateTime(currentDate.year,currentDate.month,currentDate.day);
    int remainigDays=justdatyfuter.difference(justdatynow).inDays;

    String datek=DateFormat('yyyy-MM-dd').format(parsedDate);
   
    String timek=DateFormat('hh-mm a').format(parsedDate);
        return GetBuilder<ActivityControllerImp>(builder: (controller)=>
        Container(
    margin:const EdgeInsets.only(bottom: 15),
    
         
         width: double.infinity,
      height: 530,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
     //     mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 2,
              child: ListTile(
              title: Text("${activityModel.activityTitle}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColor.fspucolor,),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text("${activityModel.activityDisc}")),

            )),
            
              Expanded(
              flex: 3,
                child:Container(
              //    padding: EdgeInsets.all(15),
                  child: Column(children: [
                 
                        ListTile(
                      title: const Text("التاريخ",style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Row(children:[ Text(datek),Container(
                        width: 70,
                        height: 20,
                        
                        decoration: BoxDecoration(
                          color: AppColor.fspucolor1,
                          //color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)
                        ),
                        margin: const EdgeInsets.only(right: 5),
                      //  padding: EdgeInsets.symmetric(horizontal: 5)
                     
                      child: Center(child: Text(timek,style: const TextStyle(fontFamily: "snas",color: Colors.black),)),
                        )]),
                      leading: const Icon(Icons.date_range,
                      color: AppColor.fspucolor,
                      
                     ),
                     trailing: Container(
                      padding: const EdgeInsets.only(top: 9),
                    child: remainigDays==0?Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 148, 142),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Text("نشط الان",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)):
                    Text("باقي $remainigDays يوم",style: const TextStyle(fontWeight: FontWeight.bold)),
                     ),),
                   InkWell(onTap: (){
       
                    controllermap.showmap(
                         double.parse(activityModel.activityLangtude.toString()!),
                       double.parse(activityModel.activityLatitude.toString()!)
                     
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
           
                     const Spacer(),
                     InkWell(
                      onTap: (){
                        if(controller.isSelect[activityModel.activityId]==0){
                          controller.setActivity(activityModel.activityId, 1);
                           controller.addactivity(activityModel.activityId.toString());
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
                        height: 70,
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


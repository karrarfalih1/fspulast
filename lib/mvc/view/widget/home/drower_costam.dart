/*
import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:fspulast/core/services/services.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:get/get.dart';

class DrowerCostam extends GetView<HomeControllerImp>{
  const DrowerCostam({super.key});
  @override
  Widget build(BuildContext context) {
    
    MyServices  myServices=Get.find();
           return Column(
              children: [
               
           SizedBox( 
         //   width: 200,
            height: 150,
              child: GetBuilder<HomeControllerImp>(builder:(controller)=>
             
             Stack(
             alignment: Alignment.center,
               clipBehavior: Clip.none,
               children: [
               
                 Container(
                  decoration: BoxDecoration(
                  
                      color:controller.positive==true? AppColor.fspucolortwo:AppColor.fspucolortwo,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                 
                 //  height: Get.width/2.2,
                 ),
             
                  Positioned(
             top: 0,
             right: 0,


               child: 
                Container(
                  padding: const EdgeInsets.only(right: 7,top: 7),

                // margin: EdgeInsets.only(bottom: 50),
                 //    color: Colors.amber,
                     height: 100,
                   //  width: 340,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      SizedBox(
                        height: 85,
                        child: CircleAvatar(
                         
                          radius: 38,
                          backgroundColor:Colors.white,
                          backgroundImage: AssetImage(
                            AppImagesasset.wimanuser
                          
                            ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("${myservices.sharedPreferences.getString("username")}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                        const SizedBox(height: 6,),
                       
                       
                        Text("${myServices.sharedPreferences.getString("email")}",style: const TextStyle(fontSize: 13,),),

                      ],)
                     ],),
                   ),)
              
             
               ],
             ))
           ),
const SizedBox(height: 20,),
  const Row(children: [
    SizedBox(width: 10,),
   
  SizedBox(width: 10,),
  DartLighMode()],)     
,
const SizedBox(height: 300,),
InkWell(
  onTap: () {
     Get.defaultDialog(
    title: "تنبيه",
    middleText: "هل انت متاكد من انك تريد تسجيل الخروج من هذا التطبيق",
    actions: [
      ElevatedButton(onPressed:(){
       myservices.sharedPreferences.clear();
     //  Get.offAllNamed(Approute.login);
      }, child:const Text("نعم")),
        ElevatedButton(onPressed:(){
          Get.back();
        }, child:const Text("لا"))
    ]
  );
  },
  child: const ListTile(title: Text("تسجيل الخروج"),
  leading: Icon(Icons.logout,color: Colors.red,),
  ),
),

              ],
              );
           
              }}*/
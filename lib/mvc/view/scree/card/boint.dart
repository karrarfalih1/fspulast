import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fspulast/core/class/handlingdataview.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:fspulast/linkapi.dart';
import 'package:fspulast/mvc/controller/cart_controller/point_controller.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:get/get.dart';

class BointView extends StatelessWidget{

  const BointView({super.key});

  @override
  Widget build(BuildContext context) {
 Get.put(PointController());
   return  Scaffold(
     appBar: AppBar(
      
        centerTitle: true,
       backgroundColor: AppColor.fspucolor,
        title: Text("نظام النقاط",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:Colors.white),),
     ),
     body: GetBuilder<PointController>( builder: (controller)=>
   HandlingDataView(statusRequest: controller.statusRequest, widget:   Container(
           // padding: EdgeInsets.all(15),
         child: ListView(children: [
       Stack(
        clipBehavior: Clip.none,
        children: [
          
           Container(
            decoration: const BoxDecoration(
              color: AppColor.fspucolor,
              borderRadius:BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30))
            ),
            
            height: 100,width: double.infinity,),
                Container(
                  alignment: Alignment.center,
              
                height: 100,
                child: Column(children: [
                  const SizedBox(height: 20,),
                  Row(children: [
                    Spacer(),
                    Text("لديك ",style: const TextStyle(color: AppColor.fspucolortwo,fontSize: 18),),
                    Text( controller.point,style: TextStyle(fontSize: 25,color: AppColor.fspucolortwo),),
                    Text(" نقطة",style: const TextStyle(color: AppColor.fspucolortwo,fontSize: 18),),
                    Spacer(),
                  ],),
                      
                ],)
              ),
       
       
              
       ],),
       const SizedBox(height: 10,),
       
    
        Container(
          padding: const EdgeInsets.all(5),
         // margin: EdgeInsets.all(5),
          height: 150,
       
          child: Card(
       child: Container(

         margin: const EdgeInsets.all(15),
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           const SizedBox(
        width: double.infinity,
        child: Text("ما هو نظام النقاط",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: AppColor.fspucolor),)),
        const SizedBox(height: 10,),
        Text("نظام النقاط هو نظام يتيح للمستخدمين الحصول على نقاط مقابل أنشطة معينة وتختلف نقاط كل نشاط باختلاف اهميته .",style: TextStyle(fontSize: 12),),
   
         
         ],),
       ),        
          ),)
       
           ,
       const SizedBox(height: 20,),
       const SizedBox(
         width: double.infinity,
         child: Text("المتصدرون",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),)
            ,const SizedBox(height: 10,),
        
       Container(
             
        //    height: 700,
            child: Card(child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                 itemCount: controller.data.length,
                              separatorBuilder: (BuildContext context, int index) { 
                return const Divider();
                }, 
              itemBuilder: (
              BuildContext context, int index) { 
                return Container(
             
              //  color:controller.data[index]['users_id'].toString()==controller.myServices.sharedPreferences.getString('id')? AppColor.fspucolor2:null,

                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child:Row(children: [
                      index==0? 
                    SizedBox(
                     // height:  100,
                      child: Column(
                        children: [
                         Image.asset(AppImagesasset.croun,width: 30,),
                          
                         
                          ClipOval(
                            child: CachedNetworkImage(imageUrl: "${Applink.images}/${controller.data[index]['users_image']}",width: 50,height: 50,fit: BoxFit.cover,),
                          ),
                        ],
                      ),
                    ):  SizedBox(
                     
                      child: ClipOval(
                            child: CachedNetworkImage(imageUrl: "${Applink.images}/${controller.data[index]['users_image']}",width: 50,height: 50,fit: BoxFit.cover,),
                          ),
                    )
           /*   CircleAvatar
              (
                radius: 35,
            //    backgroundImage: CachedNetworkImage(imageUrl:"${Applink.images}/${controller.data[index]['users_image']}" ),

backgroundImage:NetworkImage("${Applink.images}/${controller.data[index]['users_image']}"),
              
                
              ),*/,
                const SizedBox(width: 15,),
                
              
                  Text("${controller.data[index]['users_name']}"),
                  const Spacer(),
                  Text("${controller.data[index]['total_points']} نقطة")
                ],),);
               },
       
             
              
            ),),)
            ,const
          SizedBox(height: 15,)
           
         ],),
     ),)
     ),
 
    
  )

 ;
  }

}


import 'package:flutter/material.dart';
import 'package:fspulast/core/class/handlingdataview.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/mvc/controller/cart_controller/points_controller.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:get/get.dart';

class BointView extends StatelessWidget{

  const BointView({super.key});

  @override
  Widget build(BuildContext context) {
    
   PointsControllerImp controller=   Get.put(PointsControllerImp());
 
   return  Scaffold(
     appBar: AppBar(
      
        centerTitle: true,
       backgroundColor: AppColor.fspucolor,
        title: Text("نظام النقاط",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:Colors.white),),
     ),
     body: Container(
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
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          const      Text("النقاط الكلية",style: TextStyle(fontSize: 23),),
             const   SizedBox(width: 20,),
             GetBuilder<PointsControllerImp>(builder: (controller)=>
             TweenAnimationBuilder(
                    tween: IntTween(begin: controller.oldpoints.value,end:controller.newpoints.value),
                     duration:const Duration(milliseconds: 5000), 
                     builder: (context,value,child){
                      return Text("$value",style: const TextStyle(fontSize: 30),);
                     }),
             )
              
              ],),
                     Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
             const   Text(" النقاط الشهرية",style: TextStyle(fontSize: 15),),
               const SizedBox(width: 20,),
                GetBuilder<PointsControllerImp>(builder: (controller)=>
              TweenAnimationBuilder(
                    tween: IntTween(begin: controller.oldpoints.value,end:controller.newpoints.value),
                     duration: const Duration(milliseconds: 5000), 
                     builder: (context,value,child){
                      return Text("$value",style: const TextStyle(fontSize: 15),);
                     })),
              ],),
              ],)
            ),


            
     ],),
     const SizedBox(height: 10,),
    Padding(
    padding: const EdgeInsets.all(5),
     child: InkWell(
      onTap:(){
        controller.remainingTime.value>Duration.zero?null
        :controller.handleButtonClick();
      
     
     controller.funpluspoints(5)  ;
      },
       child: Obx((){
        return Card (
        
         
           child: ListTile(
            title: const Text("اللهم صل على محمد وال محمد"),
            subtitle: controller.remainingTime.value > Duration.zero
                ? Text(
                    'انتظر ${controller.remainingTime.value.inHours} ساعة و ${controller.remainingTime.value.inMinutes % 60} دقيقة',
                  )
                : const Text(' اضغط هنا للحصول على النقاط'),
            trailing: const Text(
              "5 نقاط",style: TextStyle(color: AppColor.fspucolor),
            ),
           ),
         );
       })
     ),
   ),
       const Padding(
    padding: EdgeInsets.all(5),
        child: Card (
         child: ListTile(
          title: Text("نقاط الدخول للتطبق"),
          subtitle: Text("اضغط للحصول على النقاط"),
          trailing: Text(
            "3 نقاط",style: TextStyle(color: AppColor.fspucolor),
          ),
         ),
             ),
      ),
      Container(
        padding: const EdgeInsets.all(5),
       // margin: EdgeInsets.all(5),
        height: 200,

        child: Card(
child: Container(
  margin: const EdgeInsets.all(5),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const SizedBox(
      width: double.infinity,
      child: Text("الطرق الاخرى للحصول على نقاط",textAlign: TextAlign.center,)),
      const SizedBox(height: 10,),
     const Row(children: [SizedBox(width: 2,),
      Icon(Icons.looks_one),Text("تسجيل شخص ما عن طريق الايدي الخاص بك",style: TextStyle(fontSize: 12),),
     SizedBox(width: 4,),
     
     Text("25 نقطة",style: TextStyle(color: AppColor.fspucolor,))],),
      const SizedBox(height: 5,),
      const Row(children: [SizedBox(width: 2,),Icon(Icons.looks_two),Text("الحظور  في الحدث وادخال الكود :",style: TextStyle(fontSize: 12),),
     SizedBox(width: 4,),
     Text("40 نقطة",style: TextStyle(color: AppColor.fspucolor,))],),

     const SizedBox(height: 20,),
     SizedBox(
      width: double.infinity,
      child: Text("  الايدي الخاص بك هو : ${myservices.sharedPreferences.getString("id")}",textAlign: TextAlign.center,))
  
  ],),
),        
        ),)
     
         ,
const SizedBox(height: 20,),
const SizedBox(
  width: double.infinity,
  child: Text("المتصدرون",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),)
          ,const SizedBox(height: 10,),
          GetBuilder<PointsControllerImp>(builder:(controller)=>
     HandlingDataView(statusRequest: controller.statusRequest, widget:      Container(
           
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
              color:controller.data[index]['users_id'].toString()==controller.myServices.sharedPreferences.getString('id')? AppColor.fspucolor2:null,
                padding: const EdgeInsets.all(15),
                child:Row(children: [
                Text("${index+1}-"),
                Text("${controller.data[index]['users_name']}"),
                const Spacer(),
                Text("${controller.data[index]['users_points']} نقطة")
              ],),);
             },

           
            
          ),),))
          ),const
        SizedBox(height: 15,)
    
       ],),
     ),
 
    
  )

 ;
  }

}


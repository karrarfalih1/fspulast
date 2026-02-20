
import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/mvc/controller/cart_controller/suggestanactivity_controller.dart';
import 'package:get/get.dart';
class Suggestactivityview extends StatelessWidget {
  const Suggestactivityview({super.key});
  @override
      Widget build(BuildContext context) {
      SuggestanactivityController1Imp controller = Get.put(SuggestanactivityController1Imp());
      return Scaffold(
      bottomNavigationBar:  Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 85,
  
      child: InkWell(
            onTap: () {
                  if(controller.formstatesaggest.currentState!.validate()){
                   Get.back();
                  controller.addsuggestactivity();
                  }
                },
          child: const Card(
          color: AppColor.fspucolor,
          child: Center(child: Text("ارسال",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color:Colors.white),),),),
          ),
          ),
         appBar: AppBar(
         centerTitle: true,
         backgroundColor: AppColor.fspucolor,
         title: Text(
          "اقترح نشاط",
         style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Form(
        key:  controller.formstatesaggest,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Text("pushctivity( عنوناا النشاط)")
              
              /*
           Publishactivity(
            
            title: "عنوان النشاط",
            mycontroller:controller.activity_title, lengthtext: 50, ),
           Publishactivity(title: "نبذة عن النشاط", mycontroller:  controller.activity_disc, lengthtext: 250,),

         */   ],
          ),
        ),
      ),
    );
  }
}

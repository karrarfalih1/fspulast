
import 'package:flutter/material.dart';
import 'package:fspulast/core/class/handlingdataview.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:fspulast/mvc/view/widget/home/card_home.dart';
import 'package:fspulast/mvc/view/widget/home/cart_home.dart';
import 'package:fspulast/mvc/view/widget/home/silder_image_home.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
  

   
  

    HomeControllerImp controllerhome= Get.put(HomeControllerImp());

    return SafeArea(
      child: Scaffold(
        key:controllerhome.scaffoldkey ,
      
          drawer: const Drawer(

            child:Text("data")//DrowerCostam()
               ),
          body: GetBuilder<HomeControllerImp>(
              builder: (controller) =>
                   HandlingDataView(statusRequest:controller.statusRequest, widget:

                  SizedBox(
                    //  padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [
                       
                        const SilderImageHome(),
                     
                  const CartHome(),
                  SizedBox(height:  100,
                  child: controller.dataActivity.isEmpty?const Text("لا توجد بيانات"): CardHome(title: controller.dataActivity[0]["activity_title"], subtitle: controller.dataActivity[0]["activity_disc"], icons: Icons.date_range, trailtext: controller.dataActivity[0]["activity_date_create"]),)
              /*  SizedBox(height: 100,
                child:     GetBuilder<ActivityControllerImp>(builder:(controllerA)=>
                     HandlingDataView(statusRequest: controllerA.statusRequest, widget: CardHome(ontap: controller.gotoactivity, 
                       title: 'جدول الاعمال', subtitle: '${controllerA.fersttitle}', icons: Icons.date_range, trailtext: '${controllerA.datek}',),
                       )
                       ),),*//*
                       InkWell(
                       onTap: (){
                       Get.toNamed(Approute.roomView);
                       },
                       child:const CardHome(title: 'حجز القاعات ', subtitle: 'تتوفر قاعات  كبيرة للحجز', icons: Icons.domain
                     , trailtext: 'متوفر',)),*/
                  , Container(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    child: const Text("المواقع الرسمية",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColor.fspucolor),)),
       //  Webviewlist(),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: const Text("الاحصائيات",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: "Cairo"),
                              textDirection: TextDirection.rtl),
                        ),

                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                           
                          ),
                          child:  const Card(
                            child: Column(
                              children: [
                             
                               
                  
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))),
    ));
    //);
  }
}

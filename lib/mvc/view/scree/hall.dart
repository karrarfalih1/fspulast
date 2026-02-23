
import 'package:flutter/material.dart';
import 'package:fspulast/core/class/handlingdataview.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/mvc/controller/hall_controller.dart';
import 'package:fspulast/mvc/controller/map_controller.dart';
import 'package:fspulast/mvc/view/widget/general/titlerighit.dart';
import 'package:fspulast/mvc/view/widget/hall_widiget/description_hall_widget.dart';
import 'package:fspulast/mvc/view/widget/hall_widiget/gridview_hall_widget.dart';
import 'package:fspulast/mvc/view/widget/hall_widiget/image_hall_widget.dart';
import 'package:fspulast/mvc/view/widget/hall_widiget/prichat_widget.dart';
import 'package:get/get.dart';
class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(Object context) {
Get.put(HallControllerImp());
    MapControllerImp controllermap = Get.put(MapControllerImp());
    return SafeArea(child: Scaffold(
         appBar : AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: AppColor.fspucolor,
        title: Text("القاعة",)),

      body: GetBuilder<HallControllerImp>(builder:(controller)=>
    HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(
        children: [
          const  ImageHallWidget(),
          const Divider(),
          const PrichatWidget(),
          const Divider(
            endIndent: 150,
          ),
          InkWell(
            onTap: () {
            
              controllermap.showmap( double.parse(controller.data[0]['hall_latitude'].toString()), double.parse(controller.data[0]['hall_langtude'].toString())
          ,   controller.data[0]['hall_location'] );
            },
            child:  Card(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text("الموقع"),
                subtitle: Text("${controller.data.isNotEmpty?controller.data[0]['hall_location']:""}"),
                trailing: const Text(
                  "اظهر على الخريطة",
                  style:  TextStyle(color: AppColor.fspucolor),
                ),
              ),
            ),
          ),
                 InkWell(
            onTap: () {
             controller.makePhoneCall('${controller.data.isNotEmpty?controller.data[0]["hall_phone"]:""}');
           
            },
            child:  const Card(
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text("احجز الان"),
                subtitle:Text( "اضغط هنا للاتصال والحجز المباشر",style: TextStyle(fontSize: 13),),
                trailing:  Text(
                "07xxxxxxx",
                  style:TextStyle(color: AppColor.fspucolor),
                ),
              ),
            ),
          ),
          const Titlerighit(title: "المواصفات"),
          const GridviewHallWidget(),
          const Titlerighit(
            title: "الوصف ",
          ),
          const DescriptionHallWidget(),
        
   
    const SizedBox(height: 10,)
        ],
      ),))
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:fspulast/mvc/controller/hall_controller.dart';
import 'package:get/get.dart';

class DescriptionHallWidget extends StatelessWidget{

  const DescriptionHallWidget({super.key});
  @override
  Widget build(BuildContext context) {
   
   return GetBuilder<HallControllerImp>(builder: (controller)=>
       Card(
              child: Container(
            padding: const EdgeInsets.all(10),
            height: 150,
            child:  Text(
              "${controller.data.isNotEmpty? controller.data[0]['hall_description']:" "}",
              textAlign: TextAlign.start,
            ),
          )),);
  }

}
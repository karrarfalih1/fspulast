import 'package:flutter/material.dart';
import 'package:fspulast/mvc/controller/cart_controller/suggestanactivity_controller.dart';
import 'package:get/get.dart';

class Publishactivity extends GetView<SuggestanactivityControllerImp>{
  final String? title;
  final int lengthtext;
  final TextEditingController mycontroller;
  const Publishactivity({super.key,required this.title,required this.mycontroller,required this.lengthtext});
  @override
  Widget build(BuildContext context) {
    return    Card(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                     title!,
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        
                        maxLength: lengthtext,
                        validator: (val){
                          if(val==""){ 
                            return "هذا الحقل لا يمكن ان يكون فارغ";

                          }

                        },
                        controller:mycontroller
                        
                      )
                    ],
                  ),
                ),
              );
  }

}
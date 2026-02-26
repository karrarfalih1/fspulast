import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/mvc/controller/cart_controller/cart_contrller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CartHome extends GetView<CartContrllerImp>{
  const CartHome({super.key});

  @override
  Widget build(BuildContext context) {
    CartContrllerImp controller =Get.put(CartContrllerImp());
    return       SizedBox(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.datacart.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  
                                      decoration: BoxDecoration(
                                       //   color: AppColor.fspucolor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 10),
                                      height: 120,
                                      width: 80,
                                      child: InkWell(
                                        onTap: (){
                                                              
                                  controller.chosecart(index);
                                          
                                         
                                             
                                          
                                    
                                          
                                        },
                                       
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                    Container(
                                                      padding: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: AppColor.fspucolor),
                                                        borderRadius: BorderRadius.circular(20)
                                                      ),
                                                    child: Lottie.asset(
                                        
                                                    width: 60,
                                                    controller.datacart[index]['icon']),
                                                )
                                             //  Icon(controller.datacart[index]['icon'],color:Colors.white,),
                                             ,  Text("${controller.datacart[index]['title']}",style: const TextStyle(color: AppColor.fspucolor,fontSize: 13),)
                                                                               ],),
                                          ),
                                        
                                      ))
                                ;
                              }),
                        );
  }

}
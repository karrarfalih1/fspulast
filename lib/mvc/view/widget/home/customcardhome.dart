import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';

class Customcardhome extends StatelessWidget {
  final String titlecard;
   final String subtitlecard;
  const Customcardhome({super.key, required this.titlecard,required this.subtitlecard});
  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Stack(
              
              children: [
              
                Container(
              
                  decoration: BoxDecoration(
                      color: AppColor.maincolor,
                      borderRadius: BorderRadius.circular(20)),
                  height: 150,
                      child:  ListTile(
                   
                  title: Text(titlecard,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.bold),),
                   subtitle: Text(subtitlecard,style: const TextStyle(color: Colors.white,fontSize: 30),)
                ),
                ),
                  Positioned(
                    top: -20,
                    right: -40,
                    child: Container(

                      height: 160,
                      width: 160,
                    
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(160),
                      color: AppColor.maincolor2,),
                    ),
                  ),
              ],
            ),
          );
  }
}

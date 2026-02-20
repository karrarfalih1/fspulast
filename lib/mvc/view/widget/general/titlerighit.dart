import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';

class Titlerighit extends StatelessWidget{
  final String? title;
  const Titlerighit({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return     Container(
    padding: const EdgeInsets.symmetric( vertical: 7,horizontal: 15),
    child: Text(
    "${title}",style:const TextStyle(fontSize: 20,color: AppColor.fspucolor,fontWeight: FontWeight.bold)
  ),);
  }

}
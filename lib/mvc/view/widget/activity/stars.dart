
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:get/state_manager.dart';

class Stars extends GetView<HomeController> {
  final int point;
  const Stars({super.key,required this.point});
  @override
  Widget build(BuildContext context) {
   return  Container(
                          width: 70,
                        height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.maincolorm1.withAlpha(100),width: 2),
                     color: AppColor.fspucolor,
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15))

                      ),

                    
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                         SizedBox(
                        height: 30,
                        width: 30,
                         child: SvgPicture.asset(
                          
                                        colorFilter: ColorFilter.mode(AppColor.fspucolortwo, BlendMode.srcIn),
                                       AppImagesasset.star,),
                       ), 
                        Text("${point}",style: const TextStyle(fontSize: 16,color: AppColor.fspucolortwo,fontWeight: FontWeight.bold),),
                             ],),
                      );
  }

}
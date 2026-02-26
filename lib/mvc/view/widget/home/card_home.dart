import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:jiffy/jiffy.dart';

class CardHome extends StatelessWidget {
  final String title;
  
    final  IconData icons;
    final String trailtext;
  final void Function()? ontap;
  const CardHome({super.key, required this.title, this.ontap,  required this.icons, required this.trailtext});
  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap: ontap,
      child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                          //  height: 100,
                            child:  Card(

                              child: Column(
                            //    mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5,),
                                  Row(
                                        children: [
                                          SizedBox(width: 10,),
  Text(" الاحداث والفعاليات",style: TextStyle(fontWeight: FontWeight.bold,),),
  Spacer(),
  Text("عرض الكل",style: TextStyle(fontSize: 12),),
  SizedBox(width: 10,)

                       
                                  ],),
                                      ListTile(
      
                                trailing:
                                 Text(Jiffy.parse(trailtext).fromNow(),
                                 style: const TextStyle
                                 (color: AppColor.fspucolortwo,fontSize: 13),),
                             
                                subtitle: Text(
                                  title,
                                  style:const TextStyle(
                                      fontSize: 13,),
                                  textDirection: TextDirection.rtl,
                                ),
                                title:Container(
                                                 padding: const EdgeInsets.only(top: 9),
                                               child: Jiffy.parse(trailtext).isBefore(Jiffy.now())?Container(
                                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                               
                                                 child: Row(
                                                   children: [
                                                     Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                                      
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:BoxBorder.all(color: AppColor.fspucolor,width: 0.7)
                                                      ),
                                                      child: const Text("نشط الان",style: TextStyle(fontSize: 13,color: AppColor.fspucolor),)),
                                                   ],
                                                 )):
                                               Text("الحدث القادم",style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: AppColor.fspucolor)),
                                                )
                              
                            ,    leading:SizedBox(
                              width: 50,
                              height: 50,
                              child: SvgPicture.asset(
     colorFilter: ColorFilter.mode( AppColor.fspucolor, BlendMode.srcIn),
                      width: 35,
                      AppImagesasset.date)),
                              ),
                              ],)
                            ),
                          ),
    );
  }
}

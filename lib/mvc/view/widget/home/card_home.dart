import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';
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
                                 Text("    الاحداث والفعاليات",style: TextStyle(fontWeight: FontWeight.bold,),)
                           ,     ListTile(
      
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
                                               
                                                 child: const Text("نشط الان",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: AppColor.fspucolor),)):
                                               Text("الحدث القادم",style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: AppColor.fspucolor)),
                                                )
                                
                                /* Text(
                                 "الحدث القادم",
                                  style:const TextStyle(color: AppColor.fspucolor,
                                      fontSize: 20,),
                                  textDirection: TextDirection.rtl,
                                ),*/
                              //  focusColor: Colors.red,
                            ,    leading:Icon(icons),
                              ),
                              ],)
                            ),
                          ),
    );
  }
}

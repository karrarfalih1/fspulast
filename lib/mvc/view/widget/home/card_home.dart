import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';

class CardHome extends StatelessWidget {
  final String title;
    final String subtitle;
    final  IconData icons;
    final String trailtext;
  final void Function()? ontap;
  const CardHome({super.key, required this.title, this.ontap, required this.subtitle, required this.icons, required this.trailtext});
  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap: ontap,
      child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            height: 100,
                            child:  Card(
                              child: ListTile(
      
                                trailing:Text(trailtext,style: const TextStyle(color: AppColor.fspucolortwo,)),
                                subtitle: Text(
                                  subtitle,
                                  style:const TextStyle(
                                      fontSize: 13,),
                                  textDirection: TextDirection.rtl,
                                ),
                                title: Text(
                                 title,
                                  style:const TextStyle(color: AppColor.fspucolor,
                                      fontSize: 20,),
                                  textDirection: TextDirection.rtl,
                                ),
                              //  focusColor: Colors.red,
                                leading:Icon(icons),
                              ),
                            ),
                          ),
    );
  }
}

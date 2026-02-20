
import 'package:flutter/material.dart';
//الخاص باللغة الانكليزية 
ThemeData darkthem=
ThemeData(  brightness: Brightness.dark,
 
        //للتحكم في نوع الخط 9
        fontFamily: "Cairo",
        textTheme:const TextTheme(
          headlineSmall:   TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20), 
                        headlineMedium:   TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 28), 
      //    bodyMedium:TextStyle(
        //         height: 2, color: AppColor.grey, fontSize: 17),
        ),
      primarySwatch: Colors.blue
      
);

ThemeData  lightthem=
ThemeData(
  brightness: Brightness.light,
 
        //للتحكم في نوع الخط 9
        fontFamily: "Cairo",
        textTheme:const TextTheme(
          headlineSmall:   TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20), 
                        headlineMedium:   TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 28), 
      //    bodyMedium:TextStyle(
        //         height: 2, color: AppColor.grey, fontSize: 17),
        ),
      primarySwatch: Colors.blue
      
);
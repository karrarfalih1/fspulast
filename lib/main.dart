
import 'package:flutter/material.dart';
import 'package:fspulast/binding/initbinding.dart';
import 'package:fspulast/core/services/services.dart';
import 'package:fspulast/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main()async{
   WidgetsFlutterBinding.ensureInitialized();
  await initialServices(); 
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      

debugShowCheckedModeBanner: false,
 locale: const Locale("ar"),
     // locale: controllerlang.mylang,
   //   theme: controllerlang.appTheme,
      title: 'fspulast',   
      initialBinding: Initbindings(),  
   
    
     getPages: routes
      //من اجل اليزي بوت حتى لا اضطر لاستدعائها في كل صفحة 
     // initialBinding: MyBinding(),
    
    );
  }
}
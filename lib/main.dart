
import 'package:flutter/material.dart';
import 'package:fspulast/binding/initbinding.dart';
import 'package:fspulast/core/localization/changelocal.dart';
import 'package:fspulast/core/services/services.dart';
import 'package:fspulast/routes.dart';
import 'package:get/get.dart';
void main()async{
   WidgetsFlutterBinding.ensureInitialized();
  await initialServices(); 
  Get.put(LocaleController(),permanent: true);
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {

    return
    GetBuilder<LocaleController>(builder: (controllerlang)=>
    GetMaterialApp(
      

debugShowCheckedModeBanner: false,
// locale: const Locale("ar"),
      locale: controllerlang.mylang,
      theme: controllerlang.appTheme,
      title: 'fspulast',   
      initialBinding: Initbindings(),  
   
    
     getPages: routes
      //من اجل اليزي بوت حتى لا اضطر لاستدعائها في كل صفحة 
     // initialBinding: MyBinding(),
    
    )
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fspulast/core/class/handlingdataview.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:fspulast/linkapi.dart';
import 'package:fspulast/mvc/controller/cart_controller/support_controller.dart';
import 'package:fspulast/mvc/view/widget/general/titlerighit.dart';
import 'package:get/get.dart';
class Supportview extends StatelessWidget{
  const Supportview({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(SupportControllerImp());
   return DefaultTabController(
  
  
  length: 2,
  child: Scaffold(
        appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
        backgroundColor: AppColor.fspucolortwo,
        title: Text(
          "ادعمنا",
              style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ),
     body: GetBuilder<SupportControllerImp>(builder: (controller)=> 
     HandlingDataView(statusRequest: controller.statusRequest, widget: 
       ListView(children:[
      const SizedBox(height: 10,),
     Card(
       child: Container(
        margin:const EdgeInsets.all(10),
        width: double.infinity,
        child:const Center(child:
         Text("بسم الله الرحمن الرحيم\n مَّثَلُ الَّذِينَ يُنفِقُونَ أَمْوَالَهُمْ فِي سَبِيلِ اللَّهِ كَمَثَلِ حَبَّةٍ أَنبَتَتْ سَبْعَ سَنَابِلَ فِي كُلِّ سُنبُلَةٍ مِّائَةُ حَبَّةٍ ۗ وَاللَّهُ يُضَاعِفُ لِمَن يَشَاءُ ۗ وَاللَّهُ وَاسِعٌ عَلِيمٌ",
         textAlign: TextAlign.center,),),
        
       ),
     ),
     
  const Titlerighit(title: 'طرق التبرع المتاحة',),
  Card(
    child: ListTile(
      leading: Positioned(
        child: Container(
        padding:const EdgeInsets.all(3),
      width: 65,
      height: 100,
          child: Image.asset(
            AppImagesasset.supportRafedan ,
        fit: BoxFit.fill,
          ),
        ),
      ),
      title: const Text("مصرف الرافدين "),
       trailing:  SelectableText(
        controller.data.isNotEmpty?
        "${controller.data[0]['support_number']}":"",style: TextStyle(fontSize: 16),
       ),
      ),
  ),
  Card(
    child:Column(children: [
     ListTile(
      leading: Positioned(
        child: Container(
        padding:const EdgeInsets.all(3),
      width: 65,
      height: 100,
          child: Image.asset(
            AppImagesasset.supportZaincash ,
        fit: BoxFit.fill,
          ),
        ),
      ),
      title: const Text("زين كاش "),
       trailing:  SelectableText(
        controller.data.isNotEmpty?
        "${controller.data[1]['support_number']}":"",style:const TextStyle(fontSize: 16),
       ),
      ),
      Container(
        
        margin:const EdgeInsets.all(10),
        width: double.infinity,
        
        child:controller.data.isNotEmpty?
        CachedNetworkImage(imageUrl: '${Applink.images}/${controller.data[2]['support_number']}',):
      const  Text(""),
      )

    ],),
  )
     ],))
     ,)
     
  
  ),
)
   ;
  }

}
import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:fspulast/mvc/view/widget/general/titlerighit.dart';
import 'package:lottie/lottie.dart';
class LogoMeaning extends StatelessWidget {
  const LogoMeaning({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
        backgroundColor: AppColor.fspucolortwo,
        title: Text(
          "فلسفة الشعار ",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Container(
              child:
                  Hero(tag: "1", child: Image.asset(AppImagesasset.fspulogo1)),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Card(
                      child: Container(
                        width: 45,
                          margin: const EdgeInsets.all(4),
                          child:Lottie.asset(
                           
                            AppImagesasset.fire))),
                  const Icon(
                    Icons.add,
                    size: 20,color: AppColor.fspucolor,
                  ),      Card(
                      child: Container(
                        width: 45,
                          margin: const EdgeInsets.all(4),
                          child:Lottie.asset(
                           
                            AppImagesasset.book))),
                   const Icon(
                    Icons.add,
                    size: 20,color: AppColor.fspucolor,
                  ),
                  Card(
                      child: Container(
                        width: 45,
                          margin: const EdgeInsets.all(4),
                          child:Lottie.asset(
                           
                            AppImagesasset.circle))),
           
                          const Icon(
                    Icons.add,
                    size: 20,color: AppColor.fspucolor,
                  ),
               Card(
                      child: Container(
                        width: 45,
                          margin: const EdgeInsets.all(4),
                          child:Lottie.asset(
                           
                            AppImagesasset.hand1))),      
                ],
              ),
            ),
      Card(
      
        child: Container(
            padding: const EdgeInsets.all(5),
          child: const Column(children: [
              SizedBox(
              height: 10,
            ),
            Center(
              child: Text("بسم الله الرحمن الرحيم"),
            ),
            Center(
              child: Text(
                "وَاعْتَصِمُوا بِحَبْلِ اللَّهِ جَمِيعًا وَلَا تَفَرَّقُوا ۚ وَاذْكُرُوا نِعْمَتَ اللَّهِ عَلَيْكُمْ إِذْ كُنتُمْ أَعْدَاءً فَأَلَّفَ بَيْنَ قُلُوبِكُمْ فَأَصْبَحْتُم بِنِعْمَتِهِ إِخْوَانًا وَكُنتُمْ عَلَىٰ شَفَا حُفْرَةٍ مِّنَ النَّارِ فَأَنقَذَكُم مِّنْهَا ۗ كَذَٰلِكَ يُبَيِّنُ اللَّهُ لَكُمْ آيَاتِهِ لَعَلَّكُمْ تَهْتَدُونَ",
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text("صدق الله العلي العظيم"),
            ),
      ],),),),
     const Titlerighit(title: 'على ماذا تدل هذه العناصر؟',)
          
         ,  Card(child: Container(
        padding: const EdgeInsets.all(10),
        child:const Column(children: [
           Row(mainAxisAlignment:MainAxisAlignment.start,children: [
Icon(Icons.circle_outlined,color: AppColor.fspucolortwo,size: 30,),
Text("الحبل ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
          ],),
          Text("وهو مستوحى من الاية الكريمة اعلاه وله دلالة على حبل الله الذي يجب ان يعتصم به المؤمنون")
        ],),),)
         ,  Card(child: Container(
        padding: const EdgeInsets.all(10),
        child:const Column(children: [
           Row(mainAxisAlignment:MainAxisAlignment.start,children: [
Icon(Icons.back_hand_outlined,color: AppColor.fspucolortwo,size: 30,),
Text("الايادي ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
          ],),
          Text("وهي خمس ايايدي كما موضح في الشعار ولها دلالة على الخمسة تحت الكساء عليهم السلام  وهي تتمسك بحبل الله  ")
        ],),),),
         Card(child: Container(
        padding: const EdgeInsets.all(10),
        child:const Column(children: [
           Row(mainAxisAlignment:MainAxisAlignment.start,children: [
Icon(Icons.menu_book_sharp,color: AppColor.fspucolortwo,size: 30,),
Text("الكتب",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
          ],),
          Text("اثنا عشر كتاب   تحيط  بالايدي  والحبل  ولها دلالة على  ان امتداد العلم والمعرفة   لابد ان يكون عبر الاثناعشر المعصومين عليهم السلام")
        ],),),),
         Card(child: Container(
        padding: const EdgeInsets.all(10),
        child:const Column(children: [
           Row(mainAxisAlignment:MainAxisAlignment.start,children: [
Icon(Icons.local_fire_department_outlined,color: AppColor.fspucolortwo,size: 30,),
Text("النار",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
          ],),
          Text("نرى  في الشعار ان لكل كتاب  هناك شعلة من النار ولها دلالة على النور والمعرفة  التي  تصدح بها هذه الكتب الاثنا عشر ")
        ],),),),
       const SizedBox(height: 10,)
          ],
        ),
      ),
    ));
  }
}

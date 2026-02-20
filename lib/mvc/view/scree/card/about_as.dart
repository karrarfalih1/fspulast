import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/color.dart';
import 'package:get/get.dart';

class AboutAs extends StatelessWidget{
  const AboutAs({super.key});

  @override
  Widget build(BuildContext context) {
   
   return DefaultTabController(
  
  
  length: 2,
  child: Scaffold(
     appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: AppColor.fspucolor,
        title: Text("من نحن",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:Colors.white),),),
 body: SizedBox(
 // margin: EdgeInsets.all(15),
  child: ListView(
    children: [
      const SizedBox(height: 70,),
      SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
              const Text("من نحن",style: TextStyle(fontSize: 29),textAlign: TextAlign.start,)
       ,
            Container(
              width: 130,
              height: 2,

              color:  AppColor.fspucolor
          
          ),
           ],
        ),
      ),
      const SizedBox(height:30),
      SizedBox(
        height: 300,
    //width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            Container(
              
              width: 70,
              height: 2,

              color:  AppColor.fspucolor
          
          ),
              Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    border: Border.all(color:  AppColor.fspucolor2)


    ),
    padding:const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 40),
            width: 250,
                child: const Text("اتحاد شبابي مجتمعي يضم منظومة من التشكيلات الجامعية وغير الجامعية (الشعبية)، إضافة إلى التشكيلات الأكاديمية. يعمل هذا الاتحاد كحاضنة لإبداع الشباب وتمكينهم من بناء مستقبل مشرق قائم على القيم الأصيلة والمبادئ الرصينة. ",
                
                style: TextStyle(fontSize: 15
                ),textAlign: TextAlign.justify,),
              )
       ,
           ],
        ),
      ),
const SizedBox(height: 40,),
     const Opacity(opacity:0.1,

     child: Text("من نحن",style: TextStyle(fontSize: 60),textAlign: TextAlign.center,),),
 const  Divider(
        height: 200,
      indent: 60,
      endIndent: 60,
     ),
    Container(
   margin: EdgeInsets.only(right: Get.width/2),
      child: Container(
        height: 50,
       
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
          border: Border(
            
            top: BorderSide(color: AppColor.fspucolor),
            right: BorderSide(color: AppColor.fspucolor))
        ),
      
      ),
      
    ),
    
    Container(
      
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    border: Border.all(color:  AppColor.fspucolor2)


    ),
    padding:const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: const Text("""1. نهضة المجتمع: تعزيز روح المبادرة لدى الشباب وتمكينهم من لعب دور محوري في تطوير بيئتهم ومجتمعاتهم.
2. حماية الهوية: تسليط الضوء على الهوية الحقيقية للمجتمع(الهوية الإسلامية) ومواجهة الأفكار الدخيلة والمنحرفة.
3. تعزيز الثوابت: الحفاظ على القيم الراسخة وعناصر القوة في المجتمع، ورفض المحاولات التي تسعى إلى تمييع الهوية واستبدال القيم الأصيلة ببدائل دخيلة.
""",textAlign: TextAlign.justify,style: TextStyle(fontSize: 15),),),

const SizedBox(height: 40,),
     const Opacity(opacity:0.1,

     child: Text("اهدافنا",style: TextStyle(fontSize: 60),textAlign: TextAlign.center,),),
    
     const  Divider(
        height: 250,
      indent: 60,
      endIndent: 60,
     ),
   
     const Opacity(opacity:0.1,

     child: Text("رؤيتنا",style: TextStyle(fontSize: 60),textAlign: TextAlign.center,),),
     
const SizedBox(height: 100,),
       Container(
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
      border: Border.all(color:  AppColor.fspucolor2)

    ),
    padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: const Text("""نضع الإنسان في صلب رؤيتنا، ونسعى إلى تطوير مهاراته وتمكينه ليكون قائداً فاعلاً في مجتمعه. نؤمن بإعداد جيل يحمل القيم الأصيلة، ويمتلك المنطق الرصين والقدرة على قيادة المسار نحو تحقيق رؤية المجتمع المتكامل.
""",textAlign: TextAlign.justify,style: TextStyle(fontSize: 15),),),
    Container(
   margin: EdgeInsets.only(left: Get.width/2),
      child: Container(
        height: 50,
       
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          border: Border(
            bottom: BorderSide(color: AppColor.fspucolor),
            left: BorderSide(color: AppColor.fspucolor))
        ),
      
      ),
      
    ),
    
       const  Divider(
        height: 250,
      indent: 60,
      endIndent: 60,
     ),
     Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        
              Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    border: Border.all(color:  AppColor.fspucolor2)


    ),
    padding:const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 40),
            width: 250,
                child: const Text("""في الجامعات: من خلال هيئات طلابية متخصصة ومختلفة تسعى لتفعيل دور الطالب في الحياة الجامعية والمجتمعية.

في المجتمع: عبر تشكيلات أكاديمية وشعبية متنوعة تسهم في تعزيز الروابط المجتمعية وبناء شبكات تعاون مستدامة.
""",
                
                style: TextStyle(fontSize: 15
                ),textAlign: TextAlign.justify,),
              ),
                  
            Container(
              
              width: 70,
              height: 2,

              color:  AppColor.fspucolor
          
          ),
          
       
           ],
        ),
        const SizedBox(height: 120,),
     const Opacity(opacity:0.1,

     child: Text("كادرنا",style: TextStyle(fontSize: 60),textAlign: TextAlign.center,),),
const SizedBox(height: 30,)
    ],
  ),
 ),
    
  ),
)
   ;
  }

}
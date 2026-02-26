

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fspulast/core/class/handlingdataview.dart';
import 'package:fspulast/core/constant/routesname.dart';
import 'package:fspulast/linkapi.dart';
import 'package:fspulast/mvc/controller/web/web_controller.dart';
import 'package:get/get.dart';

class WebPage extends StatelessWidget {
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WebController());
    return Scaffold(

      appBar: AppBar(
        title: const Text("المواقع الرسمية"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<WebController>(builder:(controller)=>
        HandlingDataView(statusRequest: controller.statusRequest, widget: 
         GridView.builder(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 3, childAspectRatio: 0.7),
                    scrollDirection: Axis.vertical,
                    itemCount:controller.data.length ,
                    
                    itemBuilder:(context,index){
                      return   Card(
                      child: InkWell(
                        onTap: (){
                   
                        Get.toNamed(Approuts.webview,arguments: {"url":controller.data[index]['web_url']});
                          },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                 //   color: Colors.red,
                          width: 90,
                          child: Column(children: [
                            CachedNetworkImage(imageUrl: "${Applink.images}/${controller.data[index]['web_image']}",height: 80,),
                        
                   Text(
          controller.data[index]['web_name'] ?? '',
          textAlign: TextAlign.center,
          maxLines: 2, // 👈 عدد الأسطر
          overflow: TextOverflow.ellipsis, // 👈 النقاط (...)
          softWrap: true,
          style: const TextStyle(fontSize: 12),
        )
                          ],),
                        ),
                      ),
                    ) ;
                    },),
             )
         ),
      )
    );
  }
}
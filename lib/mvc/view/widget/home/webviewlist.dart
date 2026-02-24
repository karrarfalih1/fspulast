
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/routesname.dart';
import 'package:fspulast/linkapi.dart';
import 'package:fspulast/mvc/controller/home_controller.dart';
import 'package:get/get.dart';

class Webviewlist extends GetView<HomeControllerImp>{


  const Webviewlist({super.key});
  @override
  Widget build(BuildContext context) {
   return       SizedBox(
             //   color: Colors.amber,
                height: 150,width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:controller.dataweb.length ,
                  
                  itemBuilder:(context,index){
                    return   Card(
                    child: InkWell(
                      onTap: (){
                      //  controller.selet_webview=index;
                      Get.toNamed(Approuts.webview,arguments: {"url":controller.dataweb[index]['web_url']});
                        },
                      child: Container(
                        padding: const EdgeInsets.all(3),
               //   color: Colors.red,
                        width: 100,
                        child: Column(children: [
                          CachedNetworkImage(imageUrl: "${Applink.images}/${controller.dataweb[index]['web_image']}",height: 90,),
                      
                 Text(
  controller.dataweb[index]['web_name'] ?? '',
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
                  }),
                );
  }

}
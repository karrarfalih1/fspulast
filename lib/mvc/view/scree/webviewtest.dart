import 'package:flutter/material.dart';
import 'package:fspulast/core/constant/imagesasset.dart';
import 'package:fspulast/mvc/controller/webview_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class Webviewtest extends StatelessWidget {
  WebViewControllerImp controller = Get.put(WebViewControllerImp());

  Webviewtest({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //   backgroundColor: AppColor.fspucolortwo,
          title: SizedBox(
            height: 55,
            child: Image.asset(AppImagesasset.fspulogo1),
          ),
          centerTitle: true,
        ),

        body: WebViewWidget(controller: controller.webViewController),
      ),
    );
  }
}

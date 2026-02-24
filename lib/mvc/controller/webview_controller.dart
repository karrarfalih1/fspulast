import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

abstract class WebviewController extends GetxController {}

class WebViewControllerImp extends WebviewController {
  late final WebViewController webViewController;
  late final String urll;

  @override
  void onInit() {
    super.onInit();

   urll = Get.arguments['url'];

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
          
          },
        ),
      )
      ..loadRequest(Uri.parse(urll));
  }
}
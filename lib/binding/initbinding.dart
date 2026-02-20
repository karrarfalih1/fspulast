
import 'package:fspulast/core/class/crud.dart';
import 'package:get/get.dart';

class Initbindings extends Bindings {
  @override
  void dependencies() {
    //حتى ما اضطر بكل صفحة امرر ال crud
   Get.put(Crud());
  }

}
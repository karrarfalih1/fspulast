

import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class SliderData{
  Crud crud;

  SliderData(this.crud);

  getdata()async{
    var response=await crud.postData(Applink.slider, {});

  return response.fold((l)=>l,(r)=>r);
  }

}



import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class GetwiningData{
  Crud crud;

  GetwiningData(this.crud);

  getdata()async{
    var response=await crud.postData(Applink.getwining, {});

  return response.fold((l)=>l,(r)=>r);
  }

}
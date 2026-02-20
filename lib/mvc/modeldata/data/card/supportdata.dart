

import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class Supportdata{
  Crud crud;

  Supportdata(this.crud);

  getdata()async{
    var response=await crud.postData(Applink.support, {});
  return response.fold((l)=>l,(r)=>r);
  }

}
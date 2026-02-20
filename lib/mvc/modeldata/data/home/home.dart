

import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class Homedata{
  Crud crud;

  Homedata(this.crud);

  getdata()async{
    var response=await crud.postData(Applink.home, {
    
    });
  return response.fold((l)=>l,(r)=>r);
  }


}
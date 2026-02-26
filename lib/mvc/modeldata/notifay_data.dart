

import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class NotifayData {
  Crud crud;

  NotifayData(this.crud);

  getntefy(String usersid)async{
    var response=await crud.postData(Applink.notfy,{
      "usersid":usersid
    });

   return response.fold((l)=>l,(r)=>r);
  }
}
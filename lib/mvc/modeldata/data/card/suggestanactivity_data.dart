

import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class Suggestanactivitydata1{
  Crud crud;

  Suggestanactivitydata1(this.crud);

  getdata(usersid,title,subtitle)async{
    var response=await crud.postData(Applink.suggestanactivity, {
      "usersid":usersid,
      "title":title,
      "subtitle":subtitle
    });

  return response.fold((l)=>l,(r)=>r);
  }

}
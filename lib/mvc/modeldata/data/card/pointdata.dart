


import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class Pointdata{
  Crud crud;

  Pointdata(this.crud);

  getdata(userId)async{
    var response=await crud.postData(Applink.point, {
      "userid": userId
    });

  return response.fold((l)=>l,(r)=>r);
  }

}
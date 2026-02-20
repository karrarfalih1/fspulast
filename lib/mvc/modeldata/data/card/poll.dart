

import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class Polldata{
  Crud crud;

  Polldata(this.crud);

  getdata(usersid)async{
    var response=await crud.postData(Applink.pollview, {
      "users_id":usersid
    });
  return response.fold((l)=>l,(r)=>r);
  }

 slectpoll(polldataview_1,polldataview_2,polldataview_3,polldataview_4,usersid)async{
    var response=await crud.postData(Applink.slectpoll, {
    "users_id":usersid,
    "polldataview_1":polldataview_1,
    "polldataview_2":polldataview_2,
    "polldataview_3":polldataview_3,
    "polldataview_4":polldataview_4,

    });
  return response.fold((l)=>l,(r)=>r);
  }
}
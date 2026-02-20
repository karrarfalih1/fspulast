
import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class Points{
  Crud crud;
  Points(this.crud);

  plusPoints(usersId,points)async{
    var response=await crud.postData(Applink.pluspoints, {
      "users_id":usersId,
      "points":points,
    });
  return response.fold((l)=>l,(r)=>r);
  }
  getPoints(usersid)async{
    var response=await crud.postData(Applink.getpoints, {
      "usersid":usersid
    });
  return response.fold((l)=>l,(r)=>r);
  }
}






import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class Halldata {
  Crud crud;
  Halldata(this.crud);

  halldata()async{
    var response=await crud.postData(Applink.hallview, {});
    return response.fold((l)=>l, (r)=>r);
  }

}


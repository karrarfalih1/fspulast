





import 'package:fspulast/core/class/crud.dart';
import 'package:fspulast/linkapi.dart';

class Webdata {
  Crud crud;
  Webdata(this.crud);

  getData()async{
    var response=await crud.postData(Applink.web, {});
    return response.fold((l)=>l, (r)=>r);
  }

}


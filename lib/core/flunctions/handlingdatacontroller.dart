

import 'package:fspulast/core/class/statusRequest.dart';

handleingData(response){
///اذا كان احد حالات الستاتيس ريكويست سوف اقوم باجراء معين واذا كان  لي كلك ذهو ماب
  if(response is StatusRequest){
   
  return response;

  }else{
return StatusRequest.success;
  }
}
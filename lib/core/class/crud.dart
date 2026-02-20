//كلاس للربط بين الباك ايند والفرونت ايند 

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/flunctions/checkinernet.dart';
import 'package:http/http.dart' as http;
class Crud {


  Future<Either<StatusRequest,Map>> postData(String linkurl, Map data)async{

      //يتحقق اذا اكو اتصال بالانترنيت او لاي
    if(await checkInternet()){
      // ادخال لنك الصفحة الي اريد اوصل الها والبيانات 
      var response=await http.post(Uri.parse(linkurl),body: data);
      //اذا وجد الصفحة وتم الاتصال بنجاح
      if(response.statusCode==403){


          }
      if(response.statusCode==404){
             }
      if(response.statusCode==200|| response.statusCode==201){
            
        Map responsebody =jsonDecode(response.body);
       
        return Right(responsebody);

      }else if(response.statusCode==404){
        return const Left(StatusRequest.serverfailure);
      }else{
        print("0000000000000");
        print(response.body);
        
        return const Left(StatusRequest.none);
      }


    }else{
      return const Left(StatusRequest.offlinefailure);
}




  }
  }
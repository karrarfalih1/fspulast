import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:fspulast/core/class/statusRequest.dart';
import 'package:fspulast/core/flunctions/checkinernet.dart';
import 'package:http/http.dart' as http;

class Crud {

  Future<Either<StatusRequest, Map>> postData(
      String linkurl, Map data) async {

    if (await checkInternet()) {

      var response = await http.post(
        Uri.parse(linkurl),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {

        // 🔑 حماية من HTML
        if (response.body.startsWith('<')) {
          return const Left(StatusRequest.serverfailure);
        }

        Map responseBody = jsonDecode(response.body);
        return Right(responseBody);

      } else if (response.statusCode == 404) {
        return const Left(StatusRequest.serverfailure);

      } else if (response.statusCode == 403) {
        return const Left(StatusRequest.serverfailure);

      } else {
        return const Left(StatusRequest.none);
      }

    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
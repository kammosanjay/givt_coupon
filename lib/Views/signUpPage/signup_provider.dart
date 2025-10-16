import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:givt_mobile_app/constant/api_repository.dart';

class SignupProvider with ChangeNotifier {
  SignupProvider() {
    //
    userSignUP();
  }

  Dio dio = Dio();

  // userSignUP(Map<String,dynamic> userdata){

  //   final result=ApiRepository.signUPrepository();

  // }

  Future<void> userSignUP({String? email, String? pass}) async {
    final response = await dio.post(
      'https://reqres.in/api/register', // <-- Replace with your actual endpoint
      data: {'email': email, 'password': pass},
      options: Options(
        headers: {
          "Content-Type": "application/json",

          "x-api-key":
              "reqres-free-v1", // Example of another common header format
        },
      ),
    );
    print(response.data);
  }
}

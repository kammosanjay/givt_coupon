import 'package:dio/dio.dart';
import 'package:givt_mobile_app/constant/api_client.dart';

class ApiRepository {


  // Signup
  ///
  
  static Future<Response<dynamic>?> signUPrepository() async {
    final result = await ApiClient().postApi({});
    return result;
  }






















  
}

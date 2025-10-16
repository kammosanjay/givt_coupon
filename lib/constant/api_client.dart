import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:givt_mobile_app/constant/api_constant.dart';

class ApiClient {
  final Dio dio = Dio();

  Future<Response<dynamic>?> postApi(Map<String, dynamic> map) async {
    try {
      final response = await dio.post(
        ApiConstant.signup, // Use your actual API endpoint
        data: map, // Pass the input map here
        options: Options(
          headers: {
            "Content-Type": "application/json",

            // Change if your API needs different headers
          },
        ),
      );
      debugPrint('Post created successfully: ${response.data}');
      return response; // Always return the response
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
        return e.response; // Return the error response object if available
      } else {
        debugPrint('Error sending request: ${e.message}');
        return null; // Explicitly return null if no response is available
      }
    }
  }
}

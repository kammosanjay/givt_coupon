import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/loginpage/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:givt_mobile_app/Views/home/home.dart';
import 'package:givt_mobile_app/Views/loginpage/login_page.dart';
import 'package:provider/provider.dart';

class SplashProvider with ChangeNotifier {
  Future<void> initializeApp(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1600));
    // if (context.read<LoginProvider>().isLoggedIn()) {
    //   context.read<RouteProvider>().navigateTo('/home', context);
    // } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    // }

    notifyListeners();
  }
}

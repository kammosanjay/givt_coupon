import 'package:get/get.dart';
import 'package:baanda_mobile_app/Views/home/home.dart';
import 'package:baanda_mobile_app/Views/splash/splash_screen.dart';
import 'package:baanda_mobile_app/Views/themeColor.dart';

class MypageRoutes {
  static const String myPage = '/myPage';
  static const String mytheme = '/mytheme';
  static const String splash = '/splash';

  static List<GetPage> routes = [
    GetPage(name: myPage, page: () => MyHome(), transition: Transition.fadeIn),
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: mytheme,
      page: () => ThemePage(),
      transition: Transition.rightToLeft,
    ),
  ];
}

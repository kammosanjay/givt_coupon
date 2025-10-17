// import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/ProfilePage/profilepage.dart';
import 'package:givt_mobile_app/Views/home/banda_home_page.dart';
import 'package:givt_mobile_app/Views/home/coupon_homepage.dart';
import 'package:givt_mobile_app/Views/loginpage/login_provider.dart';
import 'package:givt_mobile_app/Views/todolist/inbox_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:givt_mobile_app/constant/constant_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:givt_mobile_app/Views/ReportsPage/report_page.dart';
import 'package:givt_mobile_app/Views/home/home_providers.dart';

import 'package:givt_mobile_app/Views/theme/theme_provider.dart';
import 'package:givt_mobile_app/Views/todolist/todo_list.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:givt_mobile_app/Views/language/language.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

// ignore: depend_on_referenced_packages

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var locationController = TextEditingController();
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    // MyMapLocation(),
    // BandaHomePage(),
    CouponHomepage(),
    InboxScreen(),
    Library(),
    AppSettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // update selected index
    });
  }

  // String? imagePath;

  Future<void> aboutUs() async {
    if (!await launchUrl(
      Uri.parse("https://buat.edu.in/about-university/"),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch URL');
    }
  }

  Future<void> privacyPolicy() async {
    if (!await launchUrl(
      Uri.parse("https://buat.edu.in/#"),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch URL');
    }
  }

  Future<void> termsAndcdtn() async {
    if (!await launchUrl(
      Uri.parse("https://buat.edu.in/#"),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch URL');
    }
  }

  Future<void> contactUs() async {
    if (!await launchUrl(
      Uri.parse("https://buat.edu.in/contact-us/"),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch URL');
    }
  }

  final List<String> imageList = [
    "assets/svgImages/menu.svg",
    "assets/svgImages/customer-service.svg",
    "assets/svgImages/leave.svg",
    "assets/svgImages/about.svg",
    "assets/svgImages/mode.svg",
    "assets/svgImages/policy.svg",
  ];
  List<String> menuTitles = ["Home", "Survey", "Wallet", "Settings", "Logout"];
  final Map<String, String> menuRoutes = {
    'Home': 'Id Card',
    'Survey': 'Academic',
    'wallet': 'Grievence',
    'Settings': 'Holiday Calendar',

    'Logout': 'Logout',
    // add more here...
  };

  List<String> drawerIcons = [
    'assets/svgImages/notification.svg',
    'assets/svgImages/academics.svg',
    'assets/svgImages/grievence.svg',
    'assets/svgImages/holiday.svg',

    'assets/svgImages/LogOut.svg',
  ];

  Widget drawerLitTile({
    required String title,
    required String icon,
    VoidCallback? ontap,
  }) {
    final isDarkEnabled = Theme.brightnessOf(context) == Brightness.dark;
    return Container(
      color: isDarkEnabled ? Colors.white : MyColors.secondaryColor,
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: MyColors.bodyTextColor,
          ),
        ),
        trailing: SvgPicture.asset(icon, color: MyColors.textColor),
        tileColor: AppColor.backgroundColor(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onTap: ontap, // ✅ use the callback correctly
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    final isDarkEnabled = Theme.brightnessOf(context) == Brightness.dark;

    print("build");
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: _selectedIndex.isFinite
              ? MyColors.primaryColor
              : Colors.black, // This shows all 5 items
          unselectedItemColor: Color(0xFF333333),
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedLabelStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              tooltip: "Home",

              icon: Image.asset(
                'assets/images/homeIcon.png',
                height: 20,
                width: 20,
                color: _selectedIndex == 0
                    ? MyColors.primaryColor
                    : Colors.black45,
              ),

              label: appLoc.home,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/surveyIcon.png',
                height: 20,
                width: 20,
                color: _selectedIndex == 1
                    ? MyColors.primaryColor
                    : Colors.black45,
              ),
              label: appLoc.survey,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/walletIcon.png',
                height: 20,
                width: 20,
                color: _selectedIndex == 2
                    ? MyColors.primaryColor
                    : Colors.black45,
              ),
              label: appLoc.wallet,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/settingIcon.png',
                height: 20,
                width: 20,
                color: _selectedIndex == 3
                    ? MyColors.primaryColor
                    : Colors.black45,
              ),
              label: appLoc.settings,
            ),
          ],
        ),

        // drawer: SafeArea(
        //   child: Consumer<ThemeProvider>(
        //     builder: (context, themeProvider, child) {
        //       return Drawer(
        //         shape: RoundedRectangleBorder(
        //           side: BorderSide(
        //             color: isDarkEnabled ? Colors.white : Colors.transparent,
        //           ),
        //           borderRadius: BorderRadius.circular(5),
        //         ),
        //         backgroundColor: isDarkEnabled ? Colors.black : Colors.white,
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             children: [
        //               Expanded(
        //                 flex: 3,
        //                 child: Container(
        //                   padding: const EdgeInsets.all(16),
        //                   width: double.infinity,
        //                   height: 180, // adjust height as you want
        //                   decoration: BoxDecoration(
        //                     color: AppColor.primaryColor(context),
        //                   ),
        //                   child: Stack(
        //                     children: [
        //                       // Profile Image
        //                       Positioned(
        //                         left: 20,
        //                         right: 20,
        //                         top: 0,
        //                         bottom: 50,
        //                         child: CircleAvatar(
        //                           radius: 40,
        //                           // backgroundColor: Theme.of(
        //                           //   context,
        //                           // ).colorScheme.primary,
        //                           child: Consumer<HomeProviders>(
        //                             builder: (ctx, value, child) {
        //                               final imagePath = value.image?.path;
        //                               return imagePath != null
        //                                   ? ClipRRect(
        //                                       borderRadius:
        //                                           BorderRadius.circular(50),
        //                                       child: Image.file(
        //                                         File(imagePath),
        //                                         fit: BoxFit.cover,
        //                                         height: 110,
        //                                         width: 110,
        //                                       ),
        //                                     )
        //                                   : Icon(
        //                                       Icons.person,
        //                                       size: 50,
        //                                       color:
        //                                           Theme.of(
        //                                                 context,
        //                                               ).brightness ==
        //                                               Brightness.dark
        //                                           ? Colors.white
        //                                           : MyColors.textColor,
        //                                     );
        //                             },
        //                           ),
        //                         ),
        //                       ),

        //                       // Camera button
        //                       Positioned(
        //                         left: 70,
        //                         right: -20,
        //                         bottom: 60,
        //                         child: GestureDetector(
        //                           onTap: () {
        //                             showDialog(
        //                               context: context,
        //                               builder: (context) {
        //                                 return AlertDialog(
        //                                   title: const Text("Select Image"),
        //                                   content: Column(
        //                                     mainAxisSize: MainAxisSize.min,
        //                                     children: [
        //                                       ListTile(
        //                                         leading: Icon(
        //                                           Icons.camera_alt,
        //                                           color:
        //                                               Theme.of(
        //                                                     context,
        //                                                   ).brightness ==
        //                                                   Brightness.dark
        //                                               ? MyColors.backgroundColor
        //                                               : MyColors.secondaryColor,
        //                                         ),
        //                                         title: const Text("Gallery"),
        //                                         onTap: () {
        //                                           context
        //                                               .read<HomeProviders>()
        //                                               .pickImage();
        //                                           Navigator.pop(context);
        //                                         },
        //                                       ),
        //                                       ListTile(
        //                                         leading: const Icon(
        //                                           Icons.photo_library,
        //                                         ),
        //                                         title: const Text("Camera"),
        //                                         onTap: () {
        //                                           context
        //                                               .read<HomeProviders>()
        //                                               .pickImageFromCamera();
        //                                           Navigator.pop(context);
        //                                         },
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 );
        //                               },
        //                             );
        //                           },
        //                           child: SvgPicture.asset(
        //                             'assets/svgImages/camera.svg',
        //                             height: 20,
        //                             width: 20,
        //                             color:
        //                                 Theme.of(context).brightness ==
        //                                     Brightness.dark
        //                                 ? MyColors.backgroundColor
        //                                 : MyColors.textColor,
        //                           ),
        //                         ),
        //                       ),

        //                       // Welcome Text
        //                       Positioned(
        //                         left: 60,
        //                         top:
        //                             MediaQuery.of(context).size.height *
        //                             0.16, // 20% of screen height
        //                         child: Text(
        //                           appLoc.welcome,
        //                           style: GoogleFonts.poppins(
        //                             fontSize: 15.8,
        //                             fontWeight: FontWeight.w600,
        //                             color:
        //                                 Theme.of(context).brightness ==
        //                                     Brightness.dark
        //                                 ? Colors.white
        //                                 : MyColors.textColor,
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //               Expanded(
        //                 flex: 8,
        //                 child: ListView.builder(
        //                   shrinkWrap: true,
        //                   padding: const EdgeInsets.all(8),
        //                   itemCount: menuTitles.length,
        //                   itemBuilder: (context, index) {
        //                     return Padding(
        //                       padding: const EdgeInsets.symmetric(
        //                         vertical: 2.0,
        //                       ),
        //                       child: drawerLitTile(
        //                         title: menuTitles[index],
        //                         icon: drawerIcons[index],
        //                         ontap: () {
        //                           final title = menuTitles[index];
        //                           final route = menuRoutes[title];

        //                           if (title == "Logout") {
        //                             // 🔥 check title instead of route
        //                             Navigator.pop(context);

        //                             showDialog(
        //                               context: context,
        //                               builder: (context) => Dialog(
        //                                 backgroundColor: Colors
        //                                     .transparent, // So the gradient is visible
        //                                 child: Container(
        //                                   decoration: BoxDecoration(
        //                                     borderRadius: BorderRadius.circular(
        //                                       10,
        //                                     ),
        //                                     color:
        //                                         Theme.of(context).brightness ==
        //                                             Brightness.dark
        //                                         ? Colors.red
        //                                         : MyColors.secondaryColor,
        //                                     boxShadow: [
        //                                       BoxShadow(
        //                                         color: MyColors.backgroundColor,
        //                                         // color: Colors. grey,
        //                                         offset: Offset(-10, -10),
        //                                         blurRadius: 30,

        //                                         inset: false,
        //                                       ),
        //                                       BoxShadow(
        //                                         color: MyColors.textColor,
        //                                         offset: Offset(10, 10),
        //                                         blurRadius: 30,

        //                                         inset: true,
        //                                       ),
        //                                     ],
        //                                   ),
        //                                   child: Padding(
        //                                     padding: const EdgeInsets.all(16.0),
        //                                     child: Column(
        //                                       mainAxisSize: MainAxisSize.min,
        //                                       children: [
        //                                         Text(
        //                                           "Confirm Logout",
        //                                           style: GoogleFonts.inter(
        //                                             fontSize: 20,
        //                                             fontWeight: FontWeight.w900,
        //                                             color:
        //                                                 Theme.of(
        //                                                       context,
        //                                                     ).brightness ==
        //                                                     Brightness.dark
        //                                                 ? Colors.white
        //                                                 : MyColors.textColor,
        //                                           ),
        //                                         ),
        //                                         const SizedBox(height: 16),
        //                                         Text(
        //                                           "Are you sure you want to logout?",
        //                                           style: GoogleFonts.inter(
        //                                             fontSize: 15,
        //                                             fontWeight: FontWeight.w900,
        //                                             color:
        //                                                 Theme.of(
        //                                                       context,
        //                                                     ).brightness ==
        //                                                     Brightness.dark
        //                                                 ? Colors.white
        //                                                 : MyColors.textColor,
        //                                           ),
        //                                           textAlign: TextAlign.center,
        //                                         ),
        //                                         const SizedBox(height: 24),
        //                                         Row(
        //                                           mainAxisAlignment:
        //                                               MainAxisAlignment
        //                                                   .spaceEvenly,
        //                                           children: [
        //                                             TextButton(
        //                                               onPressed: () =>
        //                                                   Navigator.pop(
        //                                                     context,
        //                                                   ),
        //                                               child: Text(
        //                                                 "Cancel",
        //                                                 style: GoogleFonts.inter(
        //                                                   fontSize: 14,
        //                                                   fontWeight:
        //                                                       FontWeight.w900,
        //                                                   color:
        //                                                       Theme.of(
        //                                                             context,
        //                                                           ).brightness ==
        //                                                           Brightness
        //                                                               .dark
        //                                                       ? Colors.white
        //                                                       : MyColors
        //                                                             .textColor,
        //                                                 ),
        //                                               ),
        //                                             ),
        //                                             TextButton(
        //                                               onPressed: () {
        //                                                 Navigator.pop(context);
        //                                                 // context
        //                                                 //     .read<
        //                                                 //       LoginProvider
        //                                                 //     >()
        //                                                 //     .logout();
        //                                                 context
        //                                                     .read<
        //                                                       RouteProvider
        //                                                     >()
        //                                                     .navigateReplace(
        //                                                       '/loginpage',
        //                                                       context,
        //                                                     );
        //                                               },
        //                                               child: Text(
        //                                                 "Logout",
        //                                                 style: GoogleFonts.inter(
        //                                                   fontSize: 14,
        //                                                   fontWeight:
        //                                                       FontWeight.w900,
        //                                                   color:
        //                                                       Theme.of(
        //                                                             context,
        //                                                           ).brightness ==
        //                                                           Brightness
        //                                                               .dark
        //                                                       ? Colors.white
        //                                                       : MyColors
        //                                                             .textColor,
        //                                                 ),
        //                                               ),
        //                                             ),
        //                                           ],
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                             );
        //                           } else if (route != null) {
        //                             context.read<RouteProvider>().navigateTo(
        //                               route,
        //                               context,
        //                               arguments: route,
        //                             );
        //                           }
        //                         },
        //                       ),
        //                     );
        //                   },
        //                 ),
        //               ),

        //               // create dark and night mode toggle
        //               Expanded(
        //                 flex: 1,
        //                 child: Padding(
        //                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text(
        //                         'Night Mode',
        //                         style: GoogleFonts.inter(
        //                           fontSize: 14,
        //                           fontWeight: FontWeight.w500,
        //                           color:
        //                               Theme.of(context).brightness ==
        //                                   Brightness.dark
        //                               ? Colors.white
        //                               : MyColors.textColor,
        //                         ),
        //                       ),
        //                       Switch(
        //                         value:
        //                             themeProvider.themeMode == ThemeMode.dark,
        //                         onChanged: (value) {
        //                           themeProvider.setThemeMode(
        //                             value ? ThemeMode.dark : ThemeMode.light,
        //                           );
        //                         },
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
        appBar: AppBar(
          // backgroundColor:Colors.grey.shade100,
          title: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return Container(
                height: 40,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                    hintText: appLoc.search,
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                  ),
                ),
              );
            },
          ),
          leading: Image.asset("assets/images/couponlogo.png"),

          centerTitle: true,
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 10.0),
          //     child: GestureDetector(
          //       onTap: () {
          //         showDialog(
          //           context: context,
          //           builder: (context) {
          //             return AlertDialog(
          //               backgroundColor: isDarkEnabled
          //                   ? Colors.white
          //                   : MyColors.secondaryColor,
          //               title: Text(
          //                 "Language",
          //                 style: GoogleFonts.inter(
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w900,
          //                   color: MyColors.bodyTextColor,
          //                 ),
          //               ),
          //               content: DropdownButton<String>(
          //                 alignment: Alignment(0, 10),
          //                 autofocus: true,
          //                 dropdownColor: isDarkEnabled
          //                     ? Colors.white
          //                     : MyColors.secondaryColor,
          //                 icon: Icon(
          //                   Icons.language_outlined,
          //                   color: MyColors.primaryColor,
          //                 ),

          //                 menuWidth: 120.0,
          //                 borderRadius: BorderRadius.all(Radius.circular(10)),
          //                 value: context
          //                     .watch<Language>()
          //                     .selectectLocale
          //                     .languageCode,
          //                 items: Language.languages
          //                     .map(
          //                       (e) => DropdownMenuItem<String>(
          //                         value: e['locale'],
          //                         child: Text(
          //                           e['name'],
          //                           style: GoogleFonts.inter(
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.w600,
          //                             color: MyColors.bodyTextColor,
          //                           ),
          //                         ),
          //                       ),
          //                     )
          //                     .toList(),
          //                 onChanged: (value) {
          //                   if (value != null) {
          //                     context.read<Language>().changeLanguage(value);
          //                     print(value);
          //                     Navigator.pop(context);
          //                   }
          //                 },
          //               ),
          //               actions: [
          //                 TextButton(
          //                   onPressed: () => Navigator.pop(context),
          //                   child: Text(
          //                     "Close",
          //                     style: GoogleFonts.inter(
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w600,
          //                       color: MyColors.primaryColor,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             );
          //           },
          //         );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           // color: Colors.white,
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.grey.shade100,
          //               blurRadius: 10,
          //               // spreadRadius: 5,
          //               offset: Offset(10, 5),
          //             ),
          //           ],
          //         ),
          //         child: SvgPicture.asset(
          //           'assets/svgImages/lang.svg',
          //           height: 20,
          //           width: 20,
          //           color: Theme.of(context).brightness == Brightness.dark
          //               ? Colors.white
          //               : MyColors.textColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // ],
     
     
     
     
        ),

        body: _pages[_selectedIndex],
      ),
    );
  }
}

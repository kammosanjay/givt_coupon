// import 'package:flutter/material.dart';
import 'dart:io';
import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/ProfilePage/profilepage.dart';
import 'package:baanda_mobile_app/Views/home/banda_home_page.dart';
import 'package:baanda_mobile_app/Views/loginpage/login_provider.dart';
import 'package:baanda_mobile_app/Views/todolist/inbox_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:baanda_mobile_app/Views/ReportsPage/report_page.dart';
import 'package:baanda_mobile_app/Views/home/home_providers.dart';
import 'package:baanda_mobile_app/Views/home/map_with_bottomsheet.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/Views/todolist/todo_list.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    BandaHomePage(),
    InboxScreen(),
    Library(),
    Profilepage(),
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
  List<String> menuTitles = [
    "Notification",
    "Academics",
    "Grievance",
    "Holiday Calendar",
    "News",
    "Places",
    "Publications",
    "BUAT Forms",
    "Emergency Contact",
    "Update Contact Number",
    "Update Email",
    // "My Profile",
    "Refresh",
    "Logout",
  ];
  final Map<String, String> menuRoutes = {
    'Notification': 'Id Card',
    'Academics': 'Academic',
    'Grievance': 'Grievence',
    'Holiday Calendar': 'Holiday Calendar',
    'News': 'News',
    'Places': 'Places',
    'Publications': 'Publications',
    'BUAT Forms': 'BUAT Forms',
    'Emergency Contact': 'Emergency Contact',
    'Update Contact Number': 'Update Phone Number',
    'Update Email': 'Update Email',
    // 'My Profile': 'profile',
    'Refresh': 'Sports',
    'Logout': 'Logout',
    // add more here...
  };

  List<String> drawerIcons = [
    'assets/svgImages/notification.svg',
    'assets/svgImages/academics.svg',
    'assets/svgImages/grievence.svg',
    'assets/svgImages/holiday.svg',
    'assets/svgImages/news.svg',
    'assets/svgImages/places.svg',
    'assets/svgImages/publication.svg',
    'assets/svgImages/buatForms.svg',
    'assets/svgImages/emerCont.svg',
    'assets/svgImages/updateCont.svg',
    'assets/svgImages/updateEmail.svg',
    // 'assets/svgImages/myprofile.svg',
    'assets/svgImages/refresh.svg',
    'assets/svgImages/LogOut.svg',
  ];
  Widget drawerLitTile({
    required String title,
    required String icon,
    VoidCallback? ontap,
  }) {
    return ListTile(
      title: Row(
        spacing: 40,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(icon, color: AppColor.headingColor(context)),
          Text(
            title,
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.textColor(context),
            ),
          ),
        ],
      ),
      tileColor: AppColor.backgroundColor(context),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onTap: ontap, // ✅ use the callback correctly
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    print("build");
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _selectedIndex.isFinite
            ? Colors.white
            : Colors.black, // This shows all 5 items
        unselectedItemColor: Color(0xFF333333),
        selectedFontSize: 12,
        unselectedFontSize: 10,
        selectedLabelStyle: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            tooltip: "Home",

            icon: SvgPicture.asset(
              'assets/svgImages/home.svg',
              height: 20,
              width: 20,
              color: _selectedIndex == 0 ? Colors.white : Colors.black45,
            ),

            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgImages/inbox.svg',
              height: 20,
              width: 20,
              color: _selectedIndex == 1 ? Colors.white : Colors.black45,
            ),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgImages/library.svg',
              height: 20,
              width: 20,
              color: _selectedIndex == 2 ? Colors.white : Colors.black45,
            ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgImages/profile.svg',
              height: 20,
              width: 20,
              color: _selectedIndex == 3 ? Colors.white : Colors.black45,
            ),
            label: 'Profile',
          ),
        ],
      ),
      drawer: SafeArea(
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Drawer(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: AppColor.primaryColor(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        height: 180, // adjust height as you want
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: Stack(
                          children: [
                            // Profile Image
                            Positioned(
                              left: 20,
                              right: 20,
                              top: 0,
                              bottom: 50,
                              child: CircleAvatar(
                                radius: 40,
                                // backgroundColor: Theme.of(
                                //   context,
                                // ).colorScheme.primary,
                                child: Consumer<HomeProviders>(
                                  builder: (ctx, value, child) {
                                    final imagePath = value.image?.path;
                                    return imagePath != null
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                            child: Image.file(
                                              File(imagePath),
                                              fit: BoxFit.cover,
                                              height: 110,
                                              width: 110,
                                            ),
                                          )
                                        : Icon(
                                            Icons.person,
                                            size: 50,
                                            color: Colors.grey,
                                          );
                                  },
                                ),
                              ),
                            ),

                            // Camera button
                            Positioned(
                              left: 70,
                              right: -20,
                              bottom: 60,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Select Image"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              leading: const Icon(
                                                Icons.camera_alt,
                                              ),
                                              title: const Text("Gallery"),
                                              onTap: () {
                                                context
                                                    .read<HomeProviders>()
                                                    .pickImage();
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                Icons.photo_library,
                                              ),
                                              title: const Text("Camera"),
                                              onTap: () {
                                                context
                                                    .read<HomeProviders>()
                                                    .pickImageFromCamera();
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/svgImages/camera.svg',
                                  height: 20,
                                  width: 20,
                                  color: AppColor.headingColor(context),
                                ),
                              ),
                            ),

                            // Welcome Text
                            Positioned(
                              left: 0,
                              top:
                                  MediaQuery.of(context).size.height *
                                  0.16, // 20% of screen height
                              child: Text(
                                appLoc.welcome,
                                style: GoogleFonts.poppins(
                                  fontSize: 15.8,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.textColor(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: menuTitles.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: drawerLitTile(
                              title: menuTitles[index],
                              icon: drawerIcons[index],
                              ontap: () {
                                final title = menuTitles[index];
                                final route = menuRoutes[title];

                                if (title == "Logout") {
                                  // 🔥 check title instead of route
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Confirm Logout"),
                                        content: Text(
                                          "Are you sure you want to logout?",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // perform logout logic here
                                              Navigator.pop(context);
                                              context
                                                  .read<LoginProvider>()
                                                  .logout();

                                              context
                                                  .read<RouteProvider>()
                                                  .navigateReplace(
                                                    '/loginpage',
                                                    context,
                                                  );
                                            },
                                            child: Text("Logout"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else if (route != null) {
                                  context.read<RouteProvider>().navigateTo(
                                    route,
                                    context,
                                    arguments: route,
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      appBar: PreferredSize(
        preferredSize: Size.square(50),
        child: AppBar(
          // backgroundColor:Colors.grey.shade100,
          title: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return Text(
                appLoc.welcome,
                // style: GoogleFonts.poppins(
                //   textStyle: Theme.of(context).textTheme.bodyLarge,

                // ),
              );
            },
          ),
          leading: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    // decoration: BoxDecoration(border:BoxBorder.all(color: Colors.grey)),
                    margin: const EdgeInsets.only(top: 10),

                    child: GFCarousel(
                      autoPlay: true,

                      autoPlayInterval: Duration(seconds: 2),
                      // autoPlayAnimationDuration: Duration(milliseconds: 1600),
                      items: imageList.map((url) {
                        return ClipRRect(
                          child: SvgPicture.asset(
                            url,
                            fit: BoxFit.contain,
                            height: 20,
                            width: 20,
                            color: AppColor.headingColor(context),
                          ),
                        );
                      }).toList(),
                      onPageChanged: (index) {
                        // setState(() {
                        //   index;
                        // });
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: AppColor.primaryColor(context),
                        title: const Text("Language"),
                        content: DropdownButton<String>(
                          alignment: Alignment(0, 10),
                          autofocus: true,
                          dropdownColor: AppColor.primaryColor(context),
                          icon: Icon(Icons.language_outlined),
                          menuWidth: 110.0,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          value: context
                              .watch<Language>()
                              .selectectLocale
                              .languageCode,
                          items: Language.languages
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e['locale'],
                                  child: Text(e['name']),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              context.read<Language>().changeLanguage(value);
                              print(value);
                              Navigator.pop(context);
                            }
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurRadius: 10,
                        // spreadRadius: 5,
                        offset: Offset(10, 5),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    'assets/svgImages/lang.svg',
                    height: 20,
                    width: 20,
                    color: AppColor.headingColor(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: _pages[_selectedIndex],
    );
  }
}

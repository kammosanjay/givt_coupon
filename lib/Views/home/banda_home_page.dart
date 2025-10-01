import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';

import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BandaHomePage extends StatefulWidget {
  @override
  _BandaHomePageState createState() => _BandaHomePageState();
}

class _BandaHomePageState extends State<BandaHomePage> {
  int selectedIndex = 0;

  List<String> drawerMenuItems = [
    'Kul-geet',
    'Id Card',
    '2024-2025 Students',
    'Academic',
    // 'Library',
    'Places',
    'News',
    'Publications',
    'Bharat kala Bhavan',
    'BUAT Forms',
    'Holiday Calendar',
    'NEP courses',
    'Faculty Search',
    'Emergency Contact',
    'Grievence',
    'Update Phone Number',
    'Update Email',
  ];

  // final List<Widget> contentViews = [
  //   Container(height: double.infinity, color: Colors.red),
  //   Idcard(),
  //   Students(),
  //   AcademicProgramScreen(),
  //   Library(),
  //   NotificationScreen(),
  //   AdministrationScreen(),
  //   Publications(),
  //   BharaKalaBhavan(),
  //   BuatForms(),
  //   HolidayCalendar(),
  //   NEPCourses(),
  //   FacultySearch(),
  //   EmergencyContact(),
  //   Grievence(),
  //   Updatephone(),
  //   UpdateEmail(),
  // ];

  final List<String> imageList = [
    'assets/svgImages/homescreenSvg/0.svg',
    'assets/svgImages/homescreenSvg/1.svg',
    'assets/svgImages/homescreenSvg/1.svg',
    'assets/svgImages/homescreenSvg/3.svg',
    // 'assets/svgImages/homescreenSvg/4.svg',
    'assets/svgImages/homescreenSvg/5.svg',
    'assets/svgImages/homescreenSvg/6.svg',
    'assets/svgImages/homescreenSvg/7.svg',
    'assets/svgImages/homescreenSvg/8.svg',
    'assets/svgImages/homescreenSvg/9.svg',
    'assets/svgImages/homescreenSvg/10.svg',
    'assets/svgImages/homescreenSvg/10.svg',
    'assets/svgImages/homescreenSvg/12.svg',
    'assets/svgImages/homescreenSvg/13.svg',
    'assets/svgImages/homescreenSvg/13.svg',
    'assets/svgImages/homescreenSvg/15.svg',
    'assets/svgImages/homescreenSvg/16.svg',
  ];
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      // backgroundColor: Color(0xFFe7f3ff),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GridView.builder(
            itemCount: drawerMenuItems.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 3,
              mainAxisExtent: 128,
              // childAspectRatio: 16/9,
            ),
            itemBuilder: (context, index) {
              var isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  var route = drawerMenuItems[index];
                  context.read<RouteProvider>().navigateTo(
                    route,
                    context,
                    arguments: route,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color(0xFFE8E9F4),
                    //     // color: Colors. grey,
                    //     offset: Offset(-10, -10),
                    //     blurRadius: 30,

                    //     inset: false,
                    //   ),
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(10, 10),
                    //     blurRadius: 30,

                    //     inset: true,
                    //   ),
                    // ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          imageList[index],
                          height: 24,
                          color: isSelected ? Colors.amber : Color(0xFF333333).withOpacity(0.4),
                        ),
                        Text(
                          drawerMenuItems[index],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Colors.amber
                                : Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

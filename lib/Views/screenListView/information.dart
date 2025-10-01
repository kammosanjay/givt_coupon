import 'dart:convert';

import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HolidayCalendar extends StatefulWidget {
  const HolidayCalendar({super.key});

  @override
  State<HolidayCalendar> createState() => _HolidayCalendarState();
}

class _HolidayCalendarState extends State<HolidayCalendar> {
  //
  final List<String> miscItems = [
    'RTI',
    'Circulars And Notices',
    'Announcements',
    'Newsletters',
    'Recent Events & Achievements',
    'Job openings',
    'Reservation Roster',
    'Study in India',
    'Admission Procedure And Facilities',
  ];
  final List<IconData> infoIcons = [
    Icons.policy, // RTI
    Icons.campaign, // Circulars And Notices
    Icons.announcement, // Announcements
    Icons.article, // Newsletters
    Icons.emoji_events, // Recent Events & Achievements
    Icons.work_outline, // Job openings
    Icons.list_alt, // Reservation Roster
    Icons.public, // Study in India
    Icons.school, // Admission Procedure And Facilities
  ];

  //
  final List<String> miscRoutes = [
    '/rti',
    '/circulars-notices',
    '/announcements',
    '/newsletters',
    '/recent-events-achievements',
    '/job-openings',
    '/reservation-roster',
    '/study-in-india',
    '/admission-procedure-facilities',
  ];
  final List<String> imageList = [
    "assets/svgImages/menu.svg",
    "assets/svgImages/customer-service.svg",
    "assets/svgImages/leave.svg",
    "assets/svgImages/about.svg",
    "assets/svgImages/mode.svg",
    "assets/svgImages/policy.svg",
  ];
  Future<List<Map<String, dynamic>>> fetchHoliday({
    required String apiKey,
    required String country,
    int? year,
    int? month,
    int? day,
  }) async {
    final uri = Uri.https('holidays.abstractapi.com', '/v1/', {
      'api_key': apiKey,
      'country': country,
      if (year != null) 'year': year.toString(),
      if (month != null) 'month': month.toString(),
      if (day != null) 'day': day.toString(),
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      print(jsonList);
      return jsonList.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to fetch holidays: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.primaryColor(context),
        title: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Text(
              ModalRoute.of(context)!.settings.arguments.toString(),
              // style: GoogleFonts.poppins(
              //   textStyle: Theme.of(context).textTheme.bodyLarge,

              // ),
            );
          },
        ),
        // leading: Builder(
        //   builder: (context) {
        //     return GestureDetector(
        //       onTap: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       child: Container(
        //         margin: const EdgeInsets.only(top: 10),

        //         child: GFCarousel(
        //           autoPlay: true,

        //           autoPlayInterval: Duration(seconds: 2),
        //           // autoPlayAnimationDuration: Duration(milliseconds: 1600),
        //           items: imageList.map((url) {
        //             return ClipRRect(
        //               child: SvgPicture.asset(
        //                 url,
        //                 fit: BoxFit.contain,
        //                 height: 20,
        //                 width: 20,
        //                 color: AppColor.headingColor(context),
        //               ),
        //             );
        //           }).toList(),
        //           onPageChanged: (index) {
        //             // setState(() {
        //             //   index;
        //             // });
        //           },
        //         ),
        //       ),
        //     );
        //   },
        // ),
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

      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchHoliday(
          apiKey: '545d77e5b5124010ba4861409ee86c78',
          country: 'IN',
          year: 2025,
          month: 09,
          day: 04,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No holidays found.'));
          }

          final holidays = snapshot.data!;
          return ListView.builder(
            itemCount: holidays.length,
            itemBuilder: (context, index) {
              final holiday = holidays[index];
              return ListTile(
                title: Text(holiday['name'] ?? 'Unknown'),
                subtitle: Text(holiday['date'] ?? ''),
              );
            },
          );
        },
      ),

      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: SizedBox(
      //     height: double.infinity,
      //     width: double.infinity,
      //     child: GridView.builder(
      //       shrinkWrap: true,
      //       physics:
      //           NeverScrollableScrollPhysics(), // allow embedding in scroll view
      //       itemCount: miscItems.length,
      //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 3, // ✅ 3 items in one row
      //         crossAxisSpacing: 10,
      //         mainAxisSpacing: 10,
      //         childAspectRatio: 1, // adjust for text layout
      //       ),
      //       itemBuilder: (context, index) {
      //         return GestureDetector(
      //           onTap: () {
      //             final route = miscRoutes[index];
      //             context.read<RouteProvider>().navigateTo(route, context);
      //           },
      //           child: Container(
      //             decoration: BoxDecoration(
      //               border: Border.all(width: 1, color: Colors.grey.shade400),
      //               borderRadius: BorderRadius.circular(16),
      //               color: Colors.white,
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(5.0),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(infoIcons[index], color: Colors.grey.shade900),
      //                   Text(
      //                     miscItems[index],
      //                     textAlign: TextAlign.center,
      //                     style: GoogleFonts.openSans(
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.w400,
      //                       color: Colors.grey.shade900,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}

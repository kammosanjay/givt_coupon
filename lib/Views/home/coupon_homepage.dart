import 'dart:math';

import 'package:flutter_svg/svg.dart';
import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/home/viewall.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/constant/constant_widget.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:faker/faker.dart';

class CouponHomepage extends StatefulWidget {
  const CouponHomepage({super.key});

  @override
  State<CouponHomepage> createState() => _CouponHomepageState();
}

class _CouponHomepageState extends State<CouponHomepage> {
  int selectedIndex = 0;
  List<String> drawerMenuItems = [
    'All',
    'Thankyou',
    'Celebration',
    'Friday',

    // 'Library',
  ];
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

  Widget listOfContainers(int? number) {
    if (number! > 4) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Celebration",
                style: GoogleFonts.lora(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: MyColors.textColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<RouteProvider>().navigateTo(
                    '/viewall',
                    context,
                    arguments: 'Celebration',
                  );
                },
                child: Text("ViewAll ${number.toString()}"),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 200,
                    child: Text(index.toString()),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Celebration",
                style: GoogleFonts.lora(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: MyColors.textColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<RouteProvider>().navigateTo(
                    '/viewall',
                    context,
                    arguments: 'Celebration',
                  );
                },
                child: Text("ViewAll"),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: number,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 200,
                    child: Text(index.toString()),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final random = RandomGenerator(seed: 63833423);
    final faker = Faker.withGenerator(random);
    print(faker.animal.name());

    final appLoc = AppLocalizations.of(context)!;
    double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: drawerMenuItems.length,
                  shrinkWrap: true,

                  scrollDirection: Axis.horizontal,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: MyColors.backgroundColor,
                                // color: Colors. grey,
                                offset: Offset(-10, -10),
                                blurRadius: 30,

                                inset: false,
                              ),
                              BoxShadow(
                                color: MyColors.textColor,
                                offset: Offset(10, 10),
                                blurRadius: 30,

                                inset: true,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                drawerMenuItems[index],
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: GoogleFonts.lora(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: isSelected
                                      ? Colors.amber
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomWidgets.gap_10,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //     Text(
              //       "Celebration",
              //       style: GoogleFonts.lora(
              //         fontSize: 14,
              //         fontWeight: FontWeight.w900,
              //         color: MyColors.textColor,
              //       ),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         context.read<RouteProvider>().navigateTo(
              //           '/viewall',
              //           context,
              //           arguments: 'Celebration',
              //         );
              //       },
              //       child: Text("ViewAll"),
              //     ),
              //   ],
              // ),

              // SizedBox(
              //   height: 120,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 10,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           decoration: BoxDecoration(
              //             color: MyColors.secondaryColor,
              //             borderRadius: BorderRadius.circular(20),
              //           ),
              //           width: 200,
              //           child: Text(index.toString()),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              listOfContainers(5),
              CustomWidgets.gap_10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thankyou',
                    style: GoogleFonts.lora(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: MyColors.textColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<RouteProvider>().navigateTo(
                        '/viewall',
                        context,
                        arguments: 'Thankyou',
                      );
                    },
                    child: Text("ViewAll"),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.secondaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 250,
                        child: Text(index.toString()),
                      ),
                    );
                  },
                ),
              ),
              CustomWidgets.gap_10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Appreciation',
                    style: GoogleFonts.lora(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: MyColors.textColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<RouteProvider>().navigateTo(
                        '/viewall',
                        context,
                        arguments: 'Appreciation',
                      );
                    },
                    child: Text("ViewAll"),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.secondaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 250,
                        child: Text(index.toString()),
                      ),
                    );
                  },
                ),
              ),
              CustomWidgets.gap_10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Birthday',
                    style: GoogleFonts.lora(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: MyColors.textColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<RouteProvider>().navigateTo(
                        '/viewall',
                        context,
                        arguments: 'Birthday',
                      );
                    },
                    child: Text("ViewAll"),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.secondaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 250,
                        child: Text(index.toString()),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

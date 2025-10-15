import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:faker/faker.dart' hide Image;

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
    'Birthday',
    'Festivals',

    // 'Library',
  ];
  final List<String> imageList = [
    'assets/images/Group 149.png',
    'assets/images/Group 150.png',
    'assets/images/Group 152.png',
    'assets/images/Group 153.png',
    'assets/images/Group 155.png',
    'assets/images/Group 156.png',
    'assets/images/Group 12.png',
    'assets/images/Rectangle 32.png',
    'assets/images/Rectangle 33.png',
  ];
  final List<String> imageList2 = [
    'assets/images/c1.png',
    'assets/images/c2.png',
    'assets/images/c3.png',
    'assets/images/c4.png',
    'assets/images/c5.png',
    'assets/images/c6.png',
    'assets/images/c7.png',
  ];

  Widget listOfContainers(List<String>? myImages) {
    final isDarkEnabled = Theme.brightnessOf(context) == Brightness.dark;
    if (myImages!.length > 4) {
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
                  fontWeight: FontWeight.w600,
                  color: isDarkEnabled ? Colors.white : MyColors.bodyTextColor,
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
                child: Text(
                  "ViewAll ${myImages.length.toString()}",
                  style: GoogleFonts.lora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDarkEnabled
                        ? Colors.white
                        : MyColors.bodyTextColor,
                  ),
                ),
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
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // width: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.asset(myImages[index], fit: BoxFit.fill),
                    ),
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
                  fontWeight: FontWeight.w600,
                  color: isDarkEnabled ? Colors.white : MyColors.bodyTextColor,
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
                child: Text(
                  "ViewAll",
                  style: GoogleFonts.lora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDarkEnabled
                        ? Colors.white
                        : MyColors.bodyTextColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: myImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.asset(myImages[index], fit: BoxFit.fill)),
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
  
   

    final appLoc = AppLocalizations.of(context)!;
    double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24);
    final isDarkEnabled = Theme.brightnessOf(context) == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                listOfContainers(imageList2),
                CustomWidgets.gap_10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thankyou',
                      style: GoogleFonts.lora(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDarkEnabled
                            ? Colors.white
                            : MyColors.bodyTextColor,
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
                      child: Text(
                        "ViewAll",
                        style: GoogleFonts.lora(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isDarkEnabled
                              ? Colors.white
                              : MyColors.bodyTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Image.asset(
                          imageList[index],
                          fit: BoxFit.cover, // Adjust fit as needed
                          // Adjust height as needed
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error);
                          },
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
                        fontWeight: FontWeight.w600,
                        color: isDarkEnabled
                            ? Colors.white
                            : MyColors.bodyTextColor,
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
                      child: Text(
                        "ViewAll",
                        style: GoogleFonts.lora(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isDarkEnabled
                              ? Colors.white
                              : MyColors.bodyTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageList2.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.secondaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // width: 250,
                          child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(10),
                            child: Image.asset(
                              imageList2[index],
                              fit: BoxFit.fill,
                            ),
                          ),
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
                        fontWeight: FontWeight.w600,
                        color: isDarkEnabled
                            ? Colors.white
                            : MyColors.bodyTextColor,
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
                      child: Text(
                        "ViewAll",
                        style: GoogleFonts.lora(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isDarkEnabled
                              ? Colors.white
                              : MyColors.bodyTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Image.asset(
                          imageList[index],
                          fit: BoxFit.cover, // Adjust fit as needed
                          // Adjust height as needed
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

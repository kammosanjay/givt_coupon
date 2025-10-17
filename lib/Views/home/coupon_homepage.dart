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
import 'package:unicons/unicons.dart';

class CouponHomepage extends StatefulWidget {
  CouponHomepage({super.key});

  @override
  State<CouponHomepage> createState() => _CouponHomepageState();
}

class _CouponHomepageState extends State<CouponHomepage> {
  int selectedIndex = 0;
  final List<String> categories = [
    "All",
    "Clothing",
    "Shoes",
    "Beauty & Cosmetics",
    "Electronics",
    "Groceries & Supermarket items",
    "Food & Beverages",
    "Home Appliances",
    "Accessories",
    "Furniture",
    "Health Supplements & Vitamins",
    "Fitness & Sports Equipment",
    "Gaming products",
    "Mobile Accessories",
    "Perfumes & Fragrances",
    "Baby Supplies",
    "Pet Supplies & Grooming",
    "Travel & Hotels",
    "Books & Stationery",
    "Home Décor",
    "Subscription Boxes & Gift Cards",
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

  Widget voucherContainer(BuildContext context) {
    double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24);
    double itemWidth = MediaQuery.of(context).size.width;
    return Container(
      width: itemWidth * 0.5,
      height: itemHeight * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Stack(
        children: [
          // Top-left (Logo & Text)
          Positioned(
            left: 10,
            top: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Replace with your logo asset. Example: Image.asset('assets/othaim_logo.png', width: 36, height: 36)
                Icon(Icons.eco, color: Colors.green, size: 36), // placeholder
                SizedBox(height: 1),
                Text(
                  "Othaim",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Top-right (%) icon
          Positioned(
            right: 12,
            top: 10,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  "%",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          // Bottom-left T&C icon
          Positioned(
            left: 10,
            bottom: 2,
            child: Icon(
              Icons.article,
              size: 28,
              color: Colors.black,
            ), // placeholder for T&C
          ),

          // Bottom-right: 50% OFF
          Positioned(
            right: 5,
            bottom: 5,
            child: CustomPaint(
              size: Size(80, 50), // width, height for the triangle area
              painter: RightTrianglePainter(),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 15,
            child: CustomPaint(
              size: Size(80, 50), // width, height for the triangle area
              child: Text(
                "50%",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: CustomPaint(
              size: Size(80, 50), // width, height for the triangle area
              child: Text(
                "OFF",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
                style: GoogleFonts.inter(
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
                  style: GoogleFonts.inter(
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
                  child: voucherContainer(context),
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
                style: GoogleFonts.inter(
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
                  style: GoogleFonts.inter(
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
                  child: voucherContainer(context),
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
                    itemCount: categories.length,
                    shrinkWrap: true,

                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          var route = categories[index];
                          context.read<RouteProvider>().navigateTo(
                            route,
                            context,
                            arguments: route,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected ? Colors.grey : Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: isSelected
                                  ? Colors.black
                                  : Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Center(
                                child: Text(
                                  categories[index],
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w600,
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

                listOfContainers(imageList2),
                CustomWidgets.gap_10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thankyou',
                      style: GoogleFonts.inter(
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
                        style: GoogleFonts.inter(
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
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: voucherContainer(context)
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
                      style: GoogleFonts.inter(
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
                        style: GoogleFonts.inter(
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
                        child: voucherContainer(context)
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
                      style: GoogleFonts.inter(
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
                        style: GoogleFonts.inter(
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
                        child: voucherContainer(context)
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

class RightTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height) // bottom-left
      ..lineTo(size.width, size.height) // bottom-right
      ..lineTo(size.width, 0) // top-right
      ..close(); // connect back to start

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

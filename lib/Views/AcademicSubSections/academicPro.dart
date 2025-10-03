import 'dart:io';

import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/home/home_providers.dart';
import 'package:givt_mobile_app/Views/language/language.dart';
import 'package:givt_mobile_app/Views/theme/theme_provider.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/constant/constant_widget.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AcademicProgramScreen extends StatefulWidget {
  const AcademicProgramScreen({super.key});

  @override
  State<AcademicProgramScreen> createState() => _AcademicProgramScreenState();
}

class _AcademicProgramScreenState extends State<AcademicProgramScreen> {
  List<String> list = ['Institutes', 'Departments', 'Faculty'];
  final List<String> imageList = [
    'assets/svgImages/homescreenSvg/3.svg',
    'assets/svgImages/homescreenSvg/5.svg',
    'assets/svgImages/homescreenSvg/1.svg',
  ];
  List<String> icons = [];
  //
  List<String> acadlist = ['Undergraduate', 'Postgraduate', 'Diploma', 'PhD'];

  //
  TextEditingController programC = TextEditingController();
  TextEditingController titleC = TextEditingController();
  String? searchedText;
  bool isSelected = false;
  int selectedIndex = 0;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // backgroundColor: Color(0xFFe7f3ff),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // allow embedding in scroll view
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                mainAxisExtent: 85,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    final route = list[index];
                    context.read<RouteProvider>().navigateTo(
                      route,
                      context,
                      arguments: route,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            imageList[index],
                            height: 24,
                            color: isSelected
                                ? Colors.amber
                                : Color(0xFF333333),
                          ),
                          Text(
                            list[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              spacing: 2,
              children: [
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      height: 50,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: selectedIndex == 0 ? Colors.amber : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Undergraduate",
                          style: GoogleFonts.openSans(
                            fontSize: 13,
                            color: AppColor.textColor(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: selectedIndex == 1 ? Colors.amber : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Postgraduate",
                          style: GoogleFonts.openSans(
                            fontSize: 13,
                            color: AppColor.textColor(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: selectedIndex == 2 ? Colors.amber : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Diploma",
                          style: GoogleFonts.openSans(
                            fontSize: 13,
                            color: AppColor.textColor(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: selectedIndex == 3 ? Colors.amber : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "PhD",
                          style: GoogleFonts.openSans(
                            fontSize: 13,
                            color: AppColor.textColor(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              spacing: 20,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      flex: 8,
                      child: CustomWidgets.customTextFeild(
                        context: context,
                        controller: programC,
                        hintColor: Colors.grey.shade600,
                        borderRad: 6,
                        hint: 'Program Name',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          minimumSize: WidgetStateProperty.all(
                            const Size(60, 62),
                          ),
                          maximumSize: WidgetStateProperty.all(
                            const Size(60, 62),
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        icon: const Icon(
                          Icons.search,
                          size: 22,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      flex: 8,
                      child: CustomWidgets.customTextFeild(
                        context: context,
                        controller: titleC,

                        hintColor: Colors.grey.shade600,
                        borderRad: 6,
                        hint: 'Course Title',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          minimumSize: WidgetStateProperty.all(
                            const Size(60, 62),
                          ),
                          maximumSize: WidgetStateProperty.all(
                            const Size(60, 62),
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        icon: const Icon(
                          Icons.search,
                          size: 22,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomWidgets.customButton(
              context: context,
              btnColor: Colors.amber,
              height: 60,
              fontSize: 20,
              radius: 6,
              fontWeight: FontWeight.w600,
              buttonName: "Clear",
            ),
          ],
        ),
      ),
    );
  }
}

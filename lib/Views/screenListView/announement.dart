import 'dart:convert';

import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/constant/constant_widget.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Places extends StatefulWidget {
  const Places({super.key});

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  String? selectedValue;
  final List<String> imageList = [
    "assets/svgImages/menu.svg",
    "assets/svgImages/customer-service.svg",
    "assets/svgImages/leave.svg",
    "assets/svgImages/about.svg",
    "assets/svgImages/mode.svg",
    "assets/svgImages/policy.svg",
  ];
  List<String> allCategory = [
    "Academic",
    "Auditorium",
    "Bank",
    "Eatery",
    "Gate",
    "Guest House",
    "Hostel",
    "Hospital",
    "Office",
    "Other",
    "Residential",
    "Sports",
    "Temple",
  ];
  final TextEditingController searchC = TextEditingController();
  @override
  void initState() {
    super.initState();
    getDepartments();
  }

  List<Map<String, dynamic>> placesList = [];
  List<Map<String, dynamic>> serachedPlaceList = [];
  //
  getDepartments() async {
    final String response = await rootBundle.loadString(
      'assets/json/places.json',
    );

    final List<dynamic> data = jsonDecode(response);

    setState(() {
      placesList = List<Map<String, dynamic>>.from(data);
      serachedPlaceList = placesList.toList(); // show all initially
    });

    return placesList;
  }

  launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
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

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: CustomWidgets.customTextFeild(
                    context: context,
                    height: 10,
                    controller: searchC,
                    icon: Icon(Icons.search),
                    borderRad: 6,
                    hint: "Search here...",
                    hintColor: Colors.grey.shade400,
                    onChanges: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          serachedPlaceList = placesList.toList();
                        } else {
                          serachedPlaceList = placesList.where((place) {
                            final name = place["name"].toString().toLowerCase();
                            final type = place["type"].toString().toLowerCase();
                            return name.contains(value.toLowerCase()) ||
                                type.contains(value.toLowerCase());
                          }).toList();
                        }
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: CustomWidgets.customDropdownField(
                    context: context,

                    // label: 'Notifications',
                    fontSize: 12,
                    hint: 'All Category',
                    width: 137,
                    items: allCategory,
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),

                    selectedItem: selectedValue?.isEmpty ?? true
                        ? null
                        : selectedValue, // can be null initially
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value; // update state when changed
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: serachedPlaceList.length,
              itemBuilder: (context, index) {
                final place = serachedPlaceList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      launchURL('https://www.google.com/maps');
                    },
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(width: 1, color: Colors.grey.shade400),
                      ),
                      child: ListTile(
                        title: Text(place["name"]),
                        subtitle: Text(
                          place["type"],
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor(context),
                          ),
                        ),
                        trailing: Text(
                          place["campus"],
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

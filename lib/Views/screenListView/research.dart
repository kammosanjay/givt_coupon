import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/language/language.dart';
import 'package:givt_mobile_app/Views/theme/theme_provider.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/constant/constant_widget.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Publications extends StatefulWidget {
  const Publications({super.key});

  @override
  State<Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  //
  final List<String> researchItems = [
    'Research And Development Cell',
    'Incubation Centre/ Start-ups / Entrepreneurship Cell',
    'Central facilities',
  ];
  //
  final List<String> researchRoutes = [
    '/research-development-cell',
    '/incubation-entrepreneurship-cell',
    '/central-facilities',
  ];
  final List<String> imageList = [
    "assets/svgImages/menu.svg",
    "assets/svgImages/customer-service.svg",
    "assets/svgImages/leave.svg",
    "assets/svgImages/about.svg",
    "assets/svgImages/mode.svg",
    "assets/svgImages/policy.svg",
  ];
  final List<IconData> researchIcons = [
    Icons.science, // Research And Development Cell
    Icons.lightbulb, // Incubation Centre / Start-ups / Entrepreneurship Cell
    Icons.business, // Central facilities
  ];

  String? selectedCategory;
  String? selectedHouse;
  String? selectedNames;
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomWidgets.customTextFeild(
              context: context,
              height: 10,
              icon: Icon(Icons.search),
              hint: "Search Places...",
              hintColor: Colors.grey.shade400,
            ),
            SizedBox(height: 10),
            Row(
              spacing: 5,
              children: [
                Expanded(
                  flex: 5,
                  child: CustomWidgets.customDropdownField(
                    context: context,

                    // label: 'Notifications',
                    fontSize: 12,
                    hint: 'All Category',
                    width: 137,
                    items: ["a", 'b', 'c'],
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),

                    selectedItem: selectedCategory?.isEmpty ?? true
                        ? null
                        : selectedCategory, // can be null initially
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value; // update state when changed
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: CustomWidgets.customDropdownField(
                    context: context,

                    // label: 'Notifications',
                    fontSize: 12,
                    hint: 'All House',
                    width: 137,
                    items: ["a", 'b', 'c'],
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),

                    selectedItem: selectedHouse?.isEmpty ?? true
                        ? null
                        : selectedHouse, // can be null initially
                    onChanged: (value) {
                      setState(() {
                        selectedHouse = value; // update state when changed
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: CustomWidgets.customDropdownField(
                    context: context,

                    // label: 'Notifications',
                    fontSize: 12,
                    hint: 'All Names',
                    width: 137,
                    items: ["a", 'b', 'c'],
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),

                    selectedItem: selectedNames?.isEmpty ?? true
                        ? null
                        : selectedNames, // can be null initially
                    onChanged: (value) {
                      setState(() {
                        selectedNames = value; // update state when changed
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(6),
                      side: BorderSide(width: 1, color: Colors.grey.shade400),
                    ),
                    child: ListTile(
                      title: Text("29-08-2025"),
                      subtitle: Text(
                        "Hello this is the news about the event that has been intialized by the adimin. ",
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333333),
                        ),
                      ),
                      trailing: Text(
                        "Magzines",
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

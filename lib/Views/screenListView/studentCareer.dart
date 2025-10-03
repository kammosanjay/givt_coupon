import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/language/language.dart';
import 'package:givt_mobile_app/Views/theme/theme_provider.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BharaKalaBhavan extends StatefulWidget {
  const BharaKalaBhavan({super.key});

  @override
  State<BharaKalaBhavan> createState() => _BharaKalaBhavanState();
}

class _BharaKalaBhavanState extends State<BharaKalaBhavan> {
  //
  final List<String> studentItems = [
    'Sports facilities',
    'NCC',
    'NSS',
    'Hostel',
    'Placement Cell',
    'Student Grievance Redressal Committee',
    'Health Facilities',
    'Internal Complaint Committee',
    'Anti-Ragging Cell',
    'Equal Opportunity Cell',
    'Socio-Economically Disadvantaged Groups Cell',
  ];
  List<String> imageList = [
    "https://buat.edu.in/wp-content/uploads/2025/07/WhatsApp-Image-2025-07-07-at-2.49.11-PM.jpeg",
    "https://buat.edu.in/wp-content/uploads/2023/02/DSC_7909-min-scaled.jpg",
    "https://buat.edu.in/wp-content/uploads/2025/07/DSC_7891.jpg",
  ];
  //
  final List<String> studentRoutes = [
    '/sports-facilities',
    '/ncc',
    '/nss',
    '/hostel',
    '/placement-cell',
    '/grievance-redressal-committee',
    '/health-facilities',
    '/internal-complaint-committee',
    '/anti-ragging-cell',
    '/equal-opportunity-cell',
    '/disadvantaged-groups-cell',
  ];
  final List<IconData> studentIcons = [
    Icons.sports_soccer, // Sports facilities
    Icons.military_tech, // NCC
    Icons.volunteer_activism, // NSS
    Icons.bed, // Hostel
    Icons.work, // Placement Cell
    Icons.forum, // Student Grievance Redressal Committee
    Icons.local_hospital, // Health Facilities
    Icons.report_problem, // Internal Complaint Committee
    Icons.no_accounts, // Anti-Ragging Cell
    Icons.diversity_3, // Equal Opportunity Cell
    Icons.groups_2, // Socio-Economically Disadvantaged Groups Cell
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFe7f3ff),
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
      body: ListView(
        children: [
          GFCarousel(
            items: imageList
                .map(
                  (e) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        e,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                )
                .toList(),
            // autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(microseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 1.0,
            aspectRatio: 16 / 7,
            hasPagination: false,
            enlargeMainPage: false,
          ),
          Center(
            child: Text(
              "Central Library",
              style: GoogleFonts.openSans(
                color: AppColor.textColor(context),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(color: Colors.white,
          padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(12),
            child: Text(
              dummyText,
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.textColor(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String dummyText = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi 
ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit 
in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia 
deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Curabitur vitae lorem eu nulla malesuada placerat. 
Aliquam erat volutpat. Vivamus ultricies sapien ut neque tempor, 
ut vulputate eros gravida. Nulla facilisi. Suspendisse potenti. 
Fusce vitae lectus non risus euismod euismod nec sit amet metus. 
Mauris malesuada, tortor nec bibendum vehicula, mauris augue cursus purus, 
non vehicula nunc mauris at risus. 
""";
}

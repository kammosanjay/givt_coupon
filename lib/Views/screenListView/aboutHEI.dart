import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/constant/constant_widget.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({super.key});

  @override
  State<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
  //
  final List<String> aboutItems = [
    'About University',
    'Act-and-Statutes',
    'Institutional Development Plan',
    'Affiliated University / College',
    'Accreditation/ Ranking Status',
    'Recognition / Approval',
    'Annual Reports',
    'Accounting',
    'Sponsoring Body',
  ];
  //
  final List<IconData> aboutIcons = [
    Icons.account_balance, // About University
    Icons.menu_book, // Act-and-Statutes
    Icons.trending_up, // Institutional Development Plan
    Icons.apartment, // Affiliated University / College
    Icons.star_rate, // Accreditation/ Ranking Status
    Icons.verified, // Recognition / Approval
    Icons.insert_drive_file, // Annual Reports
    Icons.calculate, // Accounting
    Icons.groups, // Sponsoring Body
  ];

  //
  final List<String> aboutRoutes = [
    '/about-university',
    '/act-and-statutes',
    '/institutional-development-plan',
    '/affiliated-university',
    '/accreditation-ranking-status',
    '/recognition-approval',
    '/annual-reports',
    '/accounting',
    '/sponsoring-body',
  ];

  final List<String> imageList = [
    "assets/svgImages/menu.svg",
    "assets/svgImages/customer-service.svg",
    "assets/svgImages/leave.svg",
    "assets/svgImages/about.svg",
    "assets/svgImages/mode.svg",
    "assets/svgImages/policy.svg",
  ];
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return 
    Scaffold(
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

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: 
        Column(
          children: [
            CustomWidgets.customTextFeild(
              context: context,
              label: 'Enter Your email',
              hintfontSize: 14,
              borderRad: 6,
              hintfontWeight: FontWeight.normal,
              fontwgt: FontWeight.w600,
              headingcolor: AppColor.textColor(context),
              hint: 'Enter Your email',

              hintColor: Theme.of(context).colorScheme.secondary,
              // controller: phoneEmaiController,
              keyboardtype: TextInputType.number,
              icon: Image(
                image: AssetImage('assets/images/email.png'),
                height: 14,
                
                width: 18,
                color: AppColor.textColor(context),
              ),
            ),

            SizedBox(height: 20),
            CustomWidgets.customButton(
              context: context,
              buttonName: "Submit",
              height: 60,
              fontSize: 16,fontWeight: FontWeight.w600,
              btnColor: Colors.amber,
              radius: 6
            ),
          ],
        ),
      ),
    );



  }
}

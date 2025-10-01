import 'dart:io';

import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/screenListView/pdfscreen.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  //
  final List<String> feeItems = [
    'Admit Card',
    'Dossier Form',
    'Anti-Ragging Form',
    'Wi-Fi Proxy Registration',
  ];
  //
  final List<String> feeRoutes = [
    '/prospectus',
    '/admission-guidelines',
    '/fee-submission',
    '/fee-refund-policy',
  ];

  final List<String> imageList = [
    "assets/svgImages/admitcard.svg",
    "assets/svgImages/dossier.svg",
    "assets/svgImages/admitcard.svg",
    "assets/svgImages/wifi.svg",
  ];
  List<String> pdfUrls = [
    "https://drive.google.com/uc?export=download&id=1-exV-rV6SCbPKpmxWXgqNlJi3mLv2r9D",
    "https://drive.google.com/uc?export=download&id=1-exV-rV6SCbPKpmxWXgqNlJi3mLv2r9D",
    "https://drive.google.com/uc?export=download&id=1-exV-rV6SCbPKpmxWXgqNlJi3mLv2r9D",
    "https://drive.google.com/uc?export=download&id=1-exV-rV6SCbPKpmxWXgqNlJi3mLv2r9D",
  ];
  final List<IconData> admissionIcons = [
    Icons.menu_book, // Prospectus
    Icons.rule, // Admission Process And Guidelines
    Icons.payment, // Fee Submission
    Icons.attach_money, // Fee Refund Policy
  ];
  Future<File> _downloadPDF(String url) async {
    final dir = await getApplicationDocumentsDirectory();
    final fileName = url.split('/').last; // give unique name
    final filePath = "${dir.path}/$fileName";
    final file = File(filePath);

    if (await file.exists()) {
      return file; // ✅ Already downloaded
    } else {
      await Dio().download(url, filePath);
      return file;
    }
  }

  void _openPDF(BuildContext context, String url) async {
    File file = await _downloadPDF(url);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PDFScreen(file: file)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(backgroundColor: Colors.grey.shade100,
      //  backgroundColor: Color(0xFFe7f3ff),
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
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // allow embedding in scroll views
            itemCount: feeItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅ 3 items in one row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 85,
              childAspectRatio: 1, // adjust for text layout
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  String url =
                      'https://drive.google.com/uc?export=download&id=1-exV-rV6SCbPKpmxWXgqNlJi3mLv2r9D';

                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.externalApplication,
                    );
                  }
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
                        SvgPicture.asset(imageList[index]),
                        Text(
                          feeItems[index],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
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

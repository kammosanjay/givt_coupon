import 'dart:io';

import 'package:baanda_mobile_app/Views/home/home_providers.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class Idcard extends StatelessWidget {
  const Idcard({super.key});

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    final imagepicked = context.watch<HomeProviders>().image?.path;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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

      body: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        // padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: BoxBorder.all(width: 1, color: Colors.amber),

          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            // Background
            Consumer<HomeProviders>(
              builder: (context, value, child) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Opacity(
                    opacity: 0.06,
                    child: Image.asset(
                      'assets/images/bandabg.png',
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),

            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  // width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amber,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Banda University of Agriculture & Technology",
                    style: TextStyle(
                      color: AppColor.textColor(context),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 12),

                // Photo + QR Row
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          width: 150,
                          height: 150,
                          color: Colors.grey.shade50,
                          child: imagepicked != null
                              ? Image.file(File(imagepicked), fit: BoxFit.cover)
                              : Image.asset(
                                  'assets/images/bandabg.png',
                                  height: 300,
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey.shade50, // Replace with QR image
                        child: Icon(
                          Icons.qr_code,
                          size: 150,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 150,
                    child: const Center(
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // Details
                _buildDetail("Department", "Department of Chemistry"),
                _buildDetail("Program", "M.Sc. in Chemistry"),
                _buildDetail("Enroll. No", "465731"),
                _buildDetail("Campus", "Main Campus"),
                _buildDetail("Admission Year", "2023"),
                _buildDetail("Phone", "6388701319"),
                _buildDetail("Email", "gargim191@gmail.com"),
                Spacer(),
                Container(
                  height: 20,

                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            child: Text(
              "$label ",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Text(" :  "),
          Container(
            width: 150,
            child: Text(
              value,
              style: GoogleFonts.poppins(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

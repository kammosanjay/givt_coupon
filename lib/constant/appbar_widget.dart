import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "assets/svgImages/menu.svg",
      "assets/svgImages/customer-service.svg",
      "assets/svgImages/leave.svg",
      "assets/svgImages/about.svg",
      "assets/svgImages/mode.svg",
      "assets/svgImages/policy.svg",
    ];
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow.shade100,
              Colors.green.shade100,
              Colors.blue.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // center: Alignment.center,
          ),
        ),
      ),
      // backgroundColor: AppColor.primaryColor(context),
      title: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          final appLoc = AppLocalizations.of(context)!;
          return Text(
            appLoc.welcome,
            // style: GoogleFonts.poppins(
            //   textStyle: Theme.of(context).textTheme.bodyLarge,

            // ),
          );
        },
      ),
      leading: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),

              child: GFCarousel(
                autoPlay: true,

                autoPlayInterval: Duration(seconds: 2),
                // autoPlayAnimationDuration: Duration(milliseconds: 1600),
                items: imageList.map((url) {
                  return ClipRRect(
                    child: SvgPicture.asset(
                      url,
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                      color: AppColor.headingColor(context),
                    ),
                  );
                }).toList(),
                onPageChanged: (index) {
                  // setState(() {
                  //   index;
                  // });
                },
              ),
            ),
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
    );
  }
}

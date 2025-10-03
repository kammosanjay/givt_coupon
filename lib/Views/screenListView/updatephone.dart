import 'package:givt_mobile_app/Views/language/language.dart';
import 'package:givt_mobile_app/Views/theme/theme_provider.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/constant/constant_widget.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Updatephone extends StatefulWidget {
  String? title;
  Updatephone({super.key, this.title});

  @override
  State<Updatephone> createState() => _UpdatephoneState();
}

class _UpdatephoneState extends State<Updatephone> {
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    debugPrint(widget.title);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.primaryColor(context),
        title: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return (widget.title != null && widget.title!.isNotEmpty)
                ? Text(widget.title!)
                : Text(
                    ModalRoute.of(context)!.settings.arguments.toString(),

                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
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
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomWidgets.customTextFeild(
              context: context,
              label: 'Enter Your Number',
              hintfontSize: 14,
              borderRad: 6,
              hintfontWeight: FontWeight.normal,
              fontwgt: FontWeight.w600,
              headingcolor: AppColor.textColor(context),
              hint: 'Enter Your Number',

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
              fontSize: 16,
              fontWeight: FontWeight.w600,
              btnColor: Colors.amber,
              radius: 6,
            ),
          ],
        ),
      ),
    );
  }
}

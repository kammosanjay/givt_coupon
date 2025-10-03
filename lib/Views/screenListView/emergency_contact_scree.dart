import 'package:givt_mobile_app/Views/language/language.dart';
import 'package:givt_mobile_app/Views/theme/theme_provider.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({super.key});

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  double? select = 10.0;
  final int rows = 5;

  pattern(int num) {
    List<Widget> widgets = [];
    for (int i = 0; i < num; i++) {
      widgets.add(Container(child: Text('$i')));
    }
    return widgets;
  }

  Map<String, dynamic> contactList = {
    'Chief Proctor Office BUAT': "0522 2369134",
    'Registrar': '0522 2369134',
    'Controller Of Exams': '0522 2369134',
    'Dean of Students': '0522 2369134',
    'BUAT Control Room': '0522 2369134',
    'Chairman, Anti-Ragging Squad': '0522 2369134',
    'S.S.H. Emergency Ward': '0522 2369134',
    'Ambulance BUAT': '0522 2369134',
  };

  Map<String, dynamic> cityContact = {
    'Police Control Room': '112',
    'Police Station': '0522 2369134',
    'Police Station Other': '0522 2369134',
  };
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

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text(
            "List of Contacts",
            style: GoogleFonts.poppins(
              color: AppColor.textColor(context),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Table(
              border: TableBorder.all(color: Color(0xffCCCCCC)),
              columnWidths: const {
                0: FlexColumnWidth(2), // name column
                1: FlexColumnWidth(1), // number column
              },
              children: contactList.entries.map((e) {
                return TableRow(
                  decoration: BoxDecoration(color: Colors.white),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e.key,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.value.toString()),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'City',
            style: GoogleFonts.poppins(
              color: AppColor.textColor(context),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Table(
              border: TableBorder.all(color: Color(0xffCCCCCC)),
              columnWidths: const {
                0: FlexColumnWidth(2), // name column
                1: FlexColumnWidth(1), // number column
              },
              children: cityContact.entries.map((e) {
                return TableRow(
                  decoration: BoxDecoration(color: Colors.white),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e.key,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.value.toString()),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/language/language.dart';
import 'package:givt_mobile_app/Views/theme/theme_provider.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Institutes extends StatefulWidget {
  const Institutes({super.key});

  @override
  State<Institutes> createState() => _InstitutesState();
}

class _InstitutesState extends State<Institutes> {
  final List<String> departmentList = [
    'Deptt. of Anaesthesiology',
    'Deptt. of Anatomy',
    'Deptt. of Biochemistry',
    'Deptt. of Biophysics',
    'Deptt. of Cardiology',
    'Deptt. of Cardiothoracic Surgery',
    'Deptt. of Community Medicine',
    'Deptt. of Dermatology & Venereology',
    'Deptt. of Endocrinology & Metabolism',
    'Deptt. of Forensic Medicine',
    'Deptt. of Gastroenterology',
    'Deptt. of Microbiology',
    'Deptt. of General Medicine',
    'Deptt. of Nephrology',
    'Deptt. of Neurology',
    'Deptt. of Neurosurgery',
    'Deptt. of Obstetrics & Gynaecology',
    'Deptt. of Ophthalmology',
    'Deptt. of Orthopaedics',
    'Deptt. of Otorhinolaryngology (ENT)',
    'Deptt. of Pediatrics',
    'Deptt. of Paediatric Surgery',
    'Deptt. of Pathology',
    'Deptt. of Pharmacology',
    'Deptt. of Physiology',
    'Deptt. of Plastic Surgery',
    'Deptt. of Psychiatry',
    'Deptt. of Radio-Diagnosis Imaging (Radiology)',
    'Deptt. of Radiotherapy & Radiation Medicine',
    'Deptt. of Surgical Oncology',
    'Deptt. of General Surgery',
    'Deptt. of T. B. & Respiratory Diseases',
    'Deptt. of Urology',
  ];

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    final appbar = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.primaryColor(context),
        title: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Text(
              appbar.toString(),
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

      body: ListView.builder(
        itemCount: departmentList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              context.read<RouteProvider>().navigateTo(
                '/instituteListDetailScreen',
                context,
                arguments: departmentList[index],
              );
            },
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(6),
              ),
              child: ListTile(
                leading: Text(
                  '${index + 1}',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                title: Text(
                  departmentList[index],

                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                trailing: Text(
                  "Main Campus",
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

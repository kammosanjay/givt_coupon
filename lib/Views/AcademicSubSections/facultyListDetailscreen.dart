import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Facultylistdetailscreen extends StatefulWidget {
  const Facultylistdetailscreen({super.key});

  @override
  State<Facultylistdetailscreen> createState() => _FacultylistdetailscreenState();
}

class _FacultylistdetailscreenState extends State<Facultylistdetailscreen> {
  List<String> title = ['Name', 'Location', 'Director'];
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

  Widget buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.openSans(
                color: AppColor.textColor(context),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ":",
              style: GoogleFonts.openSans(
                color: AppColor.textColor(context),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: GoogleFonts.openSans(
                color: AppColor.textColor(context),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(title.toString())),
      body: Column(
        children: [
          Image.asset(
            "assets/images/bandabg.png",
            height: MediaQuery.of(context).size.height * 0.2,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(6),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),

                // height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  children: [
                    buildInfoRow(context, "Name", title.toString()),
                    buildInfoRow(context, "Location", title.toString()),
                    buildInfoRow(context, "Director", title.toString()),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),

          Text(
            "List of Departments",
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView.builder(
                itemCount: departmentList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // context.read<RouteProvider>().navigateTo(
                      //   '/instituteListDetailScreen',
                      //   context,
                      //   arguments: departmentList[index],
                      // );
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
            ),
          ),
        ],
      ),
    );
  }
}

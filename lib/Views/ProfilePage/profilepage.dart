import 'dart:io';

import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/home/home_providers.dart';
import 'package:givt_mobile_app/Views/screenListView/update_email.dart';
import 'package:givt_mobile_app/Views/screenListView/updatephone.dart';
import 'package:givt_mobile_app/constant/constant_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatefulWidget {
  Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  Map<String, dynamic> usersInfo = {
    "Name": "John Doe",
    "Email": "testing@gmail.com",
    "Phone": "123-456-7890",
    "Address": "123 Main St, City, Country",
    "Department": "Computer Science",
    "Institute/Faculty": "Engineering",
    "Program": "Bachelor of Technology",
    "Degree": "B.Tech",
    "Campus": "Main Campus",
    "Entrance Roll No": "123456789",
    "Exam Roll No": "987654321",
    "Enrollment No": "ENR2023001",
    "Addmission Year": "2023",
    "Academic Year": "2023-2024",
    "Current Semester": "5th Semester",
  };

  Map<String, IconData> usersInfoIcons = {
    "Name": Icons.person,
    "Email": Icons.email,
    "Phone": Icons.phone,
    "Address": Icons.home,
    "Department": Icons.school,
    "Institute/Faculty": Icons.account_balance,
    "Program": Icons.book,
    "Degree": Icons.grade,
    "Campus": Icons.location_city,
    "Entrance Roll No": Icons.confirmation_number,
    "Exam Roll No": Icons.how_to_reg,
    "Enrollment No": Icons.assignment_ind,
    "Addmission Year": Icons.calendar_today,
    "Academic Year": Icons.calendar_view_month,
    "Current Semester": Icons.menu_book,
  };

  /// Example user data
  userProfile(Map<String, dynamic> userData) {
    return Column(
      children: userData.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: Row(
            children: [
              Icon(usersInfoIcons[entry.key], size: 20, color: Colors.blueGrey),

              SizedBox(width: 10),

              Expanded(
                flex: 2,
                child: Text(
                  entry.key,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),

              Expanded(
                flex: 3,
                child: Text(
                  entry.value.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String? imagePath;
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: Center(child: Text(appLoc.setting_page)),

      // Center(
      //   child: Column(
      //     // crossAxisAlignment: CrossAxisAlignment.center,
      //     // padding: EdgeInsets.zero,
      //     children: [
      //       Container(
      //         height: MediaQuery.of(context).size.height * 0.18,
      //         color: Colors.grey.shade100,
      //         child: Stack(
      //           children: [
      //             // Background logo box
      //             Container(
      //               width: double.infinity,
      //               margin: EdgeInsets.all(10),
      //               padding: EdgeInsets.all(10),
      //               height: MediaQuery.of(context).size.height * 0.1,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey.shade400,
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //               child: Image.asset('assets/images/softgenLogo.png'),
      //             ),

      //             // Profile image + name/email row
      //             Positioned(
      //               left: 15,
      //               top: MediaQuery.of(context).size.height * 0.06,
      //               child: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.end,
      //                 children: [
      //                   Consumer<HomeProviders>(
      //                     builder: (ctx, value, child) {
      //                       imagePath = ctx.watch<HomeProviders>().image?.path;
      //                       return imagePath != null
      //                           ? CircleAvatar(
      //                               radius: 50,
      //                               child: ClipRRect(
      //                                 borderRadius: BorderRadius.circular(
      //                                   100,
      //                                 ), // ✅ fixed
      //                                 child: Image.file(
      //                                   File(imagePath!),
      //                                   height: 100,
      //                                   width: 100,
      //                                   fit: BoxFit.cover,
      //                                 ),
      //                               ),
      //                             )
      //                           : CircleAvatar(
      //                               radius: 50,
      //                               child: Image.asset(
      //                                 'assets/svgImages/proImg.png',
      //                                 height: 100,
      //                                 width: 100,
      //                                 fit: BoxFit.contain,
      //                               ),
      //                             );
      //                     },
      //                   ),
      //                   SizedBox(width: 20), // ✅ spacing instead of Row.spacing
      //                   Column(
      //                     mainAxisAlignment: MainAxisAlignment.end,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         usersInfo['Name'],
      //                         style: TextStyle(
      //                           fontSize: 20,
      //                           fontWeight: FontWeight.w600,
      //                           color: Colors.black87,
      //                         ),
      //                       ),
      //                       Text(
      //                         usersInfo['Email'],
      //                         style: TextStyle(
      //                           fontSize: 12,
      //                           fontWeight: FontWeight.w600,
      //                           color: Colors.black87,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),

      //             // Camera icon overlay
      //             Positioned(
      //               top: MediaQuery.of(context).size.height * 0.14,
      //               left: 90,
      //               child: GestureDetector(
      //                 onTap: () {
      //                   context.read<HomeProviders>().pickImage();
      //                 },
      //                 child: Icon(
      //                   Icons.camera_alt_outlined,
      //                   size: 30,
      //                   color: Colors.grey.shade700,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),

      //       // Container(
      //       //   height: MediaQuery.of(context).size.height * 0.18,
      //       //   color: Colors.grey.shade100,
      //       //   child: Stack(
      //       //     children: [
      //       //       Container(
      //       //         width: double.infinity,
      //       //         margin: EdgeInsets.all(10),
      //       //         padding: EdgeInsets.all(10),
      //       //         height: MediaQuery.of(context).size.height * 0.1,
      //       //         decoration: BoxDecoration(
      //       //           color: Colors.grey.shade400,
      //       //           borderRadius: BorderRadius.circular(10),
      //       //         ),
      //       //         child: Image.asset('assets/images/softgenLogo.png'),
      //       //       ),

      //       //       Padding(
      //       //         padding: const EdgeInsets.only(left: 15.0),
      //       //         child: Row(
      //       //           spacing: 30,
      //       //           crossAxisAlignment: CrossAxisAlignment.end,
      //       //           mainAxisAlignment: MainAxisAlignment.start,
      //       //           children: [
      //       //             Positioned(
      //       //               left: MediaQuery.of(context).size.width - 635,

      //       //               right: 0,
      //       //               top: MediaQuery.of(context).size.height * 0.06,
      //       //               child: Consumer<HomeProviders>(
      //       //                 builder: (ctx, value, child) {
      //       //                   imagePath = ctx
      //       //                       .watch<HomeProviders>()
      //       //                       .image
      //       //                       ?.path;
      //       //                   return imagePath != null
      //       //                       ? CircleAvatar(
      //       //                           radius: 50,
      //       //                           child: ClipRRect(
      //       //                             borderRadius:
      //       //                                 BorderRadius.circular(100),
      //       //                             child: Image.file(
      //       //                               File(imagePath!),
      //       //                               height: 100,
      //       //                               width: 100,
      //       //                               fit: BoxFit.cover,
      //       //                             ),
      //       //                           ),
      //       //                         )
      //       //                       : Image.asset(
      //       //                           'assets/svgImages/proImg.png',
      //       //                           height: 100,
      //       //                           width: 100,
      //       //                           fit: BoxFit.contain,
      //       //                         );
      //       //                 },
      //       //               ),
      //       //             ),

      //       //             Column(
      //       //               mainAxisAlignment: MainAxisAlignment.end,
      //       //               crossAxisAlignment: CrossAxisAlignment.start,
      //       //               children: [
      //       //                 Text(
      //       //                   usersInfo['Name'],
      //       //                   style: TextStyle(
      //       //                     fontSize: 20,
      //       //                     fontWeight: FontWeight.w600,
      //       //                     color: Colors.black87,
      //       //                   ),
      //       //                 ),
      //       //                 Text(
      //       //                   usersInfo['Email'],
      //       //                   style: TextStyle(
      //       //                     fontSize: 12,
      //       //                     fontWeight: FontWeight.w600,
      //       //                     color: Colors.black87,
      //       //                   ),
      //       //                 ),
      //       //               ],
      //       //             ),
      //       //           ],
      //       //         ),
      //       //       ),

      //       //       Positioned(
      //       //         top: MediaQuery.of(context).size.height * 0.14,
      //       //         left: MediaQuery.of(context).size.width - 470,
      //       //         right: 100,
      //       //         child: GestureDetector(
      //       //           onTap: () {
      //       //             context.read<HomeProviders>().pickImage();
      //       //           },
      //       //           child: Icon(
      //       //             Icons.camera_alt_outlined,
      //       //             size: 30,
      //       //             color: Colors.grey.shade700,
      //       //           ),
      //       //         ),
      //       //       ),
      //       //     ],
      //       //   ),
      //       // ),
      //       SizedBox(height: 20),
      //       userProfile(
      //         Map<String, dynamic>.from(usersInfo)..removeWhere(
      //           (key, value) =>
      //               key == "Name" ||
      //               key == "Email" ||
      //               key == "Phone" ||
      //               key == "Address",
      //         ),
      //       ),
      //       Spacer(),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(
      //           spacing: 10,
      //           children: [
      //             Expanded(
      //               child: CustomWidgets.customButton(
      //                 context: context,
      //                 buttonName: 'Update Phone Number',

      //                 fontWeight: FontWeight.w600,
      //                 btnColor: Colors.amber,
      //                 onPressed: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) =>
      //                           Updatephone(title: 'Update Phone Number'),
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //             Expanded(
      //               child: CustomWidgets.customButton(
      //                 context: context,
      //                 buttonName: 'Update Email',

      //                 fontWeight: FontWeight.w600,
      //                 btnColor: Colors.amber,
      //                 onPressed: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) =>
      //                           UpdateEmail(title: 'Update Email'),
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

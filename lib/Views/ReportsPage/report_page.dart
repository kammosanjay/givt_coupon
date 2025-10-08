import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  // StreamController<List<Map<String, dynamic>>> streamController =
  //     StreamController<List<Map<String, dynamic>>>();

  void initState() {
    super.initState();
    // Fetch data once the widget is loaded
    // Future.delayed(Duration.zero, () {
    //   context.read<ReportProvider>().fetchReport();
    // });
  }

  List<String> imageList = [
    "https://buat.edu.in/wp-content/uploads/2025/07/WhatsApp-Image-2025-07-07-at-2.49.11-PM.jpeg",
    "https://buat.edu.in/wp-content/uploads/2023/02/DSC_7909-min-scaled.jpg",
    "https://buat.edu.in/wp-content/uploads/2025/07/DSC_7891.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      // backgroundColor: Color(0xFFe7f3ff),
      body: Center(child: Text(appLoc.wallet_page))
      
      // ListView(
      //   children: [
      //     GFCarousel(
      //       items: imageList
      //           .map(
      //             (e) => CachedNetworkImage(
      //               imageUrl: e,
      //               width: double.infinity,

      //               imageBuilder: (context, imageProvider) => ClipRRect(
      //                 borderRadius: BorderRadius.circular(6),
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Image(
      //                     image: imageProvider, // ✅ use network imageProvider
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //               ),
      //               placeholder: (context, url) => const Center(
      //                 child:
      //                     CircularProgressIndicator(), // ✅ loader while fetching
      //               ),
      //               errorWidget: (context, url, error) =>
      //                   const Icon(Icons.error), // ✅ error fallback
      //             ),
      //           )
      //           .toList(),
      //       // autoPlay: true,
      //       autoPlayInterval: const Duration(seconds: 3),
      //       autoPlayAnimationDuration: const Duration(microseconds: 800),
      //       autoPlayCurve: Curves.fastOutSlowIn,
      //       viewportFraction: 1.0,
      //       aspectRatio: 16 / 7,
      //       hasPagination: false,
      //       enlargeMainPage: false,
      //     ),
      //     Center(
      //       child: Text(
      //         "Central Library",
      //         style: GoogleFonts.openSans(
      //           color: AppColor.textColor(context),
      //           fontSize: 22,
      //           fontWeight: FontWeight.w600,
      //         ),
      //       ),
      //     ),
      //     Container(color: Colors.white,
      //     padding: EdgeInsets.all(10),
      //       margin: EdgeInsets.all(12),
      //       child: Text(
      //         dummyText,
      //         style: GoogleFonts.openSans(
      //           fontSize: 16,
      //           fontWeight: FontWeight.w400,
      //           color: AppColor.textColor(context),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
   
   
   
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

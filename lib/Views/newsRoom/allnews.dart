import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatefulWidget {
  String title;
  NewsScreen({super.key, required this.title});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          widget.title,
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColor.textColor(context),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(6),
              side: BorderSide(width: 1, color: Colors.grey.shade400),
            ),
            child: ListTile(
              title: Text("29-08-2025"),
              subtitle: Text(
                "Hello this is the news about the event that has been intialized by the adimin. ",
              ),
            ),
          );
        },
      ),
    );
  }
}

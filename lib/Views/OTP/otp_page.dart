import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/constant/constant_widget.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  final String? arguments;
  String? veriId;
   OtpPage({super.key, this.arguments, this.veriId});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    final from = ModalRoute.of(context)!.settings.arguments as String;
    print("testing==>${from}");

    return Scaffold(
      // backgroundColor: Colors.grey.shade100, 
      // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/bandabg.png',
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Text(
                'OTP Verification',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor(context),
                ),
              ),
              Text(
                'Enter Four Digit OTP below, Sent on Your Gmail',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor(context),
                ),
              ),
              // SizedBox(height: 20),
              // Align(alignment: Alignment.centerLeft,
              //   child: Text(
              //     'Enter OTP',
              //     style: GoogleFonts.poppins(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w600,
              //       color: AppColor.textColor(context),
              //     ),
              //   ),
              // ),
              SizedBox(height: 40),
              PinCodeTextField(
                appContext: context,
                length: 6, // 6 digit OTP
                keyboardType: TextInputType.number,
                animationType: AnimationType.scale,
                cursorColor: Colors.black,
                blinkWhenObscuring: true,
                enablePinAutofill: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,

                  borderRadius: BorderRadius.circular(9),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.grey.shade50,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.amber,
                  activeColor: Colors.grey.shade400,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onChanged: (value) {
                  print("Current OTP value: $value");
                },
                onCompleted: (value) {
                  print("OTP Entered: $value");
                  // You can verify OTP here
                },
              ),

              SizedBox(height: 40),
              CustomWidgets.customButton(
                context: context,
                height: 60,
                buttonName: 'Verify OTP',
                onPressed: () {
                  if (from== 'signup') {
                    context.read<RouteProvider>().navigateTo('/home', context);
                  }else{
                    context.read<RouteProvider>().navigateTo('/forgotpagetwo', context);
                  }
                },
                fontWeight: FontWeight.w600,
                fontSize: 18,
                btnColor: Colors.amber,
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  // context.read<RouteProvider>().navigateTo(
                  //   '/signup',
                  //   context,
                  // );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SignupPage()),
                  // );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't Received OTP ? ",
                    style: GoogleFonts.poppins(
                      color: AppColor.textColor(context),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Resend',
                        style: GoogleFonts.poppins(
                          color: AppColor.errorColor(context),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 40
            ],
          ),
        ),
      ),
    );
  }
}

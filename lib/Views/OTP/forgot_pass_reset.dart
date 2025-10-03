import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:givt_mobile_app/Views/loginpage/login_page.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/constant/constant_widget.dart';
import 'package:provider/provider.dart';

class ForgotPassReset extends StatefulWidget {
  const ForgotPassReset({super.key});

  @override
  State<ForgotPassReset> createState() => _ForgotPassResetState();
}

class _ForgotPassResetState extends State<ForgotPassReset> {
  bool isShown = true;
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(height: 10),
            Center(
              child: Text(
                'Reset Password',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor(context),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row(
                //   children: [
                //     Icon(Icons.track_changes),
                //     SizedBox(width: 8),
                // Text(
                //   'EATA',
                //   style: GoogleFonts.poppins(
                //     fontSize: 12,
                //     color: AppColor.textColor(context),
                //   ),
                // ),
                //   ],
                // ),
                // SizedBox(height: 20),
                FittedBox(
                  child: Text(
                    "Recover access to your account safely",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),

                SizedBox(height: 40),
                CustomWidgets.customTextFeild(
                  context: context,
                  label: 'New Password',
                  hintfontSize: 14,
                  fontwgt: FontWeight.w600,
                  headingcolor: AppColor.textColor(context),
                  hint: 'Enter New Password',
                  // isObstructed: isShown,
                  hintColor: Theme.of(context).colorScheme.secondary,
                  controller: oldPassController,
                  keyboardtype: TextInputType.emailAddress,
                  icon: Image(
                    image: AssetImage('assets/images/email.png'),
                    height: 14,
                    width: 18,
                    color: AppColor.textColor(context),
                  ),
                ),
                SizedBox(height: 20),

                CustomWidgets.customTextFeild(
                  context: context,
                  label: 'Confirm Password',
                  hintfontSize: 14,
                  suffIcons: InkWell(
                    onTap: () {
                      setState(() {
                        isShown = !isShown;
                      });
                    },
                    child: isShown
                        ? Icon(
                            Icons.remove_red_eye,
                            color: AppColor.textColor(context),
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColor.textColor(context),
                          ),
                  ),

                  fontwgt: FontWeight.w600,

                  headingcolor: AppColor.textColor(context),
                  hint: 'Confirm Password',
                  hintColor: Theme.of(context).colorScheme.secondary,
                  controller: newPassController,
                  isObstructed: isShown,
                  icon: Icon(Icons.lock),
                ),
                SizedBox(height: 30),
                CustomWidgets.customButton(
                  context: context,
                  height: 60,
                  buttonName: 'Submit',
                  onPressed: () {
                    context.read<RouteProvider>().navigateTo('/loginpage', context);
                  },
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  btnColor: Colors.amber,
                ),
                SizedBox(height: 30),
                // InkWell(
                //   onTap: () {
                //     // context.read<RouteProvider>().navigateTo(
                //     //   '/signup',
                //     //   context,
                //     // );
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => LoginPage()),
                //     );
                //   },
                //   child: RichText(
                //     text: TextSpan(
                //       text: "If password remember ! ",
                //       style: TextStyle(
                //         color: AppColor.textColor(context),
                //         fontSize: 16,
                //       ),
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: 'Sign In',
                //           style: TextStyle(
                //             color: AppColor.textColor(context),
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         TextSpan(text: ' 👋', style: TextStyle(fontSize: 18)),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

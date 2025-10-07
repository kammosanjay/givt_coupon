import 'package:givt_mobile_app/Views/loginpage/login_provider.dart';
import 'package:givt_mobile_app/Views/loginpage/loginmodal.dart';

import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/Forgot/forgot_page.dart';
import 'package:givt_mobile_app/Views/signUpPage/signup_page.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/constant/constant_widget.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;
  bool isShown = true;

  TextEditingController passController = TextEditingController();
  TextEditingController phoneEmaiController = TextEditingController();
  bool moveLeft = false;
  bool showText = false;

  @override
  void initState() {
    super.initState();

    // Step 1: Move logo from center → left
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        moveLeft = true;
      });
    });

    // Step 2: Show text after logo finishes moving
    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        showText = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    // passController.text = context.watch()<LoginProvider>().isRememberMeChecked
    //     ? context.watch<LoginProvider>().storedPassword ?? ''
    //     : passController.text;
    // phoneEmaiController.text =
    //     context.watch<LoginProvider>().isRememberMeChecked
    //     ? context.watch<LoginProvider>().storedEmail ?? ''
    //     : phoneEmaiController.text;

    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Stack(
              alignment: Alignment.center,
              children: [
                // Text (hidden initially, fades in later)
                AnimatedOpacity(
                  opacity: showText ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    "Givt, more than just a gift",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primaryColor,
                    ),
                  ),
                ),

                // Moving logo
                AnimatedAlign(
                  alignment: moveLeft ? Alignment.centerLeft : Alignment.center,
                  duration: const Duration(milliseconds: 1600),
                  curve: Curves.easeInOut,
                  child: Image.asset(
                    'assets/images/couponlogo.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.shade50,
                    // spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.red.shade50,
                    // spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(-1, -1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(height: 40),
                  // Text(
                  //   'Welcome Back',
                  //   style: GoogleFonts.aBeeZee(
                  //     fontSize: 32,
                  //     fontWeight: FontWeight.w600,
                  //     color: AppColor.textColor(context),
                  //   ),
                  // ),

                  // // SizedBox(height: 5),
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login/SignUp',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor(context),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login to continue your journey with Givt',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor(context),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Column(
                    children: [
                      CustomWidgets.customTextFeild(
                        context: context,
                        label: 'Enter your mobile number',
                        hintfontSize: 14,

                        hintfontWeight: FontWeight.normal,
                        fontwgt: FontWeight.w600,
                        headingcolor: AppColor.textColor(context),
                        hint: 'Enter your mobile number',

                        hintColor: Theme.of(context).colorScheme.secondary,
                        controller: phoneEmaiController,
                        keyboardtype: TextInputType.emailAddress,
                        icon: Image(
                          image: AssetImage('assets/images/email.png'),
                          height: 14,
                          width: 18,
                          color: AppColor.textColor(context),
                        ),
                      ),
                      SizedBox(height: 20),
                      // CustomWidgets.customTextFeild(
                      //   context: context,

                      //   label: 'Password',
                      //   suffIcons: InkWell(
                      //     onTap: () {
                      //       setState(() {
                      //         isShown = !isShown;
                      //       });
                      //     },
                      //     child: isShown
                      //         ? Icon(
                      //             Icons.remove_red_eye,
                      //             color: AppColor.textColor(context),
                      //           )
                      //         : Icon(
                      //             Icons.remove_red_eye_outlined,
                      //             color: AppColor.textColor(context),
                      //           ),
                      //   ),

                      //   fontwgt: FontWeight.w600,

                      //   headingcolor: AppColor.textColor(context),
                      //   hint: 'Password',
                      //   hintfontSize: 14,
                      //   hintfontWeight: FontWeight.normal,
                      //   hintColor: Theme.of(context).colorScheme.secondary,
                      //   controller: passController,
                      //   isObstructed: isShown,

                      //   icon: Image(
                      //     image: AssetImage('assets/images/pass.png'),
                      //     height: 14,
                      //     width: 18,
                      //     color: AppColor.textColor(context),
                      //   ),
                      // ),

                      // SizedBox(height: 8),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: TextButton(
                      //         onPressed: () {},
                      //         style: TextButton.styleFrom(
                      //           padding: EdgeInsets.zero, // Removes all padding
                      //           minimumSize: Size(
                      //             10,
                      //             10,
                      //           ), // Optional: removes minimum tap area
                      //           tapTargetSize: MaterialTapTargetSize
                      //               .shrinkWrap, // Optional: tight layout
                      //         ),
                      //         child: Row(
                      //           children: [
                      //             SizedBox(
                      //               width: 25,
                      //               height: 25,
                      //               child: Selector<LoginProvider, bool>(
                      //                 selector: (ctxe, provider) =>
                      //                     provider.isRememberMeChecked,

                      //                 builder: (ctx, isChecked, _) {
                      //                   return Checkbox(
                      //                     value: isChecked,
                      //                     side: BorderSide(
                      //                       color: AppColor.textColor(context),
                      //                     ),
                      //                     activeColor: Colors.amber,
                      //                     checkColor: Colors.white,
                      //                     materialTapTargetSize:
                      //                         MaterialTapTargetSize.shrinkWrap,
                      //                     onChanged: (value) {
                      //                       ctx
                      //                           .read<LoginProvider>()
                      //                           .setRememberMe(value);
                      //                     },
                      //                   );
                      //                 },
                      //               ),
                      //             ),
                      //             const SizedBox(width: 12),
                      //             Text(
                      //               "Remember Me",
                      //               style: GoogleFonts.poppins(
                      //                 color: AppColor.textColor(context),
                      //                 fontSize: 14,
                      //                 fontWeight: FontWeight.w500,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Align(
                      //       alignment: Alignment.centerRight,
                      //       child: TextButton(
                      //         onPressed: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => ForgotPage(),
                      //             ),
                      //           );
                      //         },
                      //         style: TextButton.styleFrom(
                      //           padding: EdgeInsets.zero, // Removes all padding
                      //           minimumSize: Size(
                      //             10,
                      //             10,
                      //           ), // Optional: removes minimum tap area
                      //           tapTargetSize: MaterialTapTargetSize
                      //               .shrinkWrap, // Optional: tight layout
                      //         ),
                      //         child: Text(
                      //           "Forgot Password ?",
                      //           style: GoogleFonts.poppins(
                      //             color: AppColor.textColor(context),
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 50),

                      CustomWidgets.customButton(
                        context: context,
                        height: 60,
                        buttonName: 'Login',
                        onPressed: () {
                          final loginProvider = context.read<LoginProvider>();

                          final email = phoneEmaiController.text.trim();
                          // final password = passController.text.trim();

                          // Check empty fields
                          if (email.isEmpty) {
                            FlutterToastr.show(
                              "Please your mobile number",
                              context,
                              duration: FlutterToastr.lengthShort,
                              position: FlutterToastr.bottom,
                              backgroundColor: Colors.red,
                              textStyle: const TextStyle(color: Colors.white),
                            );
                            return;
                          }

                          // First-time login (no saved credentials)
                          if (!loginProvider.isLoggedIn()) {
                            loginProvider.login(Loginmodal(email: email));

                            FlutterToastr.show(
                              "Login Successful (First time)",
                              context,
                              duration: FlutterToastr.lengthShort,
                              position: FlutterToastr.bottom,
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(color: Colors.white),
                            );

                            context.read<RouteProvider>().navigateTo(
                              '/home',
                              context,
                            );
                          } else {
                            // Returning login → validate
                            if (loginProvider.validateLogin(email)) {
                              FlutterToastr.show(
                                "Login Successful",
                                context,
                                duration: FlutterToastr.lengthShort,
                                position: FlutterToastr.bottom,
                                backgroundColor: Colors.green,
                                textStyle: const TextStyle(color: Colors.white),
                              );

                              context.read<RouteProvider>().navigateTo(
                                '/home',
                                context,
                              );
                            } else {
                              FlutterToastr.show(
                                "Invalid mobile number",
                                context,
                                duration: FlutterToastr.lengthLong,
                                position: FlutterToastr.bottom,
                                backgroundColor: Colors.red,
                                textStyle: const TextStyle(color: Colors.white),
                              );
                            }
                          }
                          if (context
                                  .read<LoginProvider>()
                                  .isRememberMeChecked ==
                              true) {
                            phoneEmaiController.clear();
                          }
                        },
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontColor: Colors.white,
                        btnColor: MyColors.primaryColor,
                      ),

                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            // context.read<RouteProvider>().navigateTo(
                            //   '/signup',
                            //   context,
                            // );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an Account? ",
                              style: GoogleFonts.poppins(
                                // color: AppColor.textColor(context),
                                color: MyColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Register',
                                  style: GoogleFonts.poppins(
                                    color: MyColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 👋',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Align(
                      //   alignment: Alignment.center,
                      //   child: TextButton(
                      //     onPressed: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => ForgotPage(),
                      //         ),
                      //       );
                      //     },
                      //     style: TextButton.styleFrom(
                      //       padding: EdgeInsets.zero, // Removes all padding
                      //       minimumSize: Size(
                      //         10,
                      //         10,
                      //       ), // Optional: removes minimum tap area
                      //       tapTargetSize: MaterialTapTargetSize
                      //           .shrinkWrap, // Optional: tight layout
                      //     ),
                      //     child: Text(
                      //       "Forgot Password ?",
                      //       style: GoogleFonts.poppins(
                      //         color: MyColors.primaryColor,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:baanda_mobile_app/Views/loginpage/login_provider.dart';
import 'package:baanda_mobile_app/Views/loginpage/loginmodal.dart';

import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/Forgot/forgot_page.dart';
import 'package:baanda_mobile_app/Views/signUpPage/signup_page.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/constant/constant_widget.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShown = true;
  TextEditingController passController = TextEditingController();
  TextEditingController phoneEmaiController = TextEditingController();
 
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
              Text(
                'Welcome Back',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor(context),
                ),
              ),
              // Text(
              //   'to',
              //   style: GoogleFonts.poppins(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w600,
              //     color: AppColor.textColor(context),
              //   ),
              // ),

              // SizedBox(height: 40
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.track_changes,
                  //       color: AppColor.headingColor(context),
                  //     ),
                  //     SizedBox(width: 8),
                  //     Text(
                  //       'EATA',
                  //       style: GoogleFonts.poppins(
                  //         fontSize: 12,
                  //         // color: AppColor.textColor(context),
                  //         textStyle: Theme.of(context).textTheme.titleSmall,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 10),
                  FittedBox(
                    child: Text(
                      appLoc.welcome,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.headingColor(context),
                      ),
                    ),
                  ),

                  // SizedBox(height: 5),
                  SizedBox(height: 50),
                  Column(
                    children: [
                      CustomWidgets.customTextFeild(
                        context: context,
                        label: 'Email',
                        hintfontSize: 14,

                        hintfontWeight: FontWeight.normal,
                        fontwgt: FontWeight.w600,
                        headingcolor: AppColor.textColor(context),
                        hint: 'Email',

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
                      CustomWidgets.customTextFeild(
                        context: context,

                        label: 'Password',
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
                        hint: 'Password',
                        hintfontSize: 14,
                        hintfontWeight: FontWeight.normal,
                        hintColor: Theme.of(context).colorScheme.secondary,
                        controller: passController,
                        isObstructed: isShown,

                        icon: Image(
                          image: AssetImage('assets/images/pass.png'),
                          height: 14,
                          width: 18,
                          color: AppColor.textColor(context),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero, // Removes all padding
                                minimumSize: Size(
                                  10,
                                  10,
                                ), // Optional: removes minimum tap area
                                tapTargetSize: MaterialTapTargetSize
                                    .shrinkWrap, // Optional: tight layout
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: Selector<LoginProvider, bool>(
                                      selector: (ctxe, provider) =>
                                          provider.isRememberMeChecked,

                                      builder: (ctx, isChecked, _) {
                                        return Checkbox(
                                          value: isChecked,
                                          side: BorderSide(
                                            color: AppColor.textColor(context),
                                          ),
                                          activeColor: Colors.amber,
                                          checkColor: Colors.white,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          onChanged: (value) {
                                            ctx
                                                .read<LoginProvider>()
                                                .setRememberMe(value);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    "Remember Me",
                                    style: GoogleFonts.poppins(
                                      color: AppColor.textColor(context),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPage(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero, // Removes all padding
                                minimumSize: Size(
                                  10,
                                  10,
                                ), // Optional: removes minimum tap area
                                tapTargetSize: MaterialTapTargetSize
                                    .shrinkWrap, // Optional: tight layout
                              ),
                              child: Text(
                                "Forgot Password ?",
                                style: GoogleFonts.poppins(
                                  color: AppColor.textColor(context),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),
                      CustomWidgets.customButton(
                        context: context,
                        height: 60,
                        buttonName: 'Login',
                        onPressed: () {
                          final loginProvider = context.read<LoginProvider>();

                          final email = phoneEmaiController.text.trim();
                          final password = passController.text.trim();

                          // Check empty fields
                          if (email.isEmpty || password.isEmpty) {
                            FlutterToastr.show(
                              "Please enter both email and password",
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
                            loginProvider.login(
                              Loginmodal(email: email, password: password),
                            );

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
                            if (loginProvider.validateLogin(email, password)) {
                            
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
                                "Invalid email or password",
                                context,
                                duration: FlutterToastr.lengthShort,
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
                            passController.clear();
                            phoneEmaiController.clear();
                          }
                        },
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        btnColor: Colors.amber,
                      ),
                      SizedBox(height: 30),
                      InkWell(
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
                              color: AppColor.textColor(context),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Register',
                                style: GoogleFonts.poppins(
                                  color: AppColor.errorColor(context),
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
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    
  }
   @override
  void dispose() {
    
    super.dispose();
  }

}

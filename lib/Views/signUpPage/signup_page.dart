import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/loginpage/login_provider.dart';

import 'package:givt_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:givt_mobile_app/Views/loginpage/login_page.dart';
import 'package:givt_mobile_app/constant/appColor.dart';
import 'package:givt_mobile_app/constant/constant_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  bool isShown = true;

  TextEditingController phoneEmaiController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  DateTime? selectedDate;
  final TextEditingController dobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AnimationController _controller;
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        _formKey.currentState?.reset();
      },
      child: Scaffold(
        // backgroundColor: Colors.grey.shade100,
        resizeToAvoidBottomInset: true,
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,s
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Text (hidden initially, fades in later)
                AnimatedOpacity(
                  opacity: showText ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    "Givt, more than just a gift",
                    style: GoogleFonts.lora(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
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

            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: MediaQuery.of(context).size.height * 0.72,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.lora(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColor.textColor(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome! Create your account to get started.",
                        style: GoogleFonts.lora(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColor.textColor(context),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomWidgets.customTextFeild(
                      context: context,
                      hintfontSize: 14,
                      label: 'Email',
                      fontwgt: FontWeight.w600,
                      headingcolor: AppColor.textColor(context),
                      hint: 'Enter your email',
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Simple email validation
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      hintColor: Theme.of(context).colorScheme.secondary,
                      controller: phoneEmaiController,
                      keyboardtype: TextInputType.emailAddress,
                      icon: Image(
                        image: AssetImage('assets/images/email.png'),
                        height: 14,
                        width: 18,
                      ),
                    ),
                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: GoogleFonts.lora(
                          color: MyColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomWidgets.customDropdownField(
                      context: context,
                      items: ['👨 Male', '👩 Female'],
                      selectedItem: '👨 Male',
                      label: 'Gender',
                      height: 60,
                      // readOnly: true,
                      hint: 'Select Gender',
                      onChanged: (String? newValue) {
                        // Handle selection change
                      },
                    ),
                   
                    SizedBox(height: 20),
                    CustomWidgets.customTextFeild(
                      context: context,
                      controller: dobController,
                      label: 'Date of Birth',
                      hint: 'Select your date of birth',
                      hintfontSize: 14,
                      hintColor: Theme.of(context).colorScheme.secondary,
                      headingcolor: AppColor.textColor(context),
                      // Remove password-specific params like 'isObstructed' and 'suffIcons'
                      icon: Image(
                        image: AssetImage(
                          'assets/images/calender.png',
                        ), // Use an appropriate icon
                        height: 14,
                        width: 18,
                        color: MyColors.textColor,
                      ),
                      // Validate the DOB selection
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your date of birth';
                        }
                        // Optional: Add custom validation for range or age.
                        return null;
                      },
                      // readOnly: true, // Prevent keyboard input
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          selectedDate = picked;
                          dobController.text = DateFormat(
                            'yyyy-MM-dd',
                          ).format(picked);
                          setState(() {});
                        }
                      },
                    ),
                    SizedBox(height: 50),
                    CustomWidgets.customButton(
                      context: context,
                      height: 60,
                      buttonName: 'Continue',
                      onPressed: () {
                        final name = fullNameController.text.trim();
                        final email = phoneEmaiController.text.trim();
                        // final password = passController.text.trim();
                        // if (!_formKey.currentState!.validate()) {
                        //   return "required";
                        // }

                        context.read<LoginProvider>().saveSignupData(
                          fullNameController.text,

                          phoneEmaiController.text,
                          // passController.text,
                        );
                        context.read<RouteProvider>().navigateTo(
                          '/otpPage',
                          context,
                          arguments: 'signup',
                        );
                      },
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      fontColor: Colors.white,
                      btnColor: MyColors.primaryColor,
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an Account !",
                          style: GoogleFonts.lora(
                            color: MyColors.textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Login',
                              style: GoogleFonts.lora(
                                color: MyColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

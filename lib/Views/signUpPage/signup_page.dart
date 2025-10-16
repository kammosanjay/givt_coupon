import 'package:givt_mobile_app/MyPageRoute/route_provider.dart';
import 'package:givt_mobile_app/Views/loginpage/login_provider.dart';
import 'package:givt_mobile_app/Views/signUpPage/signup_provider.dart';

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

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
    final isDarkEnabled = Theme.brightnessOf(context) == Brightness.dark;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        _formKey.currentState?.reset();
      },
      child: Scaffold(
        // backgroundColor: Colors.grey.shade100,
        resizeToAvoidBottomInset: true,
        body: Column(
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
                      color: isDarkEnabled
                          ? Colors.white
                          : MyColors.primaryColor,
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
                height: MediaQuery.of(context).size.height * 0.8,
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
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.lora(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: MyColors.bodyTextColor,
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
                          color: MyColors.bodyTextColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomWidgets.customTextFeild(
                      context: context,
                      hintfontSize: 14,
                      label: 'Name',
                      fontwgt: FontWeight.w600,
                      headingcolor: MyColors.bodyTextColor,
                      hint: 'Enter your Name',
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        // Simple email validation
                      },
                      hintColor: MyColors.bodyTextColor,
                      controller: nameController,
                      keyboardtype: TextInputType.text,
                      icon: Image(
                        image: AssetImage('assets/images/person.png'),
                        height: 14,
                        width: 18,
                      ),
                    ),
                    SizedBox(height: 20),

                    CustomWidgets.customTextFeild(
                      context: context,
                      hintfontSize: 14,
                      label: 'Email',
                      fontwgt: FontWeight.w600,
                      headingcolor: MyColors.bodyTextColor,
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
                      hintColor: MyColors.bodyTextColor,
                      controller: emailController,
                      keyboardtype: TextInputType.emailAddress,
                      icon: Image(
                        image: AssetImage('assets/images/email.png'),
                        height: 14,
                        width: 18,
                      ),
                    ),
                    SizedBox(height: 20),

                    CustomWidgets.customTextFeild(
                      context: context,
                      hintfontSize: 14,
                      label: 'Mobile',
                      fontwgt: FontWeight.w600,
                      headingcolor: MyColors.bodyTextColor,
                      hint: 'Enter your mobile',
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your mobile';
                        }
                        // Simple email validation
                      },
                      hintColor: MyColors.bodyTextColor,
                      controller: phoneController,
                      keyboardtype: TextInputType.emailAddress,
                      icon: Image(
                        image: AssetImage('assets/images/mobile.png'),
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
                          color: MyColors.bodyTextColor,
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
                      hintColor: MyColors.bodyTextColor,
                      headingcolor: MyColors.bodyTextColor,
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
                    SizedBox(height: 30),
                    CustomWidgets.customButton(
                      context: context,
                      height: 60,
                      buttonName: 'Continue',
                      onPressed: () {
                        final name = nameController.text.trim();
                        final email = emailController.text.trim();
                        final phone = phoneController.text.trim();
                        // final password = passController.text.trim();
                        // if (!_formKey.currentState!.validate()) {
                        //   return "required";
                        // }

                        context.read<SignupProvider>().userSignUP(
                          email: email,
                          pass: name,
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
                    SizedBox(height: 10),
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
                            color: MyColors.bodyTextColor,
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

import 'package:baanda_mobile_app/Views/AcademicSubSections/departmentListDetailscreen.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/facultyListDetailscreen.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/institueListDetailScreen.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/institute.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/acadColla.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/department.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/academicPro.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/faculty.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/internalQA.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/library.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/listOfUgc.dart';
import 'package:baanda_mobile_app/Views/Changepassword/change_passSCreen.dart';
import 'package:baanda_mobile_app/Views/OTP/forgot_pass_reset.dart';
import 'package:baanda_mobile_app/Views/OTP/otp_page.dart';
import 'package:baanda_mobile_app/Views/ProfilePage/profile_provider.dart';
import 'package:baanda_mobile_app/Views/ProfilePage/profilepage.dart';
import 'package:baanda_mobile_app/Views/ReportsPage/report_page.dart';
import 'package:baanda_mobile_app/Views/home/banda_home_page.dart';
import 'package:baanda_mobile_app/Views/home/firebase_messaging.dart';
import 'package:baanda_mobile_app/Views/loginpage/login_provider.dart';
import 'package:baanda_mobile_app/Views/newsRoom/allnews.dart';
import 'package:baanda_mobile_app/Views/screenListView/aboutHEI.dart';
import 'package:baanda_mobile_app/Views/screenListView/academic.dart';
import 'package:baanda_mobile_app/Views/screenListView/administration.dart';
import 'package:baanda_mobile_app/Views/screenListView/admissionFee.dart';
import 'package:baanda_mobile_app/Views/screenListView/alumni.dart';
import 'package:baanda_mobile_app/Views/screenListView/announement.dart';
import 'package:baanda_mobile_app/Views/screenListView/emergency.dart';
import 'package:baanda_mobile_app/Views/screenListView/emergency_contact_scree.dart';
import 'package:baanda_mobile_app/Views/screenListView/gallery.dart';
import 'package:baanda_mobile_app/Views/screenListView/grievence.dart';
import 'package:baanda_mobile_app/Views/screenListView/idcard.dart';

import 'package:baanda_mobile_app/Views/screenListView/information.dart';
import 'package:baanda_mobile_app/Views/screenListView/research.dart';
import 'package:baanda_mobile_app/Views/screenListView/studentCareer.dart';
import 'package:baanda_mobile_app/Views/screenListView/updatephone.dart';

import 'package:baanda_mobile_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get_storage/get_storage.dart';

import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/Forgot/forgot_page.dart';
import 'package:baanda_mobile_app/Views/ReportsPage/report_provider.dart';
// Ensure that 'myPage_routes.dart' defines a class named 'MyPageRoutes' with a static 'routes' property.
import 'package:baanda_mobile_app/Views/home/home_providers.dart';
import 'package:baanda_mobile_app/Views/home/home.dart';
import 'package:baanda_mobile_app/Views/home/task_page.dart';
import 'package:baanda_mobile_app/Views/home/tasklist_page.dart';
import 'package:baanda_mobile_app/Views/loginpage/login_page.dart';
import 'package:baanda_mobile_app/Views/signUpPage/signup_page.dart';
import 'package:baanda_mobile_app/Views/splash/splash_provider.dart';
import 'package:baanda_mobile_app/Views/splash/splash_screen.dart';
import 'package:baanda_mobile_app/Views/todolist/todo_provider.dart';

import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';

import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();

  await FirebaseMsg().initFCM();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Language>(create: (_) => Language()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
        ChangeNotifierProvider<HomeProviders>(create: (_) => HomeProviders()),
        ChangeNotifierProvider<RouteProvider>(create: (_) => RouteProvider()),
        ChangeNotifierProvider<TodoProvider>(create: (_) => TodoProvider()),
        ChangeNotifierProvider<ReportProvider>(create: (_) => ReportProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<ProfileProvider>(
          create: (_) => ProfileProvider(),
        ),
       
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    final langProvider = Provider.of<Language>(context, listen: true);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('es'),
        Locale('bn'),
        Locale('ta'),
        Locale('te'),
        Locale('mr'),
        Locale('kn'),
        Locale('as'),
        Locale('ur'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      locale: langProvider.selectectLocale,
      // home:ChangePassscreen() ,
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const MyHome(),
        '/otpPage': (context) => OtpPage(),
        '/task': (context) => TaskPage(),
        '/CreateTaskList': (context) => CreateTaskList(),
        '/loginpage': (context) => LoginPage(),
        '/profilepage': (context) => Profilepage(),
        '/forgotpage': (context) => ForgotPage(),
        '/forgotpagetwo': (context) => ForgotPassReset(),
        '/signUpPage': (context) => SignupPage(),
        'Institutes': (context) => Institutes(),
        'Departments': (context) => Department(),
        'Faculty': (context) => Faculty(),
        '/UGC': (context) => AcademicUGCScreen(),
        '/IQA': (context) => AcademicIQAScreen(),
        '/library': (context) => AcademicLibraryScreen(),
        '/acadCollaborations': (context) => AcademicCollaborationScreen(),
        'Places': (context) => Places(),
        '2024-2025 Students': (context) => Students(),
        'Id Card': (context) => Idcard(),
        'Academic': (context) => AcademicProgramScreen(),
        'News': (context) => NewsPage(),
        // 'Admissions & Fee': (context) => Admissionfee(),
        'Publications': (context) => Publications(),
        'Bharat kala Bhavan': (context) => BharaKalaBhavan(),
        'BUAT Forms': (context) => BuatForms(),
        'Holiday Calendar': (context) => HolidayCalendar(),
        'NEP courses': (context) => NEPCourses(),
        'Faculty Search': (context) => FacultySearch(),
        'Emergency Contact': (context) => EmergencyContact(),
        'Grievence': (context) => Grievence(),
        'Update Phone Number': (context) => Updatephone(),
        'Update Email': (context) => UpdateEmail(),
        'profile': (context) => Profilepage(),
        'Library': (context) => Library(),
        '/bandaHomePage': (context) => BandaHomePage(),
        '/instituteListDetailScreen': (context) => InstDetailScreen(),
        '/departmentListDetailScreen': (context) =>
            Departmentlistdetailscreen(),
        '/facultyListDetailScreen': (context) => Facultylistdetailscreen(),
      },
    );
  }
}

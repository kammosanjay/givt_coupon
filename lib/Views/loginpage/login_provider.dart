import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:givt_mobile_app/Views/loginpage/loginmodal.dart';

class LoginProvider extends ChangeNotifier {
  final box = GetStorage();

  String? storedEmail;
  String? storedPassword;
  String? storedName;
  bool isRememberMeChecked = false;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  LoginProvider() {
    // Load from storage when provider starts
    storedEmail = box.read("email");
    storedPassword = box.read("password");
    print("Loaded Email: $storedEmail, Password: $storedPassword");
    isRememberMeChecked = box.read("isRememberMe") ?? false;
    print("-->${isLoggedIn()}");
  }

  /// First-time login: save credentials
  void login(Loginmodal loginmodal) {
    if (isRememberMeChecked) {
      // Save permanently if Remember Me is checked
      box.write("email", loginmodal.email);
      box.write("password", loginmodal.password);
      box.write("isRememberMe", true);
    } else {
      // Only keep in memory for this session
      box.remove("email");
      box.remove("password");
      box.write("isRememberMe", false);
    }

    storedEmail = loginmodal.email;
    storedPassword = loginmodal.password;

    debugPrint("Saved Email: $storedEmail, Password: $storedPassword");

    notifyListeners();
  }

  /// Validate login against stored credentials
  bool validateLogin(String email, String password) {
    final savedEmail = box.read("email");
    final savedPassword = box.read("password");

    return (savedEmail == email && savedPassword == password);
  }

  /// Check if user is logged in
  bool isLoggedIn() {
    return storedEmail != null && storedPassword != null;
  }

  /// Logout and clear credentials
  void logout() {
    bool remember = box.read('isRememberMe') ?? false;

    if (remember) {
      // Do NOT clear email & password, just leave them in storage
      // Only clear runtime/session variables if you have any
      storedEmail = box.read("email") ?? "";
      storedPassword = box.read("password") ?? "";
    } else {
      // Clear everything if not remembered
      box.remove("email");
      box.remove("password");
      box.remove("isRememberMe");
      storedEmail = "";
      storedPassword = "";
    }

    notifyListeners();
  }

  /// Save "Remember Me" preference
  void setRememberMe(bool? value) {
    isRememberMeChecked = value ?? false;
    box.write("isRememberMe", isRememberMeChecked);
    box.write("email", isRememberMeChecked ? storedEmail : null);
    box.write("password", isRememberMeChecked ? storedPassword : null);
    debugPrint("isRememberMe: $isRememberMeChecked");
    print("Stored Email: $storedEmail, Password: $storedPassword");

    notifyListeners();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

  void sendOtp(String phone, BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),

      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto verification (Android only)
        await _auth.signInWithCredential(credential);
        debugPrint("✅ Auto verified and logged in!");
      },

      verificationFailed: (FirebaseAuthException e) {
        debugPrint("❌ Verification failed: ${e.message}");
      },

      codeSent: (String verId, int? resendToken) {
        verificationId = verId; // save for later
        debugPrint("📩 OTP sent to $phone");
        debugPrint("Saved verificationId: $verificationId");
      },

      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
    );
  }

  void verifyOtp(String smsCode) async {
    if (verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );

      try {
        await _auth.signInWithCredential(credential);
        print("🎉 OTP Verified Successfully, User Logged In");
      } catch (e) {
        print("❌ Invalid OTP: $e");
      }
    }
  }

  void saveSignupData(String fullname, String email, String pass) {
    box.write("email", email);
    box.write("password", pass);
    box.write("name", fullname);

    storedEmail = email;
    storedPassword = pass;
    storedName = fullname;

    debugPrint(
      "Saved Email: $storedEmail, Password: $storedPassword, Name: $storedName",
    );

    notifyListeners();
  }
}

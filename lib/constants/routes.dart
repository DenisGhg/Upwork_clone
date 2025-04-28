import 'package:flutter/material.dart';
import 'package:upwork_clone/views/pages/registration_pages/log_in_page.dart';
import 'package:upwork_clone/views/pages/registration_pages/login_with_icloud_onAndroid_page.dart';
import 'package:upwork_clone/views/pages/registration_pages/sign_up_page.dart';
import 'package:upwork_clone/views/pages/registration_pages/success_sign_up_page.dart';
import 'package:upwork_clone/views/pages/registration_pages/verify_mail_page.dart';
import '../views/pages/logo_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/logoPage': (context) => const LogoPage(),
  '/signUpPage' : (context) => const SignUpPage(),
  '/successSignUpPage' : (context) => const SuccessSignUpPage(),
  '/verifyMailPage' : (context) => const VerifyMailPage(),
  '/logInPage' : (context) => const LogInPage(),
  '/loginWithiCloudonAndroidPage' : (context) => LoginWithIcloudOnandroidPage(),
};

class AppRoutes{
  static const String LOGOPAGE = '/logoPage';
  static const String SIGNUPPAGE = '/signUpPage';
  static const String SUCCESSSIGNUPPAGE = '/successSignUpPage';
  static const String VERIFYMAILPAGE = '/verifyMailPage';
  static const String LOGINPAGE = '/logInPage';
  static const String LOGINWITHICLOUDONANDROIDPAGE = '/loginWithiCloudonAndroidPage';
}
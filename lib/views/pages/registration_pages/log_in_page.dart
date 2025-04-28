import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:upwork_clone/constants/images_path.dart';
import 'package:upwork_clone/constants/routes.dart';
import 'package:upwork_clone/widgets/app_button.dart';
import 'package:upwork_clone/widgets/app_text.dart';
import 'package:upwork_clone/widgets/app_textField.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  // For focusNode of mail
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  final TextEditingController _mailController = TextEditingController();
  bool _mailError = false;
  final FocusNode _focusNode = FocusNode();
  // To control appearance of the Fix Container in case of _mailError == true
  bool _viewfix = false;

  /*final Uri _urlApple = Uri.parse("https://www.icloud.com");
  Future<void> _launchUrl() async {
    if (!await launchUrl(_urlApple)) {
      throw Exception('Could not launch $_urlApple');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [

                // If the mail is not entered
                _viewfix
                    ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: [
                          Container(
                            height: screenHeight * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 158, 146, 103),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.018,
                              ),
                              child: AppText(
                                text: "Please fix the errors below",
                                textAlign: TextAlign.center,
                                color: Color.fromARGB(255, 221, 209, 156),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 12,
                            left: 10,
                            child: Icon(
                              Icons.info_outlined,
                              color: Color.fromARGB(255, 221, 209, 156),
                            ),
                          ),

                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _viewfix = false;
                                });
                              },
                              icon: Icon(
                                Icons.close,
                                color: Color.fromARGB(255, 221, 209, 156),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : SizedBox(),
                Image.asset(ImagesPath.logoLetterWhite, height: 140),

                AppText(
                  text: "Log in to Upwork",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),

                SizedBox(height: screenHeight * 0.01),

                //Email Field
                AppTextField(
                  focusNode: _focusNode,
                  controller: _mailController,
                  keyboardType: TextInputType.text,
                  hinText: "Username or Email",
                  prefixIcon: Icon(Icons.person),
                  fieldRaduis: 5,
                  focusedBorderColor:
                      _mailError == false ? Colors.grey : Colors.red,
                ),

                SizedBox(height: screenHeight * 0.01),

                // If the mail is not entered
                _mailError == true
                    ? Row(
                      children: [
                        Icon(Icons.info_outline_rounded, color: Colors.red),
                        SizedBox(width: screenWidth * 0.01),
                        AppText(
                          text: "This field is required",
                          color: Colors.red,
                        ),
                      ],
                    )
                    : SizedBox(),

                SizedBox(height: screenHeight * 0.03),

                //Continue Button
                AppButton(
                  onTap: () {
                    if (_mailController.text.isEmpty) {
                      setState(() {
                        _mailError = true;
                        _viewfix = true;
                      });
                    } else {
                      setState(() {
                        _mailError = false;
                      });
                      Navigator.pushNamed(context, AppRoutes.SIGNUPPAGE);
                    }
                  },
                  height: screenHeight * 0.05,
                  width: double.infinity,
                  radius: 10,
                  backgroundColor: Color.fromARGB(255, 27, 142, 27),
                  child: AppText(
                    text: "Continue",
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Or bar
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.4,
                      height: 1,
                      color: Colors.grey,
                    ),

                    Expanded(
                      child: AppText(
                        text: "or",
                        textAlign: TextAlign.center,
                        color: Colors.white,
                      ),
                    ),

                    Container(
                      width: screenWidth * 0.4,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.03),

                // Continue with google
                AppButton(
                  width: double.infinity,
                  height: screenHeight * 0.05,
                  radius: 5,
                  padding: EdgeInsets.zero,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AppText(
                        text: "Continue with Google",
                        color: Colors.white,
                      ),
                      Positioned(
                        left: 0,
                        child: Container(
                          height: screenHeight * 0.048,
                          width: screenHeight * 0.048,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Image.asset(
                            ImagesPath.logoGoogle,
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                //Continue with Apple
                AppButton(
                  onTap: () {
                    if (Platform.isAndroid) {
                      Navigator.pushNamed(context, AppRoutes.LOGINWITHICLOUDONANDROIDPAGE);
                    } else if (Platform.isIOS) {
                      isIOSBottomSheet(context);
                    }
                  },
                  height: screenHeight * 0.05,
                  width: double.infinity,
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apple, color: Colors.black),
                      AppText(text: "Continue", color: Colors.black),
                    ],
                  ),
                ),

                //

                //Footer text
                SizedBox(
                  height:
                      _viewfix
                          ? (screenHeight * 0.25 - screenHeight * 0.1)
                          : screenHeight * 0.25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: AppText(
                    text:
                        "Upwork uses cookies for analytics, personalized content and ads. By using Upwork's services, you agree to thid use of cookies",
                    color: Colors.grey,
                    fontSize: 12,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//bottomSheet function for connection with apple account on iOS

void isIOSBottomSheet(BuildContext context) {
  int? selectedValue;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (sheetContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: 545,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "Se connecter avec Apple",
                        fontWeight: FontWeight.bold,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(sheetContext);
                        },
                        icon: Icon(Icons.close, size: 25, color: Colors.black),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  //Logo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(ImagesPath.logo, height: 30),
                  ),

                  SizedBox(height: 20),
                  AppText(
                    text:
                    "Créez un compte Upwork Talent avec votre compte Apple",
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(
                            0.5,
                          ), // couleur de l'ombre
                          spreadRadius: 5, // étendue de l'ombre
                          blurRadius: 7, // flou de l'ombre
                          offset: Offset(0, 3), // déplacement de l'ombre (x, y)
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: AppText(text: "Nom"),
                      subtitle: AppText(
                        text: "Bertrand Hounkakou",
                        color: Colors.grey,
                      ),
                      trailing: Icon(Icons.close),
                    ),
                  ),

                  SizedBox(height: 10),

                  //Share mail or not
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(
                            0.5,
                          ), // couleur de l'ombre
                          spreadRadius: 5, // étendue de l'ombre
                          blurRadius: 7, // flou de l'ombre
                          offset: Offset(0, 3), // déplacement de l'ombre (x, y)
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.mail_outline_sharp,
                            color: Colors.grey,
                          ),
                          title: AppText(text: "Partager mon adresse e-mail"),
                          subtitle: AppText(text: "bertrand12@icloud.com", color: Colors.grey,),
                          trailing: Radio(
                            value: 1,
                            activeColor: Colors.blue,
                            groupValue: selectedValue,
                            onChanged: (int? value) {
                              setState((){
                                selectedValue = value;
                              });
                            },
                          ),
                        ),

                        ListTile(
                          leading: SizedBox(),
                          title: AppText(text: "Masquer mon adresse e-mail"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(text: "Transférer à : ", color: Colors.grey,),
                              AppText(text: "bertrand12@iclound.com", color: Colors.grey,)
                            ],
                          ),
                          trailing: Radio(
                            value: 2,
                            groupValue: selectedValue,
                            activeColor: Colors.blue,
                            onChanged: (int? value) {
                              setState((){
                                selectedValue = value;
                              });
                            },
                          ),

                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  //Bouton "Continuer avec code"
                  Expanded(
                    child: AppButton(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: AppText(text: "Continuer avec un code", color: Colors.white, fontWeight: FontWeight.bold, textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
import 'package:flutter/material.dart';

import '../../../constants/images_path.dart';
import '../../../constants/routes.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/app_textField.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _viewfix = false;
  bool _mailError = false;

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // If the password is not entered
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
                Image.asset(ImagesPath.logoLetterWhite, height: 145),
                
                AppText(
                  text: "Welcome",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                
                SizedBox(height: screenHeight * 0.04),
                
                // Mail enter on previous page
                AppText(text: "Mail", color: Colors.white,),
                
                SizedBox(height: screenHeight * 0.02),
                //Password Field
                AppTextField(
                  focusNode: _focusNode,
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  hinText: "Username or Email",
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.white,),
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
                    if (_passwordController.text.isEmpty) {
                      setState(() {
                        _mailError = true;
                        _viewfix = true;
                      });
                    } else {
                      setState(() {
                        _mailError = false;
                      });
                      Navigator.pushNamed(context, AppRoutes.PASSWORDPAGE);
                    }
                  },
                  height: screenHeight * 0.05,
                  width: double.infinity,
                  radius: 10,
                  backgroundColor: Color.fromARGB(255, 27, 142, 27),
                  child: AppText(
                    text: "Log In",
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ),
                
                SizedBox(height: screenHeight * 0.03),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.45,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      child: AppText(text: "Forgot password?", color: Color.fromARGB(255, 27, 142, 27)),
                    ),
                
                    AppButton(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.2,
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      child: AppText(text: "Not you?", color: Color.fromARGB(255, 27, 142, 27)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

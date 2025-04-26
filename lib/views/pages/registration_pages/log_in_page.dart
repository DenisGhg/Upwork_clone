import 'package:flutter/material.dart';
import 'package:upwork_clone/constants/images_path.dart';
import 'package:upwork_clone/widgets/app_button.dart';
import 'package:upwork_clone/widgets/app_text.dart';
import 'package:upwork_clone/widgets/app_textField.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _mailController = TextEditingController();
  String? _mailError;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(ImagesPath.logoLetterWhite, height: 140,),

              AppText(text: "Log in to Upwork", color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),

              SizedBox(height: screenHeight * 0.01,),
              //Email Field
              AppTextField(
                controller: _mailController,
                keyboardType: TextInputType.text,
                hinText: "Username or Email",
                prefixIcon: Icon(Icons.person),
                fieldRaduis: 5,
              ),

              SizedBox(height: screenHeight * 0.03,),

              //Continue Button
              AppButton(
                height: screenHeight * 0.05,
                width: double.infinity,
                radius: 10,
                backgroundColor: Color.fromARGB(255, 27, 142, 27),
                child: AppText(text: "Continue", color: Colors.white, textAlign: TextAlign.center,),
              ),

              SizedBox(height: screenHeight * 0.03,),
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

              SizedBox(height: screenHeight * 0.03,),
              // Continue with google
              AppButton(
                width: double.infinity,
                height: screenHeight * 0.05,
                radius: 5,
                padding: EdgeInsets.zero,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AppText(text: "Continue with Google", color: Colors.white),
                    Positioned(
                      left: 0,
                      child: Container(
                        height: screenHeight * 0.048,
                        width: screenHeight * 0.048,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Image.asset(ImagesPath.logoGoogle, height: 10, width: 10,),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.03,),
              //Continue with Apple
              AppButton(
                height: screenHeight * 0.05,
                width: double.infinity,
                radius: 10,
                backgroundColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.apple, color: Colors.black,),
                    AppText(text: "Continue", color: Colors.black,),
                  ],
                ),
              ),

              Spacer(),
              //Footer text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppText(text: "Upwork uses cookies for analytics, personalized content and ads. By using Upwork's services, you agree to thid use of cookies", color: Colors.grey, fontSize: 12, textAlign: TextAlign.center,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:upwork_clone/constants/images_path.dart';
import 'package:upwork_clone/widgets/app_button.dart';
import 'package:upwork_clone/widgets/app_text.dart';

class VerifyMailPage extends StatefulWidget {
  const VerifyMailPage({super.key});

  @override
  State<VerifyMailPage> createState() => _VerifyMailPageState();
}

class _VerifyMailPageState extends State<VerifyMailPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(1000),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Icon(Icons.person, size: 30,),
        ),
        title: AppText(text: "Verify email", color: Colors.white, fontWeight: FontWeight.bold,),
        actions: [
          Icon(Icons.more_vert, size: 30, color: Colors.white,)
        ],
      ),
      body: Container(
        color: Colors.grey.shade700,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SizedBox(height: 50,),
              Image.asset(ImagesPath.verifyMail, height: 200, width: double.infinity,),
              AppText(text: "Verify your email to continue", color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),

              SizedBox(height: screenHeight * 0.01,),
              AppText(text: "We just sent an email to the adress", color: Colors.grey,),
              AppText(text: "Email Adress", color: Colors.grey,),

              SizedBox(height: screenHeight * 0.01,),
              AppText(text: "Please check your email and select the link", color: Colors.grey,),
              AppText(text: "provided to verify your address", color: Colors.grey,),

              SizedBox(height: screenHeight * 0.08,),
              AppButton(
                onTap: null,
                width: double.infinity,
                height: screenHeight * 0.05,
                backgroundColor: Color.fromARGB(255, 27, 142, 27),
                child: AppText(text: "Go to Gmail Inbox", textAlign: TextAlign.center, color: Colors.white,),
              ),

              SizedBox(height: screenHeight * 0.03,),
              AppButton(
                onTap: null,
                width: double.infinity,
                height: screenHeight * 0.055,
                backgroundColor: Colors.black,
                borderColor: Color.fromARGB(255, 27, 142, 27),
                borderWidth: 2,
                child: AppText(text: "Send again", textAlign: TextAlign.center, color: Color.fromARGB(255, 27, 142, 27),),
              ),

              SizedBox(height: screenHeight * 0.03,),

              AppButton(
                onTap: null,
                width: double.infinity,
                height: screenHeight * 0.055,
                backgroundColor: Colors.transparent,
                child: AppText(text: "Didn't receive email?", color: Color.fromARGB(255, 27, 142, 27), decoration: TextDecoration.underline, decorationColor: Color.fromARGB(255, 27, 142, 27), textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

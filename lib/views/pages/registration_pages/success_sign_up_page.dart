import 'package:flutter/material.dart';
import 'package:upwork_clone/constants/routes.dart';
import 'package:upwork_clone/widgets/app_text.dart';

class SuccessSignUpPage extends StatefulWidget {
  const SuccessSignUpPage({super.key});

  @override
  State<SuccessSignUpPage> createState() => _SuccessSignUpPageState();
}

class _SuccessSignUpPageState extends State<SuccessSignUpPage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.VERIFYMAILPAGE);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 90,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: AppText(
              text: "Congratulations, your account has been created. Let's get you started!",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

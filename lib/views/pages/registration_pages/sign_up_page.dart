import 'package:flutter/material.dart';
import 'package:upwork_clone/constants/routes.dart';
import 'package:upwork_clone/widgets/app_button.dart';
import 'package:upwork_clone/widgets/app_text.dart';
import 'package:upwork_clone/widgets/app_textField.dart';

import '../../../constants/images_path.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  // Variables d'erreur
  String? firstNameError;
  String? lastNameError;
  String? emailError;
  String? passwordError;
  String? countryError;
  String? checkboxError;

  // Fonction pour valider les informations
  bool validate() {
    bool isValid = true;
    setState(() {
      firstNameError = firstNameController.text.isEmpty ? 'First name is required' : null;
      lastNameError = lastNameController.text.isEmpty ? 'Last name is required' : null;
      emailError = emailController.text.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)
          ? 'Please enter a valid email'
          : null;
      passwordError = passwordController.text.isEmpty || passwordController.text.length < 6
          ? 'Password must be at least 6 characters'
          : null;
      checkboxError = !_isChecked2 ? 'You must accept the terms and conditions' : null;

      // Vérification des champs de texte
      if (firstNameError != null || lastNameError != null || emailError != null || passwordError != null || checkboxError != null) {
        isValid = false;
      }
    });
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //espace
              SizedBox(height: 40),

              //logo
              Center(
                child: Image.asset(
                  width: screenWidth * 0.4,
                  ImagesPath.logoLetter,
                ),
              ),

              //espace
              SizedBox(height: screenHeight * 0.01),

              AppText(
                text: "Sign up to find work you love",
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),

              //espace
              SizedBox(height: screenHeight * 0.01),

              //Bouton continue with google
              AppButton(
                width: double.infinity,
                height: screenHeight * 0.05,
                radius: 30,
                padding: EdgeInsets.zero,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AppText(text: "Continue with Google", color: Colors.white),
                    Positioned(
                      left: 0,
                      child: Container(
                        height: screenHeight * 0.05,
                        width: screenHeight * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            (screenHeight * 0.06) / 2,
                          ),
                        ),
                        child: Image.asset(ImagesPath.logoGoogle),
                      ),
                    ),
                  ],
                ),
              ),

              //espace
              SizedBox(height: screenHeight * 0.01),

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

              //Fields
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: "First name", color: Colors.white),
                      SizedBox(
                        width: screenWidth * 0.45,
                        child: AppTextField(
                          controller: firstNameController,
                          keyboardType: TextInputType.text,
                          hinText: 'First name',
                          onChanged: (text) {
                            setState(() {
                              firstNameError = null;
                            });
                          },
                        ),
                      ),
                      if (firstNameError != null)
                        AppText(
                          text: firstNameError!,
                          color: Colors.red,
                          fontSize: 12,
                        ),
                    ],
                  ),
                  //espace
                  Expanded(child: SizedBox()),
                  Column(
                    children: [
                      AppText(text: "Last name", color: Colors.white),
                      SizedBox(
                        width: screenWidth * 0.45,
                        child: AppTextField(
                          controller: lastNameController,
                          keyboardType: TextInputType.text,
                          hinText: 'Last name',
                          onChanged: (text) {
                            setState(() {
                              lastNameError = null;
                            });
                          },
                        ),
                      ),
                      if (lastNameError != null)
                        AppText(
                          text: lastNameError!,
                          color: Colors.red,
                          fontSize: 12,
                        ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.01),
              AppText(text: "Email", color: Colors.white),
              AppTextField(
                controller: emailController,
                keyboardType: TextInputType.text,
                hinText: "Enter your email address",
                onChanged: (text) {
                  setState(() {
                    emailError = null;
                  });
                },
              ),
              if (emailError != null)
                AppText(
                  text: emailError!,
                  color: Colors.red,
                  fontSize: 12,
                ),

              SizedBox(height: screenHeight * 0.01),
              AppText(text: "Password", color: Colors.white),
              AppTextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                hinText: "Create Password",
                obscureText: _obscureText,
                onChanged: (text) {
                  setState(() {
                    passwordError = null;
                  });
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              if (passwordError != null)
                AppText(
                  text: passwordError!,
                  color: Colors.red,
                  fontSize: 12,
                ),

              SizedBox(height: screenHeight * 0.01),
              AppText(text: "Country", color: Colors.white),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.black,
                value: 'Benin',
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue.shade900,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Benin', child: Text('Benin')),
                  DropdownMenuItem(value: 'Togo', child: Text('Togo')),
                  DropdownMenuItem(
                    value: 'Côte d’Ivoire',
                    child: Text('Côte d’Ivoire'),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    countryError = null;
                  });
                },
              ),
              if (countryError != null)
                AppText(
                  text: countryError!,
                  color: Colors.red,
                  fontSize: 12,
                ),

              //Accepter les conditions
              CheckboxListTile(
                value: _isChecked1,
                onChanged: (value) {
                  setState(() => _isChecked1 = value!);
                },
                title: AppText(
                  text: "Send me helpful emails to find rewarding work and jobs leads",
                  color: Colors.white,
                ),
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                checkboxScaleFactor: 1.5,
                checkColor: Color.fromARGB(255, 27, 142, 27),
                activeColor: Colors.white,
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                splashRadius: 0,
                enableFeedback: false,
              ),
              CheckboxListTile(
                value: _isChecked2,
                onChanged: (value) {
                  setState(() => _isChecked2 = value!);
                },
                title: AppText(
                  text: "I accept the terms and conditions",
                  color: Colors.white,
                ),
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                checkboxScaleFactor: 1.5,
                checkColor: Color.fromARGB(255, 27, 142, 27),
                activeColor: Colors.white,
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                splashRadius: 0,
                enableFeedback: false,
              ),
              if (checkboxError != null)
                AppText(
                  text: checkboxError!,
                  color: Colors.red,
                  fontSize: 12,
                ),

              //espace
              SizedBox(height: screenHeight * 0.05),

              AppButton(
                width: double.infinity,
                height: screenHeight * 0.06,
                radius: 20,
                backgroundColor: Color.fromARGB(255, 27, 142, 27),
                child: AppText(
                  text: "Create Account",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  if (validate()) {
                    Navigator.pushNamed(context, AppRoutes.SUCCESSSIGNUPPAGE);
                  }
                },
              ),

              //espace
              SizedBox(height: screenHeight * 0.02),

              SizedBox(height: screenHeight * 0.01),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white, fontSize: 16,),
                    children: [
                      TextSpan(text: "Already have an account? ",),
                      TextSpan(text: "Log In", style: TextStyle(color: Color.fromARGB(255, 27, 142, 27), decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

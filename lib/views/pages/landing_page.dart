import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:upwork_clone/constants/routes.dart';
import 'package:upwork_clone/views/colors/app_colors.dart';

import '../../constants/images_path.dart';
import '../models_ui/landing_item_view.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<LandingItem> _landingItems = [
    LandingItem(
      imgPath: ImagesPath.findWork,
      title: "Find great work",
      description:
          "Meet clients ou're excited to work with and grow your independent career or business",
    ),
    LandingItem(
      imgPath: ImagesPath.findOpportunities,
      title: "Find opportunities for every stage of your freelance career",
      description: "Search and apply for jobs, sav job searches and more.",
    ),
    LandingItem(
      imgPath: ImagesPath.collaborate,
      title: "Collaborate on the go",
      description: "Chat, share files, and sahre progress.",
    ),
  ];

  int currentIndex = 0;
  final controller = PageController(keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //espace
          SizedBox(height: 50),

          //logo
          Center(
            child: Image.asset(
              width: MediaQuery.of(context).size.width * 0.4,
              ImagesPath.logoLetter,
            ),
          ),

          //presentation
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: PageView.builder(
              controller: controller,
              itemCount: _landingItems.length,
              itemBuilder: (context, index) {
                return LandingItemViewModel(item: _landingItems[index]);
              },
            ),
          ),

          // dot indicator
          SmoothPageIndicator(
            controller: controller, // PageController
            count: _landingItems.length,
            effect: WormEffect(
              activeDotColor: AppColors.primaryColor,
              dotColor: Colors.grey.shade400,
            ), // your preferred effect
            onDotClicked: (index) {},
          ),

          //espace
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),

          // bouton de connexion
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.4,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                //Navigator.pushNamed(context, '/login');
              },
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //espace
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),

          // texte d'inscription
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.SIGNUPPAGE);
            },
            child: Text(
              "New to Upwork? Sign Up",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

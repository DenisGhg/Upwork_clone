import 'package:flutter/material.dart';

class LandingItemViewModel extends StatelessWidget {
  final LandingItem item;
  const LandingItemViewModel({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //image
        Image.asset(
          height: MediaQuery.of(context).size.height * 0.4,
          item.imgPath,
        ),

        //titre
        Padding(
          padding: const EdgeInsets.only(
            right: 50.0,
            left: 50,
            bottom: 10,
            top: 20,
          ),
          child: Text(
            textAlign: TextAlign.center,
            item.title,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),

        //description
        Padding(
          padding: const EdgeInsets.only(right: 50.0, left: 50),
          child: Text(
            textAlign: TextAlign.center,
            item.description,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          ),
        ),
      ],
    );
  }
}

// modèle de données
class LandingItem {
  String imgPath;
  String title;
  String description;

  LandingItem({
    required this.imgPath,
    required this.title,
    required this.description,
  });
}

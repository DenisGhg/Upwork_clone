import 'package:flutter/material.dart';
import 'package:upwork_clone/constants/routes.dart';

//=====================
// FONCTION MAIN
//=====================
void main() {
  runApp(const MyApp());
}

//=====================
// CLASS MYAPP
//=====================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upwork for freelances',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoutes.LOGOPAGE,
      routes: routes,
    );
  }
}

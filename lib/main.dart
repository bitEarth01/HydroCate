import 'package:flutter/material.dart';
import 'package:visual_water/config/sizeconfig.dart';
import 'package:visual_water/landingpage.dart';
import 'package:visual_water/onboarding/onboardingscreen.dart';
import 'package:visual_water/onboarding/openingpage.dart';

void main() {
  // Initialize SizeConfig
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Define the initial route
      routes: {
        '/': (context) =>
            const OpeningPage(), // Define the route for the opening page
        '/landing': (context) => const LandingPage(),
        '/onboarding': (context) =>
            const Onboarding(), // Define the route for the landing page
      },
    );
  }
}

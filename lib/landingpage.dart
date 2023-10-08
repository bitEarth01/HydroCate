import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage/homepage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromRGBO(208, 227, 255, 1),
              Color.fromRGBO(152, 193, 255, 1),
              Color.fromRGBO(128, 171, 255, 1),
            ],
            radius: 1.0, // Adjust the radius as needed
            center: Alignment.topLeft,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: height * 0.4,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(191),
                  ),
                )),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 30),
              child: Text(
                'Know The Water \nAround You In A Better Way',
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                // style: TextStyle(
                //     fontSize: 32,
                //     fontWeight: FontWeight.w500,
                //     fontFamily: 'Inter'),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              width: width * 0.85,
              child: Text(
                'We have created a light color scheme with purple accents. 🔮 Purple is associated with art, spirituality, and ability to cope with hardships. Here it motivates users to practice their habits and inspires them to achieve more gradually.',
                style: GoogleFonts.inter(
                  fontSize: 16,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: SizedBox(
                  height: height * 0.06,
                  width: width * 0.8,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Get Started',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(255, 88, 146, 255)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:visual_water/config/sizeconfig.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/openingwater.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.blockV! * 20, // Adjust the top value as needed
            left: SizeConfig.blockH! * 2, // Adjust the left value as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockH! * 4,
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Everything Starts\nWith Water",
                        speed: const Duration(milliseconds: 60),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ),
                SizedBox(height: SizeConfig.blockV! * 3),
                Text(
                  "//manoj think of a good sentence here",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.blockH! * 2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.blockV! * 6),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/onboarding');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(1),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.blockH! * 15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockV! * 1,
                    horizontal: SizeConfig.blockH! * 5,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w300,
                      fontSize: SizeConfig.blockH! * 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

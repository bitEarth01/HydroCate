import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

class WaterCyclePage extends StatefulWidget {
  const WaterCyclePage({Key? key}) : super(key: key);

  @override
  State<WaterCyclePage> createState() => _WaterCyclePageState();
}

class _WaterCyclePageState extends State<WaterCyclePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    FlutterGifController controller = FlutterGifController(vsync: this);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: const EdgeInsets.only(left: 68),
                        child: const Text(
                          'Water Cycle',
                          style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 10, 71, 112),
                          ),
                        ),
                      ),
                    ),

                    // height: 50, width: 50),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(children: [
                    Image.asset(
                      'assets/watercycle/watercycle.png',
                      height: height * 0.3,
                      width: width * 0.9,
                    ),
                    const Text(
                      'The water resources plays a fundamental role in the Earth’s system. It shapes our planet’s climate and weather by absorbing, storing, and transporting large quantities of heat, water, moisture, and carbon dioxide.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 10, 71, 112),
                      ),
                    ),
                    const Text(
                      '***',
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 10, 71, 112),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     GifImage(
                    //       controller: controller,
                    //       image: AssetImage("assets/gifs/watercycle.gif"),
                    //       width: width * 0.4,
                    //       height: height * 0.4,
                    //     ),
                    const SizedBox(
                      height: 20,
                    ),

                    const Text(
                      'What Is Water Cycle?',
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 10, 71, 112),
                      ),
                    ),
                    const Text(
                      'The water cycle is like a big, never-ending adventure for water. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 10, 71, 112),
                      ),
                    ),
                    const Text(
                      'Throughout the adventure there are few important stages, which we are gonne get to know today!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 10, 71, 112),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'The Stages Constitute: ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 10, 71, 112),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 10, 71, 112),
                            width: 4.0,
                            style: BorderStyle.solid), //Border.all

                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 10, 71, 112),
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/watercycle/Evaporation.jpg',
                            height: height * 0.3,
                            width: width * 0.9,
                          ),
                          const Text(
                            'Evaporation',
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                          const Text(
                            " This is when the sun makes water from oceans, lakes, and rivers turn into tiny, invisible water vapor in the sky. It's like water disappearing into the air!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 10, 71, 112),
                            width: 4.0,
                            style: BorderStyle.solid), //Border.all

                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 10, 71, 112),
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/watercycle/Condensation.jpg',
                            height: height * 0.3,
                            width: width * 0.9,
                          ),
                          const Text(
                            'Condensation',
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                          const Text(
                            "Next, the water vapor in the sky cools down and comes together to make clouds. You know those fluffy things you see up there? They're like a bunch of tiny water droplets huddling together",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 10, 71, 112),
                            width: 4.0,
                            style: BorderStyle.solid), //Border.all

                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 10, 71, 112),
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/watercycle/Precipitation.jpg',
                            height: height * 0.3,
                            width: width * 0.9,
                          ),
                          const Text(
                            'Precipitation',
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                          const Text(
                            "When the clouds get really heavy, the water droplets join up and fall to the ground as rain, snow, or hail. It's like the clouds sharing their water with us.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 10, 71, 112),
                            width: 4.0,
                            style: BorderStyle.solid), //Border.all

                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 10, 71, 112),
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/watercycle/Collection.jpg',
                            height: height * 0.3,
                            width: width * 0.9,
                          ),
                          const Text(
                            'Collection',
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                          const Text(
                            "The water from rain and snow gathers in rivers, lakes, and oceans. It's where all the water gets together to take a break.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 10, 71, 112),
                            width: 4.0,
                            style: BorderStyle.solid), //Border.all

                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 10, 71, 112),
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/watercycle/Infiltration.jpg',
                            height: height * 0.3,
                            width: width * 0.9,
                          ),
                          const Text(
                            'Infiltration',
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                          const Text(
                            "Some water soaks into the ground, like when you water plants. It goes down into the soil and can even end up underground.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 10, 71, 112),
                            width: 4.0,
                            style: BorderStyle.solid), //Border.all

                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 10, 71, 112),
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/watercycle/Transpiration.jpg',
                            height: height * 0.3,
                            width: width * 0.9,
                          ),
                          const Text(
                            'Transpiration',
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                          const Text(
                            "Plants are a part of this adventure too! They release water into the air through their leaves. It's like they're breathing out water.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 10, 71, 112),
                            width: 4.0,
                            style: BorderStyle.solid), //Border.all

                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 10, 71, 112),
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/watercycle/Runoff.jpg',
                            height: height * 0.3,
                            width: width * 0.9,
                          ),
                          const Text(
                            'Runoff',
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                          const Text(
                            "Sometimes, when the ground can't hold any more water, it runs over the surface and joins rivers and streams, starting the whole adventure over again.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 10, 71, 112),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //   ],
                    // )
                    // const Text(
                    //   'The water resources plays a fundamental role in the Earth’s system. It shapes our planet’s climate and weather by absorbing, storing, and transporting large quantities of heat, water, moisture, and carbon dioxide.',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontFamily: "Ubuntu",
                    //     fontSize: 25,
                    //     fontWeight: FontWeight.w500,
                    //     color: Color.fromARGB(255, 10, 71, 112),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                        'So, the water cycle is like a never-ending journey for water, going up to the sky, coming down as rain, and traveling all around the Earth, helping plants, animals, and people along the way!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 10, 71, 112),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Thank You',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 10, 71, 112),
                        )),
                    const Text('***',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 10, 71, 112),
                        )),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

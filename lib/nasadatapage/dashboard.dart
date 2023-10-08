import 'package:flutter/material.dart';

import 'missions.dart';
import 'watercycle.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dashboard(),
    );
  }
}

class CardData {
  final String heading;
  final String description;
  final String imagePath;

  CardData({
    required this.heading,
    required this.description,
    required this.imagePath,
  });
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<CardData> cardDataList = [
    CardData(
      heading: 'Water Cycle',
      description:
          'Explore the Fascinating Journey of Water and how it sustains Life on our Planet',
      imagePath: 'assets/images/watercycle.png',
    ),
    CardData(
      heading: 'Missions',
      description: 'Delve Deeper into vital missions like SWOT,GPM and SAMP',
      imagePath: 'assets/images/missions.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 185, 228, 254),
      body: SafeArea(
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
                    padding: const EdgeInsets.only(left: 70),
                    child: const Text(
                      'Infographics',
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 10, 71, 112),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: cardDataList.length,
                itemExtent: 150,
                itemBuilder: (context, i) {
                  final cardData = cardDataList[i];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (cardData.heading == 'Water Cycle') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WaterCyclePage(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MissionsPage(),
                              ),
                            );
                          }
                        },
                        child: Card(
                          // color: const Color.fromARGB(255, 0, 128, 202),
                          elevation: 10,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 35, 179, 251),
                                  Color.fromARGB(255, 5, 87, 135)
                                ],
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 0, 128, 202),
                                      image: DecorationImage(
                                        image: AssetImage(cardData.imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(75.0)),
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 7.0,
                                            color: Colors.black)
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        cardData.heading,
                                        style: const TextStyle(
                                          fontFamily: "Ubuntu",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        cardData.description,
                                        style: const TextStyle(
                                          fontFamily: "Ubuntu",
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Adjust the height as needed
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

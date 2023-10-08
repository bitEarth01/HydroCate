import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'widgets/infogrid.dart';
import 'widgets/planets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInteracting = false;

  List<String> infographData = [
    'CO2',
    'Global Temperature',
    'Methane',
    'Arctic Sea Extent',
    'Ice Sheets',
    'Sea Level',
    'Ocean Warming'
  ];

  List<String> value = [
    '420',
    '1.1',
    '1923.6',
    '12.3',
    '424',
    '4',
    '345',
  ];

  List<String> Units = [
    'parts per million',
    '°C since preindustrial',
    'parts per billion',
    'percent per decade since 1979',
    'billion metric tons per year',
    'inches since 1993',
    'zettaJoules since 1955'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromRGBO(94, 201, 250, 1),
                Color.fromRGBO(195, 236, 255, 1),
                Color.fromRGBO(195, 236, 255, 0),
              ],
            ),
          ),
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Weather And Water',
                                style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal),
                              )),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Earth',
                              style: GoogleFonts.inter(
                                  fontSize: 24, fontWeight: FontWeight.w800),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(children: [
                    Align(
                        alignment: Alignment.center,
                        child: Transform.translate(
                            offset: const Offset(0, 80),
                            child: const CircularProgressIndicator())),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isInteracting = !isInteracting;
                          });
                        },
                        child: !isInteracting
                            ? Planet(
                                key: const Key('Planet1'),
                                interative: false,
                              )
                            : Planet(
                                key: const Key('Planet2'),
                                interative: true,
                              ),
                      ),
                    ),
                  ]),
                  InfoDoubleGrid(
                    name: infographData[0],
                    unit: Units[0],
                    value: value[0],
                    name1: infographData[2],
                    unit1: Units[2],
                    value1: value[2],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InfoGraphGrid(
                    name: infographData[1],
                    unit: Units[1],
                    value: value[1],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InfoDoubleGrid(
                    name: infographData[4],
                    unit: Units[4],
                    value: value[4],
                    name1: infographData[5],
                    unit1: Units[5],
                    value1: value[5],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InfoGraphGrid(
                    name: infographData[3],
                    unit: Units[3],
                    value: value[3],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  InfoGraphGrid(
                    name: infographData[6],
                    unit: Units[6],
                    value: value[6],
                  ),
                  // Container(
                  //   child: ListView.builder(
                  //       physics: NeverScrollableScrollPhysics(),
                  //       shrinkWrap: true,
                  //       // gridDelegate:
                  //       //     const SliverGridDelegateWithFixedCrossAxisCount(
                  //       //   crossAxisCount: 3,
                  //       // ),
                  //       itemCount: infographData.length, //
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return InfoGraphGrid(
                  //           name: infographData[index],
                  //           unit: Units[index],
                  //           value: value[index],
                  //         );
                  //       }),
                  // ),
                  Container(
                    height: 250,
                    child: Flexible(
                        child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(0, 0),
                        zoom: 0.0,
                        onTap: (_, latlng) {
                          print(latlng);
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName:
                              'dev.fleaflet.flutter_map.example',
                        ),
                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

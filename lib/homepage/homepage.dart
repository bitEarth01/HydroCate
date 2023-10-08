import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:visual_water/homepage/modals/mapdata.dart';
import 'package:visual_water/nasadatapage/dashboard.dart';

import 'widgets/infogrid.dart';
import 'widgets/planets.dart';

class HomePage extends StatefulWidget {
  const HomePage();

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
  ClimateData _climateData = ClimateData(
    dailyUnits: {},
    dailyData: {},
  );

  Future<void> fetchData(String Lat, String Long) async {
    final url = Uri.parse(
        'https://climate-api.open-meteo.com/v1/climate?latitude=${Lat}&longitude=${Long}&start_date=2023-10-08&end_date=2023-10-08&models=CMCC_CM2_VHR4,FGOALS_f3_H,HiRAM_SIT_HR,MRI_AGCM3_2_S,EC_Earth3P_HR,MPI_ESM1_2_XR,NICAM16_8S&daily=temperature_2m_mean,shortwave_radiation_sum,relative_humidity_2m_mean,dewpoint_2m_mean,precipitation_sum,rain_sum,pressure_msl_mean,soil_moisture_0_to_10cm_mean,et0_fao_evapotranspiration_sum');

    try {
      final response = await http.get(url);
      print('started');
      if (response.statusCode == 200) {
        print('object');
        print(response.body);
        final decodedData = json.decode(response.body);
        final climateData = ClimateData.fromJson(decodedData);
        print('1');
        // Format and extract the data you need here
        print(climateData);
        setState(() {
          _climateData = climateData;
        });
      } else {
        setState(() {
          _climateData = ClimateData(
            dailyUnits: {},
            dailyData: {},
          );
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _climateData = ClimateData(
          dailyUnits: {},
          dailyData: {},
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromRGBO(35, 179, 251, 1),
                Color.fromRGBO(223, 241, 255, 1),
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
                    children: [
                      Align(
                        child: Column(
                          children: [
                            Icon(
                              Icons.backpack,
                              size: 30,
                            ),
                            /*SizedBox(height: 5),
                            Text(
                              'Learn More',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),*/
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Dashboard(),
                              ),
                            );
                          },
                          child:
                              Align(child: Icon(Icons.book_online, size: 30))),
                    ],
                  ),
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
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              )),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Earth',
                              style: TextStyle(
                                  fontFamily: "Ubuntu",
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromARGB(255, 7, 45, 74)),
                            ),
                          ),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)),
                    height: 300,
                    child: Flexible(
                        child: FlutterMap(
                      options: MapOptions(
                        center: const LatLng(0, 0),
                        zoom: 0.0,
                        onTap: (_, latlng) {
                          print(latlng);
                          fetchData(latlng.latitude.toString(),
                              latlng.longitude.toString());
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

// ignore_for_file: must_be_immutable, depend_on_referenced_packages, non_constant_identifier_names, avoid_print, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:flutter_wall_layout/wall_builder.dart';

import 'modals/mapdata.dart';

class MapsPage extends StatefulWidget {
  LatLng? latLng;
  MapsPage({Key? key, required this.latLng}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  final bool _reversed = false;
  final Axis _direction = Axis.vertical;
  final int _nbLayers = 3;
  late List<Stone> _stones;
  ClimateData _climateData = ClimateData(
    dailyUnits: {},
    dailyData: {},
  );

  Future<void> fetchData(String Lat, String Long) async {
    final url = Uri.parse(
        'https://climate-api.open-meteo.com/v1/climate?latitude=$Lat&longitude=$Long&start_date=2023-10-08&end_date=2023-10-08&models=EC_Earth3P_HR&daily=temperature_2m_mean,shortwave_radiation_sum,relative_humidity_2m_mean,dewpoint_2m_mean,precipitation_sum,rain_sum,pressure_msl_mean,soil_moisture_0_to_10cm_mean,et0_fao_evapotranspiration_sum');

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
          print(_climateData.dailyUnits);
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
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _controller.forward(from: 0);

    _stones = [];
    dataCall();

    // await fetchData(widget.latLng!.latitude.toString(),
    //     widget.latLng!.longitude.toString());
  }

  void dataCall() async {
    await fetchData(widget.latLng!.latitude.toString(),
        widget.latLng!.longitude.toString());
    setState(() {
      _stones = _buildStonesList(_climateData);
    });
  }

  List<Stone> _buildStonesList(ClimateData _data) {
    final data = [
      {
        "color": const Color.fromARGB(255, 0, 128, 202),
        "width": 2,
        "height": 2,
        "name": "Mean Temperature",
        "value": _data.dailyData['temperature_2m_mean'][0],
        "units": _data.dailyUnits['temperature_2m_mean']
      },
      {
        "color": const Color.fromARGB(255, 0, 102, 164),
        "width": 1,
        "height": 1,
        "name": "Radiation Sum",
        "value": _data.dailyData['shortwave_radiation_sum'][0],
        "units": _data.dailyUnits['shortwave_radiation_sum']
      },
      {
        "color": const Color.fromARGB(255, 0, 102, 164),
        "width": 3,
        "height": 1,
        "name": "Mean Humidity",
        "value": _data.dailyData['relative_humidity_2m_mean'][0],
        "units": _data.dailyUnits['relative_humidity_2m_mean']
      },
      {
        "color": const Color.fromARGB(255, 0, 160, 237),
        "width": 1,
        "height": 1,
        "name": "Dewpoint",
        "value": _data.dailyData['dewpoint_2m_mean'][0],
        "units": _data.dailyUnits['dewpoint_2m_mean']
      },
      {
        "color": const Color.fromARGB(255, 123, 209, 254),
        "width": 2,
        "height": 1,
        "name": "Precipitation Sum",
        "value": _data.dailyData['precipitation_sum'][0],
        "units": _data.dailyUnits['precipitation_sum']
      },
      {
        "color": const Color.fromARGB(255, 123, 209, 254),
        "width": 1,
        "height": 1,
        "name": "Rainsum",
        "value": _data.dailyData['rain_sum'][0],
        "units": _data.dailyUnits['rain_sum']
      },
      {
        "color": const Color.fromARGB(255, 0, 102, 164),
        "width": 1,
        "height": 1,
        "name": "Sea Level Pressure",
        "value": _data.dailyData['pressure_msl_mean'][0],
        "units": _data.dailyUnits['pressure_msl_mean']
      },
      {
        "color": const Color.fromARGB(255, 123, 209, 254),
        "width": 1,
        "height": 1,
        "name": "Soil Moisture",
        "value": _data.dailyData['soil_moisture_0_to_10cm_mean'][0],
        "units": _data.dailyUnits['soil_moisture_0_to_10cm_mean']
      },
      // {"color": Colors.purple, "width": 2, "height": 1},
      {
        "color": const Color.fromARGB(255, 123, 209, 254),
        "width": 1,
        "height": 1,
        "name": "Evapotranspiration",
        "value": _data.dailyData['et0_fao_evapotranspiration_sum'][0],
        "units": _data.dailyUnits['et0_fao_evapotranspiration_sum']
      },
      // {"color": Colors.cyanAccent, "width": 1, "height": 1},
      // {"color": Colors.orange, "width": 1, "height": 1},

      // {"color": Colors.pink, "width": 2, "height": 1},
      // {"color": Colors.blueAccent, "width": 1, "height": 1},

      // {"color": Colors.teal, "width": 2, "height": 1},
      // {"color": Colors.lightGreenAccent, "width": 1, "height": 1},
      // {"color": Colors.deepOrange, "width": 1, "height": 1},
      // {"color": Colors.deepPurpleAccent, "width": 2, "height": 2},
      // {"color": Colors.lightBlueAccent, "width": 1, "height": 1},
      // {"color": Colors.limeAccent, "width": 1, "height": 1},
    ];
    return data.map((d) {
      int width = d["width"] as int;
      int height = d["height"] as int;
      return Stone(
        id: data.indexOf(d),
        width: width,
        height: height,
        child: __buildStoneChild(
          background: d["color"] as Color,
          text: d["name"].toString(),
          surface: (width * height).toDouble(),
          width: width.toDouble(),
          height: height.toDouble(),
          unit: d["units"].toString(),
          value: d["value"].toString(),
        ),
      );
    }).toList();
  }

  Widget __buildStoneChild({
    required Color background,
    required String text,
    required double surface,
    required double width,
    required double height,
    required String unit,
    required String value,
  }) {
    if (width > height) {
      return ScaleTransition(
        scale: CurveTween(curve: Interval(0.0, min(1.0, 0.25 + surface / 6.0)))
            .animate(_controller),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                background,
                Color.alphaBlend(background.withOpacity(0.6), Colors.black)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate the maximum font size that fits both width and height
              double maxWidth = constraints.maxWidth;
              double maxHeight = constraints.maxHeight;
              double fontSize = max(maxWidth / text.length, maxHeight);

              return Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              text,
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSize * 0.2),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontFamily: "Ubuntu",
                                  color: Colors.white,
                                  fontSize: fontSize),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  unit,
                                  style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      color: Colors.white,
                                      fontSize: fontSize * 0.2),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    } else {
      return ScaleTransition(
        scale: CurveTween(curve: Interval(0.0, min(1.0, 0.25 + surface / 6.0)))
            .animate(_controller),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                background,
                Color.alphaBlend(background.withOpacity(0.6), Colors.black)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate the maximum font size that fits both width and height
              double maxWidth = constraints.maxWidth;
              double maxHeight = constraints.maxHeight;
              double fontSize = max(maxWidth / text.length, maxHeight);

              return Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.white, fontSize: fontSize * 0.4),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          unit,
                          style: TextStyle(
                              color: Colors.white, fontSize: fontSize * 0.1),
                        ),
                      )),
                  const Spacer(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            text,
                            style: TextStyle(
                                color: Colors.white, fontSize: fontSize * 0.2),
                          ),
                        ),
                      ))
                ],
              );
            },
          ),
        ),
      );
    }
  }

  Widget buildWallLayout() {
    return WallLayout(
      wallBuilder: WallBuilder.standard(),
      scrollDirection: _direction,
      stones: _stones,
      reverse: _reversed,
      layersCount: _nbLayers,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _stones.isNotEmpty
          ? Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 223, 241, 255), // Start color
                    Color.fromARGB(255, 123, 209, 254), // End color
                  ],
                ),
              ),
              child: SafeArea(
                minimum:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                              'Climate Data',
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
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 223, 241, 255), // Start color
                              Color.fromARGB(255, 123, 209, 254), // End color
                            ],
                          ),
                        ),
                        child: buildWallLayout(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
// <<<<<<< HEAD
// =======
//       body: _stones.isNotEmpty
//           ? buildWallLayout()
//           : Center(child: CircularProgressIndicator()),
// >>>>>>> 75c75dda6b85dd706e779499c57d6ea6bfcc8457
    );
  }
}

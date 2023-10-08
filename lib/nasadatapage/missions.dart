import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Mission {
  final String name;
  final String description;
  final List<String> images;

  Mission(
      {required this.name, required this.description, required this.images});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MissionsPage(),
    );
  }
}

class MissionsPage extends StatelessWidget {
  final List<Mission> missions = [
    Mission(
      name: 'SWOT Mission',
      description:
          "SWOT (Surface Water and Ocean Topography) is a mission designed to measure water levels in the Earth's oceans and on land. It's equipped with a special radar instrument called Ka-Band Radar Interferometer (KaRIn) that can do something unique.In the oceans, SWOT will help scientists understand how water moves on a small scale, around 15 kilometers and larger. Current tools can only see bigger patterns, but SWOT will focus on smaller details like eddies, currents, and turbulence. This information is crucial for studying how the ocean circulates and how it affects things like heat and carbon in the climate.On land, SWOT will measure changes in water stored in lakes, rivers, and other water bodies. It can even estimate the flow of water in large rivers. This is essential for understanding how freshwater is stored and distributed on Earth.Overall, SWOT's advanced radar technology will provide valuable data for studying climate change, managing coastal areas, predicting floods, and managing water resources. It's like giving scientists a powerful new tool to explore and protect our planet's water systems.",
      images: [
        'assets/images/swot1.jpeg',
        'assets/images/swot2.jpeg',
        'assets/images/swot3.jpeg'
      ],
    ),
    Mission(
      name: 'SMAP Mission',
      description:
          "The Soil Moisture Active Passive (SMAP) mission is an innovative initiative revolutionizing environmental understanding.\nIts advanced radar and radiometer systems provide precise soil moisture measurements, crucial for monitoring droughts, predicting floods, optimizing crop productivity, refining weather forecasts, and unraveling the interplay of water, energy, and carbon cycles.\nThis mission holds substantial significance in safeguarding lives, livelihoods, and the environment from climate change impacts.Monitoring Environmental Dynamics: SMAP offers high-precision soil moisture data vital for early drought warnings, averting agricultural droughts, minimizing economic losses, and managing floods, reducing casualties and property damage.Enhancing Agricultural Sustainability: SMAP's precise soil moisture information aids in efficient irrigation planning, improving crop growth, yield forecasts, and global food security, aligning with sustainable agricultural practices amidst changing climates.Optimizing Weather Forecasts: By contributing to refined weather predictions through insights into soil moisture dynamics, SMAP supports better preparedness and management of weather-related emergencies, essential for societal resilience.",
      images: [
        'assets/images/smap1.jpeg',
        'assets/images/smap3.jpeg',
        'assets/images/smap4.png'
      ],
    ),
    Mission(
        name: 'GRACE FO Mission',
        description:
            "The Gravity Recovery and Climate Experiment Follow-on (GRACE-FO) mission, a collaboration between NASA and the German Research Centre for Geosciences (GFZ), succeeds the original GRACE mission launched in 2002. Launched in 2018, GRACE-FO continues to track Earth's water movement, offering vital data to monitor underground water storage, large water bodies, soil moisture, ice sheets, glaciers, and sea levels influenced by water additions to the ocean. These insights are fundamental for understanding Earth's climate and have extensive societal benefits. At the core of GRACE-FO's data acquisition are precise measurements of the distance between twin satellites orbiting Earth approximately 137 miles apart. They employ advanced technologies, including a microwave ranging system based on GPS technology and a highly sensitive accelerometer that measures forces, including gravity and atmospheric drag. These technologies allow for exceptionally precise distance measurements, roughly equivalent to the diameter of a blood cell. GRACE-FO's orbit at a 304-mile altitude enables comprehensive observations of Earth's surface, in both daylight and darkness, occurring approximately every 99 minutes. This orbit facilitates detailed monitoring of Earth's water distribution and movement, underscoring the mission's contribution to our understanding of the Earth's climate system.",
        images: ['assets/images/gracefo1.jpeg', 'assets/images/gracefo2.jpeg']),
    Mission(
        name: 'GPM Mission',
        description:
            "The Global Precipitation Measurement (GPM) mission, succeeding the Tropical Rainfall Measuring Mission (TRMM), is a pioneering global effort to revolutionize our comprehension of precipitation patterns. This initiative employs a network of satellites, notably the GPM Core Observatory satellite, equipped with cutting-edge radar and radiometer systems. Building on TRMM's legacy, GPM extends its measurement capabilities, offering a near-global view of precipitation, including light rain, solid precipitation, and microphysical properties of precipitating particles. The GPM Core Observatory's technology enhances our understanding of particle distributions, crucial for Earth's water and energy cycle comprehension. The GPM mission has notably birthed the Integrated Multi-satellitE Retrievals for GPM (IMERG) algorithm, fusing data from various satellites to estimate global precipitation over two decades. IMERG's data amalgamation facilitates comprehensive climate modeling and numerous applications like disaster management and resource planning. Beyond data, GPM's innovative technology and collaborative international efforts propel our understanding of the Earth's water cycle, climate sensitivity, storm structures, and precipitation microphysics. These advancements offer society benefits through improved weather predictions, disaster readiness, and agricultural forecasting, making GPM a vital tool for societal advancement and environmental stewardship.",
        images: [
          'assets/images/gpm1.png',
          'assets/images/gpm2.png',
          'assets/images/gpm3.jpeg'
        ])
  ];

  MissionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missions'),
      ),
      body: ListView.builder(
        itemCount: missions.length,
        itemBuilder: (context, index) {
          final mission = missions[index];
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(mission.name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MissionDetailsPage(mission: mission),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MissionDetailsPage extends StatelessWidget {
  final Mission mission;

  const MissionDetailsPage({Key? key, required this.mission}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mission.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
              ),
              items: mission.images.map((image) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                mission.description,
                style: const TextStyle(
                  fontFamily: "Ubuntu",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

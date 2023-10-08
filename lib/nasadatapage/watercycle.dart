import 'package:flutter/material.dart';

class WaterCyclePage extends StatefulWidget {
  const WaterCyclePage({Key? key}) : super(key: key);

  @override
  State<WaterCyclePage> createState() => _WaterCyclePageState();
}

class _WaterCyclePageState extends State<WaterCyclePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Water Cycle'),
        ],
      ),
    );
  }
}

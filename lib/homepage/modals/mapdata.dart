class ClimateData {
  final Map<String, String> dailyUnits;
  final Map<String, dynamic> dailyData;

  ClimateData({
    required this.dailyUnits,
    required this.dailyData,
  });

  factory ClimateData.fromJson(Map<String, dynamic> json) {
    return ClimateData(
      dailyUnits: Map<String, String>.from(json['daily_units']),
      dailyData: Map<String, dynamic>.from(json['daily']),
    );
  }
}

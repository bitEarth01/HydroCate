class Onboardingcontent {
  final String title;
  final String image;
  final String desc;

  Onboardingcontent({
    required this.title,
    required this.image,
    required this.desc,
  });
  String get lastWord => title.split(' ').last;
  String get restOfTitle => title.replaceFirst(lastWord, '').trim();
}

List<Onboardingcontent> contents = [
  Onboardingcontent(
    title: "Exploring Earth's Water Journey",
    image: "assets/images/water.jpeg",
    desc:
        "Water is the essence of life, covering our planet and shaping our world. Learn how NASA satellites are helping us track this precious resource and its vital role in our changing climate",
  ),
  Onboardingcontent(
    title: "The Water Cycle Unveiled",
    image: "assets/images/evaporate.jpeg",
    desc:
        "Dive into the fascinating world of the water cycle, from the ocean's embrace to atmospheric travels and life-sustaining processes on land. Discover how NASA's satellites capture these journeys",
  ),
  Onboardingcontent(
    title: "Climate Change and Our Water Future",
    image: "assets/images/evaporate.jpeg",
    desc:
        "Explore the impact of climate change on water resources. Witness how warming temperatures affect freshwater availability and what NASA's data tells us about this global challenge.",
  ),
];

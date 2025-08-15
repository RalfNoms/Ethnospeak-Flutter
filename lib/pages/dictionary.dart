import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class Dictionary extends StatefulWidget {
  const Dictionary({super.key});

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  late CustomVideoPlayerController _customVideoPlayerController;
  late VideoPlayerController _videoPlayerController;

  String assetVideo = "assets/videos/ethnicVideo.mp4";

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD0D0),
      appBar: AppBar(
         backgroundColor: Colors.transparent,
        title: const Text("Bagobo-klata learning"),
         leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Color(0xFFDCD0D0)),
        child: Center(
          child: ListView(
            children: <Widget>[
              const Image(image: AssetImage("assets/images/enthnic.png")),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  "The Bagobo Klata (also called Clata or Guiangan) are one of the indigenous groups in Mindanao, particularly found in the Davao region of the Philippines. Their history is rich and intertwined with the broader history of the Bagobo people, a larger group consisting of several distinct subgroups, including the Bagobo Klata, Tagabawa, and Obo Manuvu. Here’s an overview of their history:"),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Early History",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                  "The Bagobo Klata people are believed to be descendants of the early Austronesian-speaking populations who migrated to the Philippines around 2,500 to 3,000 years ago. They settled in the mountainous areas of Davao, where they thrived by practicing a form of subsistence farming, hunting, and gathering. Their territory traditionally stretched across the slopes of Mt. Apo, the highest mountain in the Philippines, and other nearby areas."),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Pre-colonial Period",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 9),
              const Text(
                  "Before Spanish colonization, the Bagobo Klata had a well-established community structure. They were known for their rich traditions, craftsmanship, and their ability to create intricate designs in textiles and jewelry, especially using brass, which became a hallmark of Bagobo culture. Their traditional political system was organized around a datu or chieftain, who held authority over the community. Their society was deeply spiritual, with strong beliefs in animism and nature spirits."),
              const SizedBox(height: 9),
              const Text("Post-Independence and Modern Times"),
              const SizedBox(
                height: 9,
              ),
              const Text(
                  "After Philippine independence in 1946, the Bagobo Klata faced increasing encroachment on their ancestral lands due to agricultural expansion, logging, and urbanization. The construction of roads, settlements, and the growth of Davao City have significantly impacted their traditional lands. However, efforts have been made to protect and preserve their culture and land rights, particularly through the Indigenous Peoples' Rights Act (IPRA) of 1997, which recognizes the rights of indigenous peoples in the Philippines to their ancestral domains."),
              const SizedBox(
                height: 9,
              ),
              const Text(
                  "Today, the Bagobo Klata continue to strive to maintain their distinct identity, cultural practices, and connection to their ancestral lands. Their language, traditional clothing, rituals, and crafts are celebrated, though they also face the challenges of modernization and cultural preservation. Some members of the Bagobo Klata have integrated into mainstream Filipino society, while others continue to live in more traditional ways in rural and mountainous areas."),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "THE BAGOBO-KLATA'S TRADITION",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 15),
              
              // Add the video player widget
              _videoPlayerController.value.isInitialized
                  ? CustomVideoPlayer(
                      customVideoPlayerController:
                          _customVideoPlayerController)
                  : const CircularProgressIndicator(), // Show loading indicator if not yet initialized
            ],
          ),
        ),
      ),
    );
  }

  // Initialize video player
  void initializeVideoPlayer() {
    _videoPlayerController = VideoPlayerController.asset(assetVideo)
      ..initialize().then((_) {
        setState(() {});
      });
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final videoUrl = 'https://www.youtube.com/watch?v=--IcmZkvL0Q';
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    final videoID = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1F2722),
            Color(0xff131312),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              // YoutubePlayer(
              //   controller: _controller,
              //   showVideoProgressIndicator: true,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      // Add a clear button to the search bar
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      ),
                      // Add a search icon or button to the search bar
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

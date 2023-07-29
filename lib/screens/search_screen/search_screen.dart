import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/home/home_state.dart';
import 'package:movie_app/bloc/search/search_event.dart';
import 'package:movie_app/bloc/search/search_state.dart';
import 'package:movie_app/data/model/recommendation/Recommendation.dart';
import 'package:movie_app/widgets/recom_container.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_event.dart';
import '../../bloc/search/search_bloc.dart';
import '../../widgets/anime_container.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late YoutubePlayerController _controller;
  Random random = Random();

  @override
  var videoUrl;
  List url = [
    'https://www.youtube.com/watch?v=--IcmZkvL0Q',
    'https://www.youtube.com/watch?v=27OZc-ku6is',
    'https://www.youtube.com/watch?v=e8YBesRKq_U'
  ];

  void initState() {
    BlocProvider.of<SearchBloc>(context).add(SearchInitEvent());
    int randomIndex = random.nextInt(url.length);
    videoUrl = url[randomIndex];
    final videoID = YoutubePlayer.convertUrlToId(videoUrl);

    //final videoID = YoutubePlayer.convertUrlToId(videoUrl);
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
          body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state is SearchLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBox(searchController: _searchController),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Recommendation',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (state is SearchSuccessResponse) ...{
                      state.getRecom.fold((l) => const Text('sth went wrong'),
                          (recomm) => RecomContainer(recomm.data!))
                    },
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 12),
                      child: Text(
                        'Upcomming seasons',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (state is SearchSuccessResponse) ...{
                      state.getUpcommingSeasons.fold(
                        (l) => const Text('sth went wrong'),
                        (recomm) => GetTopAnime(recomm.data!),
                      )
                    },
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          cursorColor: Colors.white,
          controller: _searchController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.white,
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Colors.white),
            // Add a clear button to the search bar
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () => _searchController.clear(),
            ),
            // Add a search icon or button to the search bar
            prefixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
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
    );
  }
}

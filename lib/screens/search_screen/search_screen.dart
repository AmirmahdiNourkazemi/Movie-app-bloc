import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/search/search_event.dart';
import 'package:movie_app/bloc/search/search_state.dart';
import 'package:movie_app/data/model/recommendation/Recommendation.dart';
import 'package:movie_app/widgets/recom_container.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../bloc/search/search_bloc.dart';
import '../../widgets/anime_container.dart';

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
    BlocProvider.of<SearchBloc>(context).add(SearchInitEvent());
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
          body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state is SearchLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  SearchBox(searchController: _searchController),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: ClipRRect(
                  //     borderRadius: const BorderRadius.all(Radius.circular(20)),
                  //     child: YoutubePlayer(
                  //       controller: _controller,
                  //       showVideoProgressIndicator: true,
                  //     ),
                  //   ),
                  // ),
                  if (state is SearchSuccessResponse) ...{
                    state.getRecom.fold((l) => Text('data'),
                        (recomm) => RecomContainer(recomm.data!))
                  }
                ],
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // Add padding around the search bar
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        // Use a Material design search bar
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

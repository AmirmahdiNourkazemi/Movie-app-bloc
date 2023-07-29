import 'package:flutter/material.dart';
import 'package:movie_app/data/model/Anime/Data.dart';
import 'package:movie_app/widgets/cached_image.dart';

class AnimeDetailScreen extends StatefulWidget {
  final Data anime;
  const AnimeDetailScreen(this.anime, {super.key});

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff1F2722),
            Color(0xff131312),
          ],
        ),
      ),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 50,
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(top: 18, right: 18),
                    child: Icon(
                      Icons.menu,
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(10),
                  child: Container(
                    height: 14,
                    decoration: const BoxDecoration(
                      color: Color(0xff1F2722),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                backgroundColor: const Color(0xff1F2722),
                expandedHeight: 350,
                flexibleSpace: FlexibleSpaceBar(
                  background: CachedImage(
                    imageUrl: widget.anime.images!.jpg!.largeImageUrl!,
                  ),
                ),
              )
            ];
          },
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff1F2722),
                  Color(0xff131312),
                ],
              ),
            ),
            child: Column(
              children: [Text('data')],
            ),
          ),
        ),
      ),
    );
  }
}

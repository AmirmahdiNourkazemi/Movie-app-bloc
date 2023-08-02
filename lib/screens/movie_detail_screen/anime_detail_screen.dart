import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/home/home_state.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_event.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_state.dart';
import 'package:movie_app/data/model/Anime/AnimeNews/AnimeNews.dart';
import 'package:movie_app/data/model/getTop/Anime/Data.dart';
import 'package:movie_app/widgets/anime_container.dart';
import 'package:movie_app/widgets/cached_image.dart';

import '../../data/model/Anime/getAnimeEpisodes/GetAnimeEpisodes.dart';
import '../../widgets/anime_character_container.dart';
import '../../widgets/character_container_builder.dart';
import '../../widgets/recom_container_detail.dart';
import '../../widgets/text_widget.dart';

class AnimeDetailScreen extends StatefulWidget {
  final int malId;

  const AnimeDetailScreen(this.malId, {super.key});

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<MovieDetailBloc>(context)
        .add(MovieDetailInitEvent(widget.malId));
    print(widget.malId);
  }

  @override
  Widget build(BuildContext context) {
    int length = 2;
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
        backgroundColor: Colors.transparent,
        body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetialLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, isScrolled) {
                  return [
                    if (state is MovieDetailResponseSuccessState) ...{
                      state.getAnimeFullById.fold(
                          (l) => Text('sth went wrong'),
                          (anime) => SliverAppBar(
                                pinned: true,
                                stretch: true,
                                toolbarHeight: 40,
                                actions: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 18, right: 18),
                                    child: Icon(
                                      Icons.menu,
                                    ),
                                  ),
                                ],
                                bottom: PreferredSize(
                                  preferredSize: const Size.fromHeight(5),
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
                                expandedHeight: 250,
                                flexibleSpace: FlexibleSpaceBar(
                                  background: Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: CachedImage(
                                          imageUrl: anime
                                              .data!.images!.jpg!.largeImageUrl,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 25,
                                        child: Container(
                                          width: 130,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Colors.red,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.play_arrow_outlined,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "Play",
                                                style: GoogleFonts.raleway(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                    },
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (state is MovieDetailResponseSuccessState) ...{
                            state.getAnimeFullById.fold((l) {
                              return const Text('sth went wrong');
                            }, (anime) {
                              return Column(
                                children: [
                                  Text(
                                    anime.data!.title!,
                                    style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          verticalDirection:
                                              VerticalDirection.up,
                                          children: [
                                            if (anime.data!.episodes
                                                    .toString() !=
                                                Null) ...{
                                              Chip(
                                                avatar: const Icon(Icons.movie),
                                                label: Text(
                                                  "episode:${anime.data!.episodes!.toString()}",
                                                  style: GoogleFonts.raleway(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            },
                                            if (anime.data!.duration!
                                                .isNotEmpty) ...{
                                              Chip(
                                                avatar:
                                                    const Icon(Icons.timelapse),
                                                label: Text(
                                                  "${anime.data!.duration}",
                                                  style: GoogleFonts.raleway(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            },
                                            if (anime
                                                .data!.genres!.isNotEmpty) ...{
                                              Chip(
                                                avatar: const Icon(
                                                    Icons.local_movies),
                                                label: Text(
                                                  "genre: ${anime.data!.genres![0].name}",
                                                  style: GoogleFonts.raleway(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            }
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Chip(
                                              avatar:
                                                  const Icon(Icons.rate_review),
                                              label: Text(
                                                "members: ${anime.data!.rating}",
                                                style: GoogleFonts.raleway(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            // ignore: unrelated_type_equality_checks
                                            if (anime.data!.year == Null) ...{
                                              Chip(
                                                avatar: const Icon(Icons
                                                    .production_quantity_limits_rounded),
                                                label: Text(
                                                  "${anime.data!.year}",
                                                  style: GoogleFonts.raleway(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            }
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  if (anime.data!.broadcast!.timezone == Null &&
                                      anime.data!.broadcast!.day == Null &&
                                      anime.data!.broadcast!.string ==
                                          Null) ...{
                                    SizedBox(
                                      height: 30,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Chip(
                                                avatar: const Icon(Icons.flag),
                                                label: Text(
                                                  "${anime.data!.broadcast!.timezone}",
                                                  style: GoogleFonts.raleway(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Chip(
                                                avatar: const Icon(Icons
                                                    .published_with_changes_rounded),
                                                label: Text(
                                                  "${anime.data!.broadcast!.string}",
                                                  style: GoogleFonts.raleway(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  },
                                ],
                              );
                            })
                          },
                          // if (state is MovieDetailResponseSuccessState) ...{
                          //   state.getAnimeEpisodes.fold(
                          //     (l) => Chip(
                          //       avatar: const Icon(
                          //           Icons.published_with_changes_rounded),
                          //       label: Text(
                          //         "just a episode",
                          //         style: GoogleFonts.raleway(
                          //           color: Colors.black,
                          //           fontSize: 12,
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //       ),
                          //     ),
                          //     (episodes) => GetSynopsis(episodes),
                          //   )
                          // },

                          if (state is MovieDetailResponseSuccessState) ...{
                            state.getAnimeCharactesById.fold(
                                (l) => const Text("sth went wrong"),
                                (anime) => Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Characters',
                                                style: GoogleFonts.raleway(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (anime.data!.isNotEmpty) ...{
                                          AnimeCharacterContainerBuilder(
                                              anime.data!)
                                        }
                                      ],
                                    ))
                          },

                          if (state is MovieDetailResponseSuccessState) ...{
                            state.getAnimeNews.fold(
                              (l) => const Text("sth went wrong"),
                              (news) => Column(
                                children: [
                                  if (news.data!.isNotEmpty) ...{
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'News',
                                            style: GoogleFonts.raleway(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    NewsBuilder(news)
                                  }
                                ],
                              ),
                            )
                          },

                          if (state is MovieDetailResponseSuccessState) ...{
                            state.getAnimeRecommendation.fold(
                              (l) => const Text("sth went wrong"),
                              (recomm) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Recommended Anime',
                                          style: GoogleFonts.raleway(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GetRecomContainerDetail(recomm.data!)
                                ],
                              ),
                            )
                          }
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class NewsBuilder extends StatelessWidget {
  AnimeNews news;
  NewsBuilder(
    this.news, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1, // Number of columns in the grid
        mainAxisSpacing: 5,
        childAspectRatio: 0.4,
        children: List.generate(news.data!.length, (index) {
          return Card(
            color: const Color.fromARGB(255, 52, 52, 56),
            child: ListTile(
              leading: SizedBox(
                width: 30,
                height: 60,
                child: CachedImage(
                  imageUrl: news.data![index].images!.jpg!.imageUrl,
                  radious: 5,
                ),
              ),
              minLeadingWidth: 0.6,
              minVerticalPadding: 16,
              dense: true,
              isThreeLine: true,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  '${news.data![index].title}',
                  maxLines: 3,
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              subtitle: Row(
                children: [
                  const Icon(
                    Icons.person_2,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'author : ${news.data![index].authorUsername}',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class GetSynopsis extends StatefulWidget {
  GetAnimeEpisodes episodes;
  GetSynopsis(
    this.episodes, {
    super.key,
  });
  bool isExpanded = false;
  bool visibility = true;
  @override
  State<GetSynopsis> createState() => _GetSynopsisState();
}

class _GetSynopsisState extends State<GetSynopsis>
    with TickerProviderStateMixin<GetSynopsis> {
  @override
  Widget build(BuildContext context) {
    if (widget.episodes.data!.title!.isNotEmpty) {
      return Column(children: <Widget>[
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: ConstrainedBox(
            constraints: widget.isExpanded
                ? const BoxConstraints()
                : const BoxConstraints(maxHeight: 20.0),
            child: Text(
              '${widget.episodes.data!.synopsis}',
              softWrap: true,
              overflow: TextOverflow.fade,
              style: GoogleFonts.raleway(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        widget.isExpanded
            ? ConstrainedBox(constraints: const BoxConstraints())
            : TextButton(
                child: Text('See more',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
                onPressed: () => setState(() => widget.isExpanded = true),
              )
      ]);
    } else {
      return Text('');
    }
  }
}

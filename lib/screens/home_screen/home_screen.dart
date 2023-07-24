import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/home/home_bloc.dart';
import 'package:movie_app/bloc/home/home_event.dart';
import 'package:movie_app/bloc/home/home_state.dart';
import 'package:movie_app/data/model/Anime.dart';
import '../../data/model/Data.dart';
import '../../widgets/cached_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff1F2722), Color(0xff131312)],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  if (state is HomeLoadingState) ...[
                    const SliverToBoxAdapter(
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                    ),
                  ] else ...{
                    if (state is ResponseSuccessState) ...{
                      state.TopAnimeBanner.fold(
                        (l) => const SliverToBoxAdapter(
                          child: Text("sth went wrong"),
                        ),
                        (animeList) =>
                            GetTopAnimationForBanner(animeList.data!),
                      )
                    },
                    const TopAnimeTitle(),
                    if (state is ResponseSuccessState) ...{
                      state.TopAnime.fold(
                        (l) => const SliverToBoxAdapter(
                          child: Text("sth went wrong"),
                        ),
                        (anime) => GetTopAnime(anime.data!),
                      )
                    },
                    const NowSeasons(),
                    if (state is ResponseSuccessState) ...{
                      state.SeasonNow.fold(
                        (l) => const SliverToBoxAdapter(
                          child: Text("sth went wrong"),
                        ),
                        (anime) => GetTopAnime(anime.data!),
                      )
                    },
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20,
                      ),
                    )
                  }
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class TopAnimeTitle extends StatelessWidget {
  const TopAnimeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 12),
        child: Text(
          'Top Anime',
          style: GoogleFonts.alatsi(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class NowSeasons extends StatelessWidget {
  const NowSeasons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 12, top: 12),
        child: Text(
          'Now Seasons',
          style: GoogleFonts.alatsi(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GetTopAnime extends StatefulWidget {
  final List<Data> _listData;
  const GetTopAnime(this._listData, {super.key});

  @override
  State<GetTopAnime> createState() => _GetTopAnimeState();
}

class _GetTopAnimeState extends State<GetTopAnime> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget._listData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: SizedBox(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CachedImage(
                      imageUrl:
                          widget._listData[index].images!.webp!.largeImageUrl,
                      radious: 2,
                    ),
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Container(
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white10.withAlpha(80),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(2),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Text(
                            widget._listData[index].score.toString(),
                            style: GoogleFonts.alatsi(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (widget._listData[index].genres!.isNotEmpty) ...{
                      Positioned(
                        child: Container(
                          width: 100,
                          height: 2,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(5.0, 5.0),
                                blurRadius: 30.0,
                                spreadRadius: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white10.withAlpha(80)),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(2),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(100),
                                blurRadius: 10.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Text(
                              (widget._listData[index].genres!.isNotEmpty)
                                  ? widget._listData[index].genres![0].name!
                                  : "",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alatsi(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    }
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class GetTopAnimationForBanner extends StatelessWidget {
  final List<Data> _listData;
  const GetTopAnimationForBanner(
    this._listData, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 300,
            viewportFraction: 0.42,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOutCubic,
            enlargeCenterPage: true,
            enlargeFactor: 0.14,
            //onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: _listData.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
              Column(
            children: [
              SizedBox(
                height: 200,
                child: CachedImage(
                  imageUrl: _listData[index].images!.jpg!.largeImageUrl,
                  radious: 5,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      _listData[index].titleEnglish!,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alatsi(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      (_listData[index].genres![0].name!.isNotEmpty)
                          ? _listData[index].genres![0].name!
                          : "",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alatsi(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

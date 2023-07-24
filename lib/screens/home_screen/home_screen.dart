import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                      child: CircularProgressIndicator(),
                    ),
                  ] else ...{
                    if (state is ResponseSuccessState) ...{
                      state.AnimeList.fold(
                          (l) => SliverToBoxAdapter(
                                child: Text("sth went wrong"),
                              ),
                          (animeList) =>
                              GetTopAnimationForBanner(animeList.data!))
                    }
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

class GetTopAnimationForBanner extends StatelessWidget {
  List<Data> _listData;
  GetTopAnimationForBanner(
    this._listData, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.center,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 250,
            viewportFraction: 0.45,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.290,
            //onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 15,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
              CachedImage(
            imageUrl: _listData[index].images!.jpg!.largeImageUrl,
            radious: 20,
          ),
        ),
      ),
    );
  }
}

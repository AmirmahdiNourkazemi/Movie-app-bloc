import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/movie_detail/movie_detail_bloc.dart';
import '../data/model/Anime/getAnimeRecommendation/Data.dart';
import '../screens/movie_detail_screen/anime_detail_screen.dart';
import 'cached_image.dart';

class GetRecomContainerDetail extends StatefulWidget {
  final List<Data> _listData;
  const GetRecomContainerDetail(this._listData, {super.key});

  @override
  State<GetRecomContainerDetail> createState() =>
      _GetRecomContainerDetailState();
}

class _GetRecomContainerDetailState extends State<GetRecomContainerDetail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget._listData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            // onTap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) {
            //         return BlocProvider(
            //           create: (context) => MovieDetailBloc(),
            //           child: AnimeDetailScreen(widget._listData[index]),
            //         );
            //       },
            //     ),
            //   );
            // },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CachedImage(
                      imageUrl: widget
                          ._listData[index].entry!.images!.jpg!.largeImageUrl,
                      radious: 2,
                    ),
                    if (widget._listData[index].entry!.title!.isNotEmpty) ...{
                      Positioned(
                        child: Container(
                          width: 70,
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
                          width: 100,
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
                                blurRadius: 20.0,
                                spreadRadius: 20.0,
                              ),
                            ],
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Text(
                              (widget._listData[index].entry!.title!.isNotEmpty)
                                  ? widget._listData[index].entry!.title!
                                  : "",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    }
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

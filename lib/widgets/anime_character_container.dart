import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/model/Anime/getAnimeCharacterById/Data.dart';
import 'cached_image.dart';

class AnimeCharacterContainerBuilder extends StatefulWidget {
  final List<Data> _listData;
  const AnimeCharacterContainerBuilder(this._listData, {super.key});

  @override
  State<AnimeCharacterContainerBuilder> createState() =>
      _AnimeCharacterContainerBuilderState();
}

class _AnimeCharacterContainerBuilderState
    extends State<AnimeCharacterContainerBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget._listData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CachedImage(
                    imageUrl: widget
                        ._listData[index].character?.images?.jpg?.imageUrl,
                    radious: 2,
                  ),
                  if (widget._listData[index].character?.name != null) ...{
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
                        width: 110,
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
                            widget._listData[index].character!.name!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
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
    );
  }
}

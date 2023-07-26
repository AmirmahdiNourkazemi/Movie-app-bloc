import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/data/model/recommendation/Data.dart';

import 'cached_image.dart';

class RecomContainer extends StatefulWidget {
  final List<Data> _listData;
  const RecomContainer(this._listData, {super.key});

  @override
  State<RecomContainer> createState() => _RecomContainerState();
}

class _RecomContainerState extends State<RecomContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget._listData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
            child: SizedBox(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CachedImage(
                    imageUrl: widget
                        ._listData[index].entry![1].images!.jpg!.largeImageUrl,
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
                          widget._listData[index].entry![1].title!,
                          style: GoogleFonts.alatsi(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (widget._listData[index].entry![1].title!.isNotEmpty) ...{
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
                        // child: Center(
                        //   child: Text(
                        //     (widget._listData[index].genres!.isNotEmpty)
                        //         ? widget._listData[index].genres![0].name!
                        //         : "",
                        //     textAlign: TextAlign.center,
                        //     style: GoogleFonts.alatsi(
                        //       color: Colors.white,
                        //       fontSize: 15,
                        //     ),
                        //   ),
                        // ),
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

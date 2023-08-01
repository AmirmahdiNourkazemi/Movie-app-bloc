import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends StatelessWidget {
  String? imageUrl;
  double radious;
  CachedImage({
    super.key,
    this.imageUrl,
    this.radious = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radious)),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl ?? '',
        errorWidget: (context, url, error) {
          return Container(
            child: Image.asset('assets/images/no-movie.jpg'),
          );
        },
        placeholder: (context, url) {
          return SizedBox(
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.white60,
              child: Image.asset('assets/images/no-movie.jpg'),
            ),
          );
        },
      ),
    );
  }
}

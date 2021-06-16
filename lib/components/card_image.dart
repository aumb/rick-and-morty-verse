// coverage:ignore-file

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(14),
            topLeft: Radius.circular(14),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imageProvider,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14),
            topLeft: Radius.circular(14),
          ),
        ),
        child: const Icon(Icons.image),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14),
            topLeft: Radius.circular(14),
          ),
        ),
        child: const Icon(Icons.image),
      ),
    );
  }
}

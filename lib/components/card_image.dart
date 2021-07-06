// coverage:ignore-file

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  BorderRadius get _borderRadius => const BorderRadius.only(
        topRight: Radius.circular(14),
        topLeft: Radius.circular(14),
      );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final intendedHeight = height * 0.3;
    if (url.isEmpty) {
      return _buildPlaceholder(intendedHeight);
    }
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
              height: intendedHeight,
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageProvider,
                ),
              ),
            ),
        placeholder: (context, url) => _buildPlaceholder(intendedHeight),
        errorWidget: (context, url, error) =>
            _buildErrorWidget(intendedHeight));
  }

  Container _buildPlaceholder(double height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
      ),
      child: const Icon(Icons.image),
    );
  }

  Container _buildErrorWidget(double height) {
    return _buildPlaceholder(height);
  }
}

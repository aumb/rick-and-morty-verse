import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/components/card_image.dart';

class ElementCard extends StatelessWidget {
  const ElementCard({
    Key? key,
    required this.imageUrl,
    required this.body,
  }) : super(key: key);

  final String imageUrl;
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardImage(url: imageUrl),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: body,
            ),
          ),
        ],
      ),
    );
  }
}

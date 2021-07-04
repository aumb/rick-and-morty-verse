import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/core/enums/search_option.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';

class SearchTabBar extends StatelessWidget {
  SearchTabBar({
    Key? key,
  }) : super(key: key);

  final searchOptions = [
    SearchOption.characters,
    SearchOption.episodes,
    SearchOption.locations,
  ];

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: searchOptions
          .map((e) => Tab(
                text: buttonText(e, context),
              ))
          .toList(),
    );
  }

  String buttonText(SearchOption option, BuildContext context) {
    final l10n = context.l10n;
    switch (option) {
      case SearchOption.characters:
        return l10n.characters;
      case SearchOption.episodes:
        return l10n.episodes;
      case SearchOption.locations:
        return l10n.locations;
    }
  }
}

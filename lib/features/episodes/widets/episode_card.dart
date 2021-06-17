import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/components/element_card.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    Key? key,
    required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ElementCard(imageUrl: episode.image ?? '', body: [
      Text(
        episode.name ?? l10n.unknown,
        key: const ValueKey('episode_name'),
        style: Theme.of(context).textTheme.headline5,
      ),
      Text(
        episode.episode ?? l10n.unknown,
        key: const ValueKey('episode_season_number'),
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Theme.of(context).textTheme.caption!.color,
            ),
      ),
      const SizedBox(height: 24),
      Text(
        l10n.airedOn,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Theme.of(context).textTheme.caption!.color,
            ),
      ),
      Text(
        episode.airDate ?? l10n.unknown,
        key: const ValueKey('air_date'),
        style: Theme.of(context).textTheme.subtitle1,
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/components/element_card.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/features/characters/widgets/character_status_widget.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ElementCard(imageUrl: character.image ?? '', body: [
      Text(
        character.name ?? l10n.unknown,
        key: const ValueKey('character_name'),
        style: Theme.of(context).textTheme.headline5,
      ),
      Row(
        children: [
          CharacterStatusWidget(character: character),
          const Text(' - '),
          Text(
            character.species ?? l10n.unknown,
            key: const ValueKey('species_name'),
          )
        ],
      ),
      const SizedBox(height: 24),
      Text(
        l10n.lastKnownLocation,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Theme.of(context).textTheme.caption!.color,
            ),
      ),
      Text(
        character.location?.name ?? l10n.unknown,
        key: const ValueKey('location_name'),
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(height: 24),
      Text(
        l10n.firstSeenIn,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: Theme.of(context).textTheme.caption!.color,
            ),
      ),
      Text(
        (character.episode != null && character.episode!.isNotEmpty)
            ? (character.episode?.first?.name ?? l10n.unknown)
            : l10n.unknown,
        key: const ValueKey('episode_name'),
        style: Theme.of(context).textTheme.subtitle1,
      ),
    ]);
  }
}

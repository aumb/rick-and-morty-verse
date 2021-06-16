import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/components/card_image.dart';
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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardImage(url: character.image ?? ''),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  'Last known location:',
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
                  'First seen in:',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

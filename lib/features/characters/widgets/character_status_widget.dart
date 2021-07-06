import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/core/enums/character_status_enum.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';

class CharacterStatusWidget extends StatelessWidget {
  const CharacterStatusWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  Color get statusColor {
    switch (character.status) {
      case CharacterStatusEnum.alive:
        return Colors.green;
      case CharacterStatusEnum.dead:
        return Colors.red;
      case CharacterStatusEnum.unknown:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          key: const ValueKey('status_indicator'),
          transform: (!kIsWeb && !Platform.isIOS)
              ? Matrix4.translationValues(0, 3, 0)
              : null,
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: statusColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          statusName(l10n),
          key: const ValueKey('status_text'),
        ),
      ],
    );
  }

  String statusName(AppLocalizations l10n) {
    switch (character.status) {
      case CharacterStatusEnum.alive:
        return l10n.alive;
      case CharacterStatusEnum.dead:
        return l10n.dead;
      case CharacterStatusEnum.unknown:
        return l10n.unknown;
      default:
        return l10n.unknown;
    }
  }
}

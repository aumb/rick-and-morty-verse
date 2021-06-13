import 'package:rick_and_morty_verse/core/enums/character_status_enum.dart';

class CharacterStatus {
  static CharacterStatusEnum getCharacterStatusEnum(String? value) {
    switch (value) {
      case 'Alive':
        return CharacterStatusEnum.alive;
      case 'Dead':
        return CharacterStatusEnum.dead;
      default:
        return CharacterStatusEnum.unknown;
    }
  }
}

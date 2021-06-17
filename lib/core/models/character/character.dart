import 'package:rick_and_morty_verse/core/enums/character_status_enum.dart';
import 'package:rick_and_morty_verse/core/models/character/character_status.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required String? id,
    required String? name,
    @JsonKey(
      fromJson: CharacterStatus.getCharacterStatusEnum,
      includeIfNull: true,
      disallowNullValue: false,
    )
        required CharacterStatusEnum? status,
    required String? species,
    required String? type,
    required String? gender,
    required RMLocation? origin,
    required RMLocation? location,
    required String? image,
    required List<Episode?>? episode,
    required String? url,
    required DateTime? created,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  static List<Character?>? fromJsonList(List json) =>
      json.map((e) => Character.fromJson(e)).toList();
}

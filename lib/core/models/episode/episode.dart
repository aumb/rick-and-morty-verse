import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
class Episode with _$Episode {
  const factory Episode({
    required String? id,
    required String? name,
    @JsonKey(name: 'air_date') required String? airDate,
    required String? episode,
    required List<Character?>? characters,
    required String? url,
    required DateTime? created,
    required String? image,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  static List<Episode?>? fromJsonList(List json) =>
      json.map((e) => Episode.fromJson(e)).toList();
}

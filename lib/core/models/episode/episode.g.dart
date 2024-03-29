// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Episode _$_$_EpisodeFromJson(Map<String, dynamic> json) {
  return _$_Episode(
    id: json['id'] as String?,
    name: json['name'] as String?,
    airDate: json['air_date'] as String?,
    episode: json['episode'] as String?,
    characters: (json['characters'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Character.fromJson(e as Map<String, dynamic>))
        .toList(),
    url: json['url'] as String?,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$_$_EpisodeToJson(_$_Episode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.airDate,
      'episode': instance.episode,
      'characters': instance.characters,
      'url': instance.url,
      'created': instance.created?.toIso8601String(),
      'image': instance.image,
    };

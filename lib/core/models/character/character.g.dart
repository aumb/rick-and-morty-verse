// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Character _$_$_CharacterFromJson(Map<String, dynamic> json) {
  return _$_Character(
    id: json['id'] as String?,
    name: json['name'] as String?,
    status: CharacterStatus.getCharacterStatusEnum(json['status'] as String?),
    species: json['species'] as String?,
    type: json['type'] as String?,
    gender: json['gender'] as String?,
    origin: json['origin'] == null
        ? null
        : RMLocation.fromJson(json['origin'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : RMLocation.fromJson(json['location'] as Map<String, dynamic>),
    image: json['image'] as String?,
    episode: (json['episode'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Episode.fromJson(e as Map<String, dynamic>))
        .toList(),
    url: json['url'] as String?,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
  );
}

Map<String, dynamic> _$_$_CharacterToJson(_$_Character instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$CharacterStatusEnumEnumMap[instance.status],
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created?.toIso8601String(),
    };

const _$CharacterStatusEnumEnumMap = {
  CharacterStatusEnum.alive: 'alive',
  CharacterStatusEnum.dead: 'dead',
  CharacterStatusEnum.unknown: 'unknown',
};

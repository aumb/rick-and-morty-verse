// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RMLocation _$_$_RMLocationFromJson(Map<String, dynamic> json) {
  return _$_RMLocation(
    id: json['id'] as int?,
    name: json['name'] as String?,
    type: json['type'] as String?,
    dimension: json['dimension'] as String?,
    residents: (json['residents'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Character.fromJson(e as Map<String, dynamic>))
        .toList(),
    url: json['url'] as String?,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
  );
}

Map<String, dynamic> _$_$_RMLocationToJson(_$_RMLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'dimension': instance.dimension,
      'residents': instance.residents,
      'url': instance.url,
      'created': instance.created?.toIso8601String(),
    };

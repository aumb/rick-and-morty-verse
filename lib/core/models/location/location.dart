import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
abstract class RMLocation with _$RMLocation {
  const factory RMLocation({
    required int? id,
    required String? name,
    required String? type,
    required String? dimension,
    required List<Character?>? residents,
    required String? url,
    required DateTime? created,
  }) = _RMLocation;

  factory RMLocation.fromJson(Map<String, dynamic> json) =>
      _$RMLocationFromJson(json);

  static List<RMLocation?>? fromJsonList(List json) =>
      json.map((e) => RMLocation.fromJson(e)).toList();
}

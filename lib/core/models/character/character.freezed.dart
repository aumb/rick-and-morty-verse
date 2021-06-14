// coverage:ignore-file

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return _Character.fromJson(json);
}

/// @nodoc
class _$CharacterTearOff {
  const _$CharacterTearOff();

  _Character call(
      {required int? id,
      required String? name,
      @JsonKey(fromJson: CharacterStatus.getCharacterStatusEnum, includeIfNull: true, disallowNullValue: false)
          required CharacterStatusEnum? status,
      required String? species,
      required String? type,
      required String? gender,
      required RMLocation? origin,
      required RMLocation? location,
      required String? image,
      required List<Episode?>? episode,
      required String? url,
      required DateTime? created}) {
    return _Character(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin,
      location: location,
      image: image,
      episode: episode,
      url: url,
      created: created,
    );
  }

  Character fromJson(Map<String, Object> json) {
    return Character.fromJson(json);
  }
}

/// @nodoc
const $Character = _$CharacterTearOff();

/// @nodoc
mixin _$Character {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: CharacterStatus.getCharacterStatusEnum,
      includeIfNull: true,
      disallowNullValue: false)
  CharacterStatusEnum? get status => throw _privateConstructorUsedError;
  String? get species => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  RMLocation? get origin => throw _privateConstructorUsedError;
  RMLocation? get location => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<Episode?>? get episode => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterCopyWith<Character> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCopyWith<$Res> {
  factory $CharacterCopyWith(Character value, $Res Function(Character) then) =
      _$CharacterCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      @JsonKey(fromJson: CharacterStatus.getCharacterStatusEnum, includeIfNull: true, disallowNullValue: false)
          CharacterStatusEnum? status,
      String? species,
      String? type,
      String? gender,
      RMLocation? origin,
      RMLocation? location,
      String? image,
      List<Episode?>? episode,
      String? url,
      DateTime? created});

  $RMLocationCopyWith<$Res>? get origin;
  $RMLocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res> implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._value, this._then);

  final Character _value;
  // ignore: unused_field
  final $Res Function(Character) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
    Object? origin = freezed,
    Object? location = freezed,
    Object? image = freezed,
    Object? episode = freezed,
    Object? url = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStatusEnum?,
      species: species == freezed
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as RMLocation?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as RMLocation?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<Episode?>?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $RMLocationCopyWith<$Res>? get origin {
    if (_value.origin == null) {
      return null;
    }

    return $RMLocationCopyWith<$Res>(_value.origin!, (value) {
      return _then(_value.copyWith(origin: value));
    });
  }

  @override
  $RMLocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $RMLocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$CharacterCopyWith<$Res> implements $CharacterCopyWith<$Res> {
  factory _$CharacterCopyWith(
          _Character value, $Res Function(_Character) then) =
      __$CharacterCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      @JsonKey(fromJson: CharacterStatus.getCharacterStatusEnum, includeIfNull: true, disallowNullValue: false)
          CharacterStatusEnum? status,
      String? species,
      String? type,
      String? gender,
      RMLocation? origin,
      RMLocation? location,
      String? image,
      List<Episode?>? episode,
      String? url,
      DateTime? created});

  @override
  $RMLocationCopyWith<$Res>? get origin;
  @override
  $RMLocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$CharacterCopyWithImpl<$Res> extends _$CharacterCopyWithImpl<$Res>
    implements _$CharacterCopyWith<$Res> {
  __$CharacterCopyWithImpl(_Character _value, $Res Function(_Character) _then)
      : super(_value, (v) => _then(v as _Character));

  @override
  _Character get _value => super._value as _Character;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
    Object? origin = freezed,
    Object? location = freezed,
    Object? image = freezed,
    Object? episode = freezed,
    Object? url = freezed,
    Object? created = freezed,
  }) {
    return _then(_Character(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStatusEnum?,
      species: species == freezed
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as RMLocation?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as RMLocation?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<Episode?>?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Character implements _Character {
  const _$_Character(
      {required this.id,
      required this.name,
      @JsonKey(fromJson: CharacterStatus.getCharacterStatusEnum, includeIfNull: true, disallowNullValue: false)
          required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created});

  factory _$_Character.fromJson(Map<String, dynamic> json) =>
      _$_$_CharacterFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(
      fromJson: CharacterStatus.getCharacterStatusEnum,
      includeIfNull: true,
      disallowNullValue: false)
  final CharacterStatusEnum? status;
  @override
  final String? species;
  @override
  final String? type;
  @override
  final String? gender;
  @override
  final RMLocation? origin;
  @override
  final RMLocation? location;
  @override
  final String? image;
  @override
  final List<Episode?>? episode;
  @override
  final String? url;
  @override
  final DateTime? created;

  @override
  String toString() {
    return 'Character(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Character &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.species, species) ||
                const DeepCollectionEquality()
                    .equals(other.species, species)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.origin, origin) ||
                const DeepCollectionEquality().equals(other.origin, origin)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.episode, episode) ||
                const DeepCollectionEquality()
                    .equals(other.episode, episode)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.created, created) ||
                const DeepCollectionEquality().equals(other.created, created)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(species) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(origin) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(episode) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(created);

  @JsonKey(ignore: true)
  @override
  _$CharacterCopyWith<_Character> get copyWith =>
      __$CharacterCopyWithImpl<_Character>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CharacterToJson(this);
  }
}

abstract class _Character implements Character {
  const factory _Character(
      {required int? id,
      required String? name,
      @JsonKey(fromJson: CharacterStatus.getCharacterStatusEnum, includeIfNull: true, disallowNullValue: false)
          required CharacterStatusEnum? status,
      required String? species,
      required String? type,
      required String? gender,
      required RMLocation? origin,
      required RMLocation? location,
      required String? image,
      required List<Episode?>? episode,
      required String? url,
      required DateTime? created}) = _$_Character;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$_Character.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      fromJson: CharacterStatus.getCharacterStatusEnum,
      includeIfNull: true,
      disallowNullValue: false)
  CharacterStatusEnum? get status => throw _privateConstructorUsedError;
  @override
  String? get species => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get gender => throw _privateConstructorUsedError;
  @override
  RMLocation? get origin => throw _privateConstructorUsedError;
  @override
  RMLocation? get location => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  List<Episode?>? get episode => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  DateTime? get created => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CharacterCopyWith<_Character> get copyWith =>
      throw _privateConstructorUsedError;
}

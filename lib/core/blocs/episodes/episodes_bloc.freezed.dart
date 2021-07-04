// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'episodes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EpisodesEventTearOff {
  const _$EpisodesEventTearOff();

  _GetEpisodes getEpisodes() {
    return const _GetEpisodes();
  }

  _SearchEpisodes searchEpisodes({required String query}) {
    return _SearchEpisodes(
      query: query,
    );
  }

  _SearchMoreEpisodes searchMoreEpisodes({required String query}) {
    return _SearchMoreEpisodes(
      query: query,
    );
  }
}

/// @nodoc
const $EpisodesEvent = _$EpisodesEventTearOff();

/// @nodoc
mixin _$EpisodesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getEpisodes,
    required TResult Function(String query) searchEpisodes,
    required TResult Function(String query) searchMoreEpisodes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getEpisodes,
    TResult Function(String query)? searchEpisodes,
    TResult Function(String query)? searchMoreEpisodes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEpisodes value) getEpisodes,
    required TResult Function(_SearchEpisodes value) searchEpisodes,
    required TResult Function(_SearchMoreEpisodes value) searchMoreEpisodes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEpisodes value)? getEpisodes,
    TResult Function(_SearchEpisodes value)? searchEpisodes,
    TResult Function(_SearchMoreEpisodes value)? searchMoreEpisodes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodesEventCopyWith<$Res> {
  factory $EpisodesEventCopyWith(
          EpisodesEvent value, $Res Function(EpisodesEvent) then) =
      _$EpisodesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$EpisodesEventCopyWithImpl<$Res>
    implements $EpisodesEventCopyWith<$Res> {
  _$EpisodesEventCopyWithImpl(this._value, this._then);

  final EpisodesEvent _value;
  // ignore: unused_field
  final $Res Function(EpisodesEvent) _then;
}

/// @nodoc
abstract class _$GetEpisodesCopyWith<$Res> {
  factory _$GetEpisodesCopyWith(
          _GetEpisodes value, $Res Function(_GetEpisodes) then) =
      __$GetEpisodesCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetEpisodesCopyWithImpl<$Res> extends _$EpisodesEventCopyWithImpl<$Res>
    implements _$GetEpisodesCopyWith<$Res> {
  __$GetEpisodesCopyWithImpl(
      _GetEpisodes _value, $Res Function(_GetEpisodes) _then)
      : super(_value, (v) => _then(v as _GetEpisodes));

  @override
  _GetEpisodes get _value => super._value as _GetEpisodes;
}

/// @nodoc

class _$_GetEpisodes implements _GetEpisodes {
  const _$_GetEpisodes();

  @override
  String toString() {
    return 'EpisodesEvent.getEpisodes()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetEpisodes);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getEpisodes,
    required TResult Function(String query) searchEpisodes,
    required TResult Function(String query) searchMoreEpisodes,
  }) {
    return getEpisodes();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getEpisodes,
    TResult Function(String query)? searchEpisodes,
    TResult Function(String query)? searchMoreEpisodes,
    required TResult orElse(),
  }) {
    if (getEpisodes != null) {
      return getEpisodes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEpisodes value) getEpisodes,
    required TResult Function(_SearchEpisodes value) searchEpisodes,
    required TResult Function(_SearchMoreEpisodes value) searchMoreEpisodes,
  }) {
    return getEpisodes(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEpisodes value)? getEpisodes,
    TResult Function(_SearchEpisodes value)? searchEpisodes,
    TResult Function(_SearchMoreEpisodes value)? searchMoreEpisodes,
    required TResult orElse(),
  }) {
    if (getEpisodes != null) {
      return getEpisodes(this);
    }
    return orElse();
  }
}

abstract class _GetEpisodes implements EpisodesEvent {
  const factory _GetEpisodes() = _$_GetEpisodes;
}

/// @nodoc
abstract class _$SearchEpisodesCopyWith<$Res> {
  factory _$SearchEpisodesCopyWith(
          _SearchEpisodes value, $Res Function(_SearchEpisodes) then) =
      __$SearchEpisodesCopyWithImpl<$Res>;
  $Res call({String query});
}

/// @nodoc
class __$SearchEpisodesCopyWithImpl<$Res>
    extends _$EpisodesEventCopyWithImpl<$Res>
    implements _$SearchEpisodesCopyWith<$Res> {
  __$SearchEpisodesCopyWithImpl(
      _SearchEpisodes _value, $Res Function(_SearchEpisodes) _then)
      : super(_value, (v) => _then(v as _SearchEpisodes));

  @override
  _SearchEpisodes get _value => super._value as _SearchEpisodes;

  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_SearchEpisodes(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchEpisodes implements _SearchEpisodes {
  const _$_SearchEpisodes({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'EpisodesEvent.searchEpisodes(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchEpisodes &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(query);

  @JsonKey(ignore: true)
  @override
  _$SearchEpisodesCopyWith<_SearchEpisodes> get copyWith =>
      __$SearchEpisodesCopyWithImpl<_SearchEpisodes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getEpisodes,
    required TResult Function(String query) searchEpisodes,
    required TResult Function(String query) searchMoreEpisodes,
  }) {
    return searchEpisodes(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getEpisodes,
    TResult Function(String query)? searchEpisodes,
    TResult Function(String query)? searchMoreEpisodes,
    required TResult orElse(),
  }) {
    if (searchEpisodes != null) {
      return searchEpisodes(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEpisodes value) getEpisodes,
    required TResult Function(_SearchEpisodes value) searchEpisodes,
    required TResult Function(_SearchMoreEpisodes value) searchMoreEpisodes,
  }) {
    return searchEpisodes(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEpisodes value)? getEpisodes,
    TResult Function(_SearchEpisodes value)? searchEpisodes,
    TResult Function(_SearchMoreEpisodes value)? searchMoreEpisodes,
    required TResult orElse(),
  }) {
    if (searchEpisodes != null) {
      return searchEpisodes(this);
    }
    return orElse();
  }
}

abstract class _SearchEpisodes implements EpisodesEvent {
  const factory _SearchEpisodes({required String query}) = _$_SearchEpisodes;

  String get query => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SearchEpisodesCopyWith<_SearchEpisodes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SearchMoreEpisodesCopyWith<$Res> {
  factory _$SearchMoreEpisodesCopyWith(
          _SearchMoreEpisodes value, $Res Function(_SearchMoreEpisodes) then) =
      __$SearchMoreEpisodesCopyWithImpl<$Res>;
  $Res call({String query});
}

/// @nodoc
class __$SearchMoreEpisodesCopyWithImpl<$Res>
    extends _$EpisodesEventCopyWithImpl<$Res>
    implements _$SearchMoreEpisodesCopyWith<$Res> {
  __$SearchMoreEpisodesCopyWithImpl(
      _SearchMoreEpisodes _value, $Res Function(_SearchMoreEpisodes) _then)
      : super(_value, (v) => _then(v as _SearchMoreEpisodes));

  @override
  _SearchMoreEpisodes get _value => super._value as _SearchMoreEpisodes;

  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_SearchMoreEpisodes(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchMoreEpisodes implements _SearchMoreEpisodes {
  const _$_SearchMoreEpisodes({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'EpisodesEvent.searchMoreEpisodes(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchMoreEpisodes &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(query);

  @JsonKey(ignore: true)
  @override
  _$SearchMoreEpisodesCopyWith<_SearchMoreEpisodes> get copyWith =>
      __$SearchMoreEpisodesCopyWithImpl<_SearchMoreEpisodes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getEpisodes,
    required TResult Function(String query) searchEpisodes,
    required TResult Function(String query) searchMoreEpisodes,
  }) {
    return searchMoreEpisodes(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getEpisodes,
    TResult Function(String query)? searchEpisodes,
    TResult Function(String query)? searchMoreEpisodes,
    required TResult orElse(),
  }) {
    if (searchMoreEpisodes != null) {
      return searchMoreEpisodes(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetEpisodes value) getEpisodes,
    required TResult Function(_SearchEpisodes value) searchEpisodes,
    required TResult Function(_SearchMoreEpisodes value) searchMoreEpisodes,
  }) {
    return searchMoreEpisodes(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetEpisodes value)? getEpisodes,
    TResult Function(_SearchEpisodes value)? searchEpisodes,
    TResult Function(_SearchMoreEpisodes value)? searchMoreEpisodes,
    required TResult orElse(),
  }) {
    if (searchMoreEpisodes != null) {
      return searchMoreEpisodes(this);
    }
    return orElse();
  }
}

abstract class _SearchMoreEpisodes implements EpisodesEvent {
  const factory _SearchMoreEpisodes({required String query}) =
      _$_SearchMoreEpisodes;

  String get query => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SearchMoreEpisodesCopyWith<_SearchMoreEpisodes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$EpisodesStateTearOff {
  const _$EpisodesStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _Loaded loaded() {
    return const _Loaded();
  }

  _Error error() {
    return const _Error();
  }

  _LoadingMore loadingMore() {
    return const _LoadingMore();
  }

  _Empty empty() {
    return const _Empty();
  }
}

/// @nodoc
const $EpisodesState = _$EpisodesStateTearOff();

/// @nodoc
mixin _$EpisodesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() loadingMore,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? loadingMore,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Empty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodesStateCopyWith<$Res> {
  factory $EpisodesStateCopyWith(
          EpisodesState value, $Res Function(EpisodesState) then) =
      _$EpisodesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EpisodesStateCopyWithImpl<$Res>
    implements $EpisodesStateCopyWith<$Res> {
  _$EpisodesStateCopyWithImpl(this._value, this._then);

  final EpisodesState _value;
  // ignore: unused_field
  final $Res Function(EpisodesState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$EpisodesStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'EpisodesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() loadingMore,
    required TResult Function() empty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? loadingMore,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Empty value) empty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EpisodesState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$EpisodesStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'EpisodesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() loadingMore,
    required TResult Function() empty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? loadingMore,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Empty value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements EpisodesState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$EpisodesStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded();

  @override
  String toString() {
    return 'EpisodesState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() loadingMore,
    required TResult Function() empty,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? loadingMore,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Empty value) empty,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements EpisodesState {
  const factory _Loaded() = _$_Loaded;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$EpisodesStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'EpisodesState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() loadingMore,
    required TResult Function() empty,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? loadingMore,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Empty value) empty,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements EpisodesState {
  const factory _Error() = _$_Error;
}

/// @nodoc
abstract class _$LoadingMoreCopyWith<$Res> {
  factory _$LoadingMoreCopyWith(
          _LoadingMore value, $Res Function(_LoadingMore) then) =
      __$LoadingMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingMoreCopyWithImpl<$Res> extends _$EpisodesStateCopyWithImpl<$Res>
    implements _$LoadingMoreCopyWith<$Res> {
  __$LoadingMoreCopyWithImpl(
      _LoadingMore _value, $Res Function(_LoadingMore) _then)
      : super(_value, (v) => _then(v as _LoadingMore));

  @override
  _LoadingMore get _value => super._value as _LoadingMore;
}

/// @nodoc

class _$_LoadingMore implements _LoadingMore {
  const _$_LoadingMore();

  @override
  String toString() {
    return 'EpisodesState.loadingMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadingMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() loadingMore,
    required TResult Function() empty,
  }) {
    return loadingMore();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? loadingMore,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Empty value) empty,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class _LoadingMore implements EpisodesState {
  const factory _LoadingMore() = _$_LoadingMore;
}

/// @nodoc
abstract class _$EmptyCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmptyCopyWithImpl<$Res> extends _$EpisodesStateCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'EpisodesState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() loadingMore,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? loadingMore,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Empty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements EpisodesState {
  const factory _Empty() = _$_Empty;
}

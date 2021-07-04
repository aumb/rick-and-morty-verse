// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'rm_locations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RMLocationsEventTearOff {
  const _$RMLocationsEventTearOff();

  _GetLocations getLocations() {
    return const _GetLocations();
  }

  _SearchLocations searchLocations({required String query}) {
    return _SearchLocations(
      query: query,
    );
  }

  _SearchMoreLocations searchMoreLocations({required String query}) {
    return _SearchMoreLocations(
      query: query,
    );
  }
}

/// @nodoc
const $RMLocationsEvent = _$RMLocationsEventTearOff();

/// @nodoc
mixin _$RMLocationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocations,
    required TResult Function(String query) searchLocations,
    required TResult Function(String query) searchMoreLocations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocations,
    TResult Function(String query)? searchLocations,
    TResult Function(String query)? searchMoreLocations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLocations value) getLocations,
    required TResult Function(_SearchLocations value) searchLocations,
    required TResult Function(_SearchMoreLocations value) searchMoreLocations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLocations value)? getLocations,
    TResult Function(_SearchLocations value)? searchLocations,
    TResult Function(_SearchMoreLocations value)? searchMoreLocations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RMLocationsEventCopyWith<$Res> {
  factory $RMLocationsEventCopyWith(
          RMLocationsEvent value, $Res Function(RMLocationsEvent) then) =
      _$RMLocationsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RMLocationsEventCopyWithImpl<$Res>
    implements $RMLocationsEventCopyWith<$Res> {
  _$RMLocationsEventCopyWithImpl(this._value, this._then);

  final RMLocationsEvent _value;
  // ignore: unused_field
  final $Res Function(RMLocationsEvent) _then;
}

/// @nodoc
abstract class _$GetLocationsCopyWith<$Res> {
  factory _$GetLocationsCopyWith(
          _GetLocations value, $Res Function(_GetLocations) then) =
      __$GetLocationsCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetLocationsCopyWithImpl<$Res>
    extends _$RMLocationsEventCopyWithImpl<$Res>
    implements _$GetLocationsCopyWith<$Res> {
  __$GetLocationsCopyWithImpl(
      _GetLocations _value, $Res Function(_GetLocations) _then)
      : super(_value, (v) => _then(v as _GetLocations));

  @override
  _GetLocations get _value => super._value as _GetLocations;
}

/// @nodoc

class _$_GetLocations implements _GetLocations {
  const _$_GetLocations();

  @override
  String toString() {
    return 'RMLocationsEvent.getLocations()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetLocations);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocations,
    required TResult Function(String query) searchLocations,
    required TResult Function(String query) searchMoreLocations,
  }) {
    return getLocations();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocations,
    TResult Function(String query)? searchLocations,
    TResult Function(String query)? searchMoreLocations,
    required TResult orElse(),
  }) {
    if (getLocations != null) {
      return getLocations();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLocations value) getLocations,
    required TResult Function(_SearchLocations value) searchLocations,
    required TResult Function(_SearchMoreLocations value) searchMoreLocations,
  }) {
    return getLocations(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLocations value)? getLocations,
    TResult Function(_SearchLocations value)? searchLocations,
    TResult Function(_SearchMoreLocations value)? searchMoreLocations,
    required TResult orElse(),
  }) {
    if (getLocations != null) {
      return getLocations(this);
    }
    return orElse();
  }
}

abstract class _GetLocations implements RMLocationsEvent {
  const factory _GetLocations() = _$_GetLocations;
}

/// @nodoc
abstract class _$SearchLocationsCopyWith<$Res> {
  factory _$SearchLocationsCopyWith(
          _SearchLocations value, $Res Function(_SearchLocations) then) =
      __$SearchLocationsCopyWithImpl<$Res>;
  $Res call({String query});
}

/// @nodoc
class __$SearchLocationsCopyWithImpl<$Res>
    extends _$RMLocationsEventCopyWithImpl<$Res>
    implements _$SearchLocationsCopyWith<$Res> {
  __$SearchLocationsCopyWithImpl(
      _SearchLocations _value, $Res Function(_SearchLocations) _then)
      : super(_value, (v) => _then(v as _SearchLocations));

  @override
  _SearchLocations get _value => super._value as _SearchLocations;

  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_SearchLocations(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchLocations implements _SearchLocations {
  const _$_SearchLocations({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'RMLocationsEvent.searchLocations(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchLocations &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(query);

  @JsonKey(ignore: true)
  @override
  _$SearchLocationsCopyWith<_SearchLocations> get copyWith =>
      __$SearchLocationsCopyWithImpl<_SearchLocations>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocations,
    required TResult Function(String query) searchLocations,
    required TResult Function(String query) searchMoreLocations,
  }) {
    return searchLocations(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocations,
    TResult Function(String query)? searchLocations,
    TResult Function(String query)? searchMoreLocations,
    required TResult orElse(),
  }) {
    if (searchLocations != null) {
      return searchLocations(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLocations value) getLocations,
    required TResult Function(_SearchLocations value) searchLocations,
    required TResult Function(_SearchMoreLocations value) searchMoreLocations,
  }) {
    return searchLocations(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLocations value)? getLocations,
    TResult Function(_SearchLocations value)? searchLocations,
    TResult Function(_SearchMoreLocations value)? searchMoreLocations,
    required TResult orElse(),
  }) {
    if (searchLocations != null) {
      return searchLocations(this);
    }
    return orElse();
  }
}

abstract class _SearchLocations implements RMLocationsEvent {
  const factory _SearchLocations({required String query}) = _$_SearchLocations;

  String get query => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SearchLocationsCopyWith<_SearchLocations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SearchMoreLocationsCopyWith<$Res> {
  factory _$SearchMoreLocationsCopyWith(_SearchMoreLocations value,
          $Res Function(_SearchMoreLocations) then) =
      __$SearchMoreLocationsCopyWithImpl<$Res>;
  $Res call({String query});
}

/// @nodoc
class __$SearchMoreLocationsCopyWithImpl<$Res>
    extends _$RMLocationsEventCopyWithImpl<$Res>
    implements _$SearchMoreLocationsCopyWith<$Res> {
  __$SearchMoreLocationsCopyWithImpl(
      _SearchMoreLocations _value, $Res Function(_SearchMoreLocations) _then)
      : super(_value, (v) => _then(v as _SearchMoreLocations));

  @override
  _SearchMoreLocations get _value => super._value as _SearchMoreLocations;

  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_SearchMoreLocations(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchMoreLocations implements _SearchMoreLocations {
  const _$_SearchMoreLocations({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'RMLocationsEvent.searchMoreLocations(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchMoreLocations &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(query);

  @JsonKey(ignore: true)
  @override
  _$SearchMoreLocationsCopyWith<_SearchMoreLocations> get copyWith =>
      __$SearchMoreLocationsCopyWithImpl<_SearchMoreLocations>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocations,
    required TResult Function(String query) searchLocations,
    required TResult Function(String query) searchMoreLocations,
  }) {
    return searchMoreLocations(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocations,
    TResult Function(String query)? searchLocations,
    TResult Function(String query)? searchMoreLocations,
    required TResult orElse(),
  }) {
    if (searchMoreLocations != null) {
      return searchMoreLocations(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLocations value) getLocations,
    required TResult Function(_SearchLocations value) searchLocations,
    required TResult Function(_SearchMoreLocations value) searchMoreLocations,
  }) {
    return searchMoreLocations(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLocations value)? getLocations,
    TResult Function(_SearchLocations value)? searchLocations,
    TResult Function(_SearchMoreLocations value)? searchMoreLocations,
    required TResult orElse(),
  }) {
    if (searchMoreLocations != null) {
      return searchMoreLocations(this);
    }
    return orElse();
  }
}

abstract class _SearchMoreLocations implements RMLocationsEvent {
  const factory _SearchMoreLocations({required String query}) =
      _$_SearchMoreLocations;

  String get query => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SearchMoreLocationsCopyWith<_SearchMoreLocations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$RMLocationsStateTearOff {
  const _$RMLocationsStateTearOff();

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
const $RMLocationsState = _$RMLocationsStateTearOff();

/// @nodoc
mixin _$RMLocationsState {
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
abstract class $RMLocationsStateCopyWith<$Res> {
  factory $RMLocationsStateCopyWith(
          RMLocationsState value, $Res Function(RMLocationsState) then) =
      _$RMLocationsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RMLocationsStateCopyWithImpl<$Res>
    implements $RMLocationsStateCopyWith<$Res> {
  _$RMLocationsStateCopyWithImpl(this._value, this._then);

  final RMLocationsState _value;
  // ignore: unused_field
  final $Res Function(RMLocationsState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$RMLocationsStateCopyWithImpl<$Res>
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
    return 'RMLocationsState.initial()';
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

abstract class _Initial implements RMLocationsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$RMLocationsStateCopyWithImpl<$Res>
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
    return 'RMLocationsState.loading()';
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

abstract class _Loading implements RMLocationsState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$RMLocationsStateCopyWithImpl<$Res>
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
    return 'RMLocationsState.loaded()';
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

abstract class _Loaded implements RMLocationsState {
  const factory _Loaded() = _$_Loaded;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$RMLocationsStateCopyWithImpl<$Res>
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
    return 'RMLocationsState.error()';
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

abstract class _Error implements RMLocationsState {
  const factory _Error() = _$_Error;
}

/// @nodoc
abstract class _$LoadingMoreCopyWith<$Res> {
  factory _$LoadingMoreCopyWith(
          _LoadingMore value, $Res Function(_LoadingMore) then) =
      __$LoadingMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingMoreCopyWithImpl<$Res>
    extends _$RMLocationsStateCopyWithImpl<$Res>
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
    return 'RMLocationsState.loadingMore()';
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

abstract class _LoadingMore implements RMLocationsState {
  const factory _LoadingMore() = _$_LoadingMore;
}

/// @nodoc
abstract class _$EmptyCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmptyCopyWithImpl<$Res> extends _$RMLocationsStateCopyWithImpl<$Res>
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
    return 'RMLocationsState.empty()';
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

abstract class _Empty implements RMLocationsState {
  const factory _Empty() = _$_Empty;
}

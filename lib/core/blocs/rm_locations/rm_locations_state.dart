part of 'rm_locations_bloc.dart';

@freezed
class RMLocationsState with _$RMLocationsState {
  const factory RMLocationsState.initial() = _Initial;

  const factory RMLocationsState.loading() = _Loading;

  const factory RMLocationsState.loaded() = _Loaded;

  const factory RMLocationsState.error() = _Error;

  const factory RMLocationsState.loadingMore() = _LoadingMore;

  const factory RMLocationsState.empty() = _Empty;
}

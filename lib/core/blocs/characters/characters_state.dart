part of 'characters_bloc.dart';

@freezed
class CharactersState with _$CharactersState {
  const factory CharactersState.initial() = _Initial;

  const factory CharactersState.loading() = _Loading;

  const factory CharactersState.loadingMore() = _LoadingMore;

  const factory CharactersState.loaded() = _Loaded;

  const factory CharactersState.empty() = _Empty;

  const factory CharactersState.error() = _Error;
}

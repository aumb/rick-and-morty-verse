part of 'characters_bloc.dart';

@freezed
class CharactersEvent with _$CharactersEvent {
  const factory CharactersEvent.getCharacters() = _GetCharacters;

  const factory CharactersEvent.searchCharacters({
    required String query,
  }) = _SearchCharacters;

  const factory CharactersEvent.searchMoreCharacters({
    required String query,
  }) = _SearchMoreCharacters;
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/core/models/failure.dart';
import 'package:rick_and_morty_verse/core/repositories/characters_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';
part 'characters_bloc.freezed.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc(this._charactersRepository) : super(const _Initial());

  final CharactersRepository _charactersRepository;

  bool _hasReachedEnd = false;
  bool _isGettingItems = false;

  bool get canGetMore => !_hasReachedEnd && !_isGettingItems;

  final List<Character?> _characters = [];
  List<Character?> get characters => _characters;

  int page = 1;

  @override
  Stream<CharactersState> mapEventToState(
    CharactersEvent event,
  ) async* {
    if (event is _GetCharacters) {
      _isGettingItems = true;
      if (state is! _Initial) {
        yield const CharactersState.loading();
      }
      final result = await _charactersRepository.getCharacters(page);
      yield* _mapGetCharacters(result);
    }
  }

  Stream<CharactersState> _mapGetCharacters(
      Either<Failure, List<Character?>> result) async* {
    yield result.fold((l) => const CharactersState.error(), (r) {
      _hasReachedEnd = r.isEmpty;
      _isGettingItems = false;
      _characters.addAll(r);
      page++;
      return const CharactersState.loaded();
    });
  }
}

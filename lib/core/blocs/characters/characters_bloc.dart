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
        yield const _Loading();
      }
      final result = await _charactersRepository.getCharacters(page);
      yield* _mapGetCharacters(result);
    } else if (event is _SearchCharacters) {
      _isGettingItems = true;
      page = 1;
      yield const _Loading();
      final result =
          await _charactersRepository.getCharacters(page, query: event.query);
      yield* _mapSearchCharacters(result);
    } else if (event is _SearchMoreCharacters) {
      _isGettingItems = true;
      yield const _LoadingMore();
      final result =
          await _charactersRepository.getCharacters(page, query: event.query);
      yield* _mapSearchMoreCharacters(result);
    }
  }

  Stream<CharactersState> _mapGetCharacters(
      Either<Failure, List<Character?>> result) async* {
    yield result.fold((l) => const _Error(), (r) {
      _hasReachedEnd = r.isEmpty;
      _isGettingItems = false;
      _characters.addAll(r);
      page++;
      return const _Loaded();
    });
  }

  Stream<CharactersState> _mapSearchCharacters(
      Either<Failure, List<Character?>> result) async* {
    yield result.fold((l) => const _Error(), (r) {
      _characters
        ..clear()
        ..addAll(r);
      _isGettingItems = false;
      page++;
      if (r.isEmpty) {
        return const _Empty();
      }
      return const _Loaded();
    });
  }

  Stream<CharactersState> _mapSearchMoreCharacters(
      Either<Failure, List<Character?>> result) async* {
    yield result.fold((l) => const _Error(), (r) {
      _hasReachedEnd = r.isEmpty;
      _isGettingItems = false;
      _characters.addAll(r);
      page++;
      return const _Loaded();
    });
  }
}

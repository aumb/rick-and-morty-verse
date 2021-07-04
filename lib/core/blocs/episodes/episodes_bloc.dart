import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/core/models/failure.dart';
import 'package:rick_and_morty_verse/core/repositories/episodes_repository.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';
part 'episodes_bloc.freezed.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc(this._episodesRepository) : super(const _Initial());

  final EpisodesRepository _episodesRepository;

  bool _hasReachedEnd = false;
  bool _isGettingItems = false;

  bool get canGetMore => !_hasReachedEnd && !_isGettingItems;

  final List<Episode?> _episodes = [];
  List<Episode?> get episodes => _episodes;

  int page = 1;

  @override
  Stream<EpisodesState> mapEventToState(
    EpisodesEvent event,
  ) async* {
    if (event is _GetEpisodes) {
      _isGettingItems = true;
      if (state is! _Initial) {
        yield const _Loading();
      }
      final result = await _episodesRepository.getEpisodes(page);
      yield* _mapGetEpisodes(result);
    } else if (event is _SearchEpisodes) {
      _isGettingItems = true;
      page = 1;
      yield const _Loading();
      final result =
          await _episodesRepository.getEpisodes(page, query: event.query);
      yield* _mapSearchEpisodes(result);
    } else if (event is _SearchMoreEpisodes) {
      _isGettingItems = true;
      yield const _LoadingMore();
      final result =
          await _episodesRepository.getEpisodes(page, query: event.query);
      yield* _mapSearchMoreEpisodes(result);
    }
  }

  Stream<EpisodesState> _mapGetEpisodes(
      Either<Failure, List<Episode?>> result) async* {
    yield result.fold((l) => const _Error(), (r) {
      _hasReachedEnd = r.isEmpty;
      _isGettingItems = false;
      _episodes.addAll(r);
      page++;
      return const _Loaded();
    });
  }

  Stream<EpisodesState> _mapSearchEpisodes(
      Either<Failure, List<Episode?>> result) async* {
    yield result.fold((l) => const _Error(), (r) {
      _episodes
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

  Stream<EpisodesState> _mapSearchMoreEpisodes(
      Either<Failure, List<Episode?>> result) async* {
    yield result.fold((l) => const _Error(), (r) {
      _hasReachedEnd = r.isEmpty;
      _isGettingItems = false;
      _episodes.addAll(r);
      page++;
      return const _Loaded();
    });
  }
}

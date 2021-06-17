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
        yield const EpisodesState.loading();
      }
      final result = await _episodesRepository.getEpisodes(page);
      yield* _mapGetEpisodes(result);
    }
  }

  Stream<EpisodesState> _mapGetEpisodes(
      Either<Failure, List<Episode?>> result) async* {
    yield result.fold((l) => const EpisodesState.error(), (r) {
      _hasReachedEnd = r.isEmpty;
      _isGettingItems = false;
      _episodes.addAll(r);
      page++;
      return const EpisodesState.loaded();
    });
  }
}

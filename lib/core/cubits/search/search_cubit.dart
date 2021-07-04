import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_verse/core/blocs/characters/characters_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/episodes/episodes_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/rm_locations/rm_locations_bloc.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    this.charactersBloc,
    this.episodesBloc,
    this.locationsBloc,
  }) : super(const SearchState.initial()) {
    if (charactersBloc != null) setupCharactersBlocSubscription();
    if (episodesBloc != null) setupEpisodesBlocSubscription();
    if (locationsBloc != null) setupLocationsBlocSubscription();
  }

  final CharactersBloc? charactersBloc;
  final EpisodesBloc? episodesBloc;
  final RMLocationsBloc? locationsBloc;

  late StreamSubscription charactersBlocSubscription;
  late StreamSubscription episodesBlocSubscription;
  late StreamSubscription locationsBlocSubscription;

  String query = '';

  @override
  Future<void> close() {
    if (charactersBloc != null) charactersBlocSubscription.cancel();
    if (episodesBloc != null) episodesBlocSubscription.cancel();
    if (locationsBloc != null) locationsBlocSubscription.cancel();
    return super.close();
  }

  void getAllResults() {
    emit(const _Loading());
    charactersBloc?.add(
      CharactersEvent.searchCharacters(query: query),
    );
    episodesBloc?.add(EpisodesEvent.searchEpisodes(query: query));
    locationsBloc?.add(RMLocationsEvent.searchLocations(query: query));
  }

  void getCharactersResult() async {
    emit(const _Loading());
    charactersBloc?.add(
      CharactersEvent.searchCharacters(query: query),
    );
  }

  void getMoreCharactersResult() async {
    charactersBloc?.add(
      CharactersEvent.searchMoreCharacters(query: query),
    );
  }

  void getEpisodesResult() {
    emit(const _Loading());
    episodesBloc?.add(EpisodesEvent.searchEpisodes(query: query));
  }

  void getMoreEpisodesResult() async {
    episodesBloc?.add(
      EpisodesEvent.searchMoreEpisodes(query: query),
    );
  }

  void getLocationsResult() {
    emit(const _Loading());
    locationsBloc?.add(RMLocationsEvent.searchLocations(query: query));
  }

  void getMoreLocationsResult() async {
    locationsBloc?.add(
      RMLocationsEvent.searchMoreLocations(query: query),
    );
  }

  void setupCharactersBlocSubscription() {
    charactersBlocSubscription =
        charactersBloc!.stream.listen((charactersState) {
      emit(const _Loaded());
    });
  }

  void setupEpisodesBlocSubscription() {
    episodesBlocSubscription = episodesBloc!.stream.listen((episodesState) {
      emit(const _Loaded());
    });
  }

  void setupLocationsBlocSubscription() {
    locationsBlocSubscription = locationsBloc!.stream.listen((locationsState) {
      emit(const _Loaded());
    });
  }
}

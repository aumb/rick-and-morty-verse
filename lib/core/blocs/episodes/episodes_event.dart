part of 'episodes_bloc.dart';

@freezed
class EpisodesEvent with _$EpisodesEvent {
  const factory EpisodesEvent.getEpisodes() = _GetEpisodes;

  const factory EpisodesEvent.searchEpisodes({required String query}) =
      _SearchEpisodes;

  const factory EpisodesEvent.searchMoreEpisodes({required String query}) =
      _SearchMoreEpisodes;
}

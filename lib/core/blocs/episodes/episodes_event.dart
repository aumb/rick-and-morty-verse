part of 'episodes_bloc.dart';

@freezed
class EpisodeEvent with _$EpisodeEvent {
  const factory EpisodeEvent.started() = _Started;
}
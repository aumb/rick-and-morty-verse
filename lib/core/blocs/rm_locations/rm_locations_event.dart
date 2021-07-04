part of 'rm_locations_bloc.dart';

@freezed
class RMLocationsEvent with _$RMLocationsEvent {
  const factory RMLocationsEvent.getLocations() = _GetLocations;

  const factory RMLocationsEvent.searchLocations({required String query}) =
      _SearchLocations;

  const factory RMLocationsEvent.searchMoreLocations({required String query}) =
      _SearchMoreLocations;
}

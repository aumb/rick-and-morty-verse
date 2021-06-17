import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_verse/core/models/failure.dart';
import 'package:rick_and_morty_verse/core/models/location/location.dart';
import 'package:rick_and_morty_verse/core/repositories/locations_repository.dart';

part 'rm_locations_event.dart';
part 'rm_locations_state.dart';
part 'rm_locations_bloc.freezed.dart';

class RMLocationsBloc extends Bloc<RMLocationsEvent, RMLocationsState> {
  RMLocationsBloc(this._locationsRepository) : super(const _Initial());

  final RMLocationsRepository _locationsRepository;

  bool _hasReachedEnd = false;
  bool _isGettingItems = false;

  bool get canGetMore => !_hasReachedEnd && !_isGettingItems;

  final List<RMLocation?> _locations = [];
  List<RMLocation?> get locations => _locations;

  int page = 1;

  @override
  Stream<RMLocationsState> mapEventToState(
    RMLocationsEvent event,
  ) async* {
    if (event is _GetLocations) {
      _isGettingItems = true;
      if (state is! _Initial) {
        yield const RMLocationsState.loading();
      }
      final result = await _locationsRepository.getLocations(page);
      yield* _mapGetEpisodes(result);
    }
  }

  Stream<RMLocationsState> _mapGetEpisodes(
      Either<Failure, List<RMLocation?>> result) async* {
    yield result.fold((l) => const RMLocationsState.error(), (r) {
      _hasReachedEnd = r.isEmpty;
      _isGettingItems = false;
      _locations.addAll(r);
      page++;
      return const RMLocationsState.loaded();
    });
  }
}

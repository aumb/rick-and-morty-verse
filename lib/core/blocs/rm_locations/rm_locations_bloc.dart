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
        yield const _Loading();
      }
      final result = await _locationsRepository.getLocations(page);
      yield* _mapGetLocations(result);
    } else if (event is _SearchLocations) {
      _isGettingItems = true;
      page = 1;
      yield const _Loading();
      final result =
          await _locationsRepository.getLocations(page, query: event.query);
      yield* _mapSearchLocations(result);
    } else if (event is _SearchMoreLocations) {
      _isGettingItems = true;
      yield const _LoadingMore();
      final result =
          await _locationsRepository.getLocations(page, query: event.query);
      yield* _mapSearchMoreLocations(result);
    }
  }

  Stream<RMLocationsState> _mapGetLocations(
      Either<Failure, List<RMLocation?>> result) async* {
    yield result.fold((l) => const _Error(), (r) {
      _hasReachedEnd = r.isEmpty;
      _isGettingItems = false;
      _locations.addAll(r);
      page++;
      return const _Loaded();
    });
  }

  Stream<RMLocationsState> _mapSearchLocations(
      Either<Failure, List<RMLocation?>> result) async* {
    yield result.fold((l) => const _Error(), (r) {
      _locations
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

  Stream<RMLocationsState> _mapSearchMoreLocations(
      Either<Failure, List<RMLocation?>> result) async* {
    yield result.fold((l) => const _Error(), (r) {
      _hasReachedEnd = r.isEmpty;
      _isGettingItems = false;
      _locations.addAll(r);
      page++;
      return const _Loaded();
    });
  }
}

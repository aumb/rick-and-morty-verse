import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rm_locations_event.dart';
part 'rm_locations_state.dart';
part 'rm_locations_bloc.freezed.dart';

class RmLocationsBloc extends Bloc<RmLocationsEvent, RmLocationsState> {
  RmLocationsBloc() : super(const _Initial());

  @override
  Stream<RmLocationsState> mapEventToState(
    RmLocationsEvent event,
  ) async* {}
}

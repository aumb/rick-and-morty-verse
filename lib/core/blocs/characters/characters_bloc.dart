import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'characters_event.dart';
part 'characters_state.dart';
part 'characters_bloc.freezed.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(const _Initial());

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

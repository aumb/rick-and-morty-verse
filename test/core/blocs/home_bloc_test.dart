import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_verse/core/blocs/home/home_bloc.dart';

void main() {
  late HomeBloc bloc;

  setUp(() {
    bloc = HomeBloc();
  });

  tearDown(() {
    bloc.close();
  });

  group('HomeBloc', () {
    test('initial state is HomeState.navigationScreenChanged(0)', () {
      expect(
          HomeBloc().state, equals(const HomeState.navigationScreenChanged(0)));
    });

    group('HomeEvent.itemSelected', () {
      blocTest<HomeBloc, HomeState>(
        'emits HomeState.navigationScreenChanged(0) page has changed',
        build: () {
          return HomeBloc();
        },
        act: (bloc) => bloc.add(
          const HomeEvent.itemSelected(0),
        ),
        expect: () => [const HomeState.navigationScreenChanged(0)],
      );
    });
  });
}

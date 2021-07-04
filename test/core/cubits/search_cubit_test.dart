import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/core/blocs/characters/characters_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/episodes/episodes_bloc.dart';
import 'package:rick_and_morty_verse/core/blocs/rm_locations/rm_locations_bloc.dart';
import 'package:rick_and_morty_verse/core/cubits/search/search_cubit.dart';

class MockCharactersBloc extends Mock implements CharactersBloc {}

class MockEpisodesBloc extends Mock implements EpisodesBloc {}

class MockRMLocationsBloc extends Mock implements RMLocationsBloc {}

void main() {
  late MockCharactersBloc mockCharactersBloc;
  late MockEpisodesBloc mockEpisodesBloc;
  late MockRMLocationsBloc mockRMLocationsBloc;

  setUp(() {
    mockCharactersBloc = MockCharactersBloc();
    mockEpisodesBloc = MockEpisodesBloc();
    mockRMLocationsBloc = MockRMLocationsBloc();
  });

  void setupIntialCharactersState() async {
    when(() => mockCharactersBloc.stream).thenAnswer(
      (_) => Stream.fromIterable(
          [const CharactersState.loading(), const CharactersState.loaded()]),
    );

    when(() => mockCharactersBloc.characters).thenAnswer(
      (_) => [],
    );
  }

  void setupLoadedCharactersState() async {
    when(() => mockCharactersBloc.stream).thenAnswer(
      (_) => Stream.fromIterable(
          [const CharactersState.loading(), const CharactersState.loaded()]),
    );

    when(() => mockCharactersBloc.characters).thenAnswer(
      (_) => [],
    );
  }

  void setupIntialEpisodesState() async {
    when(() => mockEpisodesBloc.stream).thenAnswer(
      (_) => Stream.fromIterable([const EpisodesState.initial()]),
    );

    when(() => mockEpisodesBloc.episodes).thenAnswer(
      (_) => [],
    );
  }

  void setupLoadedEpisodesState() async {
    when(() => mockEpisodesBloc.stream).thenAnswer(
      (_) => Stream.fromIterable(
          [const EpisodesState.loading(), const EpisodesState.loaded()]),
    );

    when(() => mockEpisodesBloc.episodes).thenAnswer(
      (_) => [],
    );
  }

  void setupIntialLocationsState() async {
    when(() => mockRMLocationsBloc.stream).thenAnswer(
      (_) => Stream.fromIterable([const RMLocationsState.initial()]),
    );

    when(() => mockRMLocationsBloc.locations).thenAnswer(
      (_) => [],
    );
  }

  void setupLoadedLocationsState() async {
    when(() => mockRMLocationsBloc.stream).thenAnswer(
      (_) => Stream.fromIterable(
          [const RMLocationsState.loading(), const RMLocationsState.loaded()]),
    );

    when(() => mockRMLocationsBloc.locations).thenAnswer(
      (_) => [],
    );
  }

  group('Search Cubit', () {
    test('initial state is SearchState.initial()', () {
      expect(SearchCubit().state, equals(const SearchState.initial()));
    });
    group('Characters', () {
      group('getCharactersResult', () {
        blocTest<SearchCubit, SearchState>(
          'emits intial when characters bloc state is intial',
          build: () {
            setupIntialCharactersState();
            return (SearchCubit(charactersBloc: mockCharactersBloc));
          },
          verify: (_) {
            verify(
              () => mockCharactersBloc.add(
                const CharactersEvent.searchCharacters(query: ''),
              ),
            );
          },
          act: (cubit) => cubit.getCharactersResult(),
          expect: () =>
              [const SearchState.loading(), const SearchState.loaded()],
        );
        blocTest<SearchCubit, SearchState>(
          'emits loading then loaded when getting characters is sucessfull',
          build: () {
            setupLoadedCharactersState();
            return (SearchCubit(charactersBloc: mockCharactersBloc));
          },
          verify: (_) {
            verify(
              () => mockCharactersBloc.add(
                const CharactersEvent.searchCharacters(query: ''),
              ),
            );
          },
          act: (cubit) => cubit.getCharactersResult(),
          expect: () =>
              [const SearchState.loading(), const SearchState.loaded()],
        );
      });

      group('getMoreCharactersResult', () {
        blocTest<SearchCubit, SearchState>(
          'emits SearchState.loaded() when getting more characters',
          build: () {
            setupIntialCharactersState();
            return (SearchCubit(charactersBloc: mockCharactersBloc));
          },
          verify: (_) {
            verify(
              () => mockCharactersBloc.add(
                const CharactersEvent.searchMoreCharacters(query: ''),
              ),
            );
          },
          act: (cubit) => cubit.getMoreCharactersResult(),
          expect: () => [const SearchState.loaded()],
        );
      });
    });
    group('Episodes', () {
      group('getEpisodesResult', () {
        blocTest<SearchCubit, SearchState>(
          'emits intial when episodes bloc state is intial',
          build: () {
            setupIntialEpisodesState();
            return (SearchCubit(episodesBloc: mockEpisodesBloc));
          },
          verify: (_) {
            verify(
              () => mockEpisodesBloc.add(
                const EpisodesEvent.searchEpisodes(query: ''),
              ),
            );
          },
          act: (cubit) => cubit.getEpisodesResult(),
          expect: () =>
              [const SearchState.loading(), const SearchState.loaded()],
        );
        blocTest<SearchCubit, SearchState>(
          'emits loading then loaded when getting episodes is sucessfull',
          build: () {
            setupLoadedEpisodesState();
            return (SearchCubit(episodesBloc: mockEpisodesBloc));
          },
          verify: (_) {
            verify(
              () => mockEpisodesBloc.add(
                const EpisodesEvent.searchEpisodes(query: ''),
              ),
            );
          },
          act: (cubit) => cubit.getEpisodesResult(),
          expect: () =>
              [const SearchState.loading(), const SearchState.loaded()],
        );
      });

      group('getMoreEpisodesResult', () {
        blocTest<SearchCubit, SearchState>(
          'emits SearchState.loaded() when getting more episodes',
          build: () {
            setupIntialEpisodesState();
            return (SearchCubit(episodesBloc: mockEpisodesBloc));
          },
          verify: (_) {
            verify(
              () => mockEpisodesBloc.add(
                const EpisodesEvent.searchMoreEpisodes(query: ''),
              ),
            );
          },
          act: (cubit) => cubit.getMoreEpisodesResult(),
          expect: () => [const SearchState.loaded()],
        );
      });
    });

    group('Locations', () {
      group('getLocationsResult', () {
        blocTest<SearchCubit, SearchState>(
          'emits intial when locations bloc state is intial',
          build: () {
            setupIntialLocationsState();
            return (SearchCubit(locationsBloc: mockRMLocationsBloc));
          },
          verify: (_) {
            verify(
              () => mockRMLocationsBloc.add(
                const RMLocationsEvent.searchLocations(query: ''),
              ),
            );
          },
          act: (cubit) => cubit.getLocationsResult(),
          expect: () =>
              [const SearchState.loading(), const SearchState.loaded()],
        );
        blocTest<SearchCubit, SearchState>(
          'emits loading then loaded when getting locations is sucessfull',
          build: () {
            setupLoadedLocationsState();
            return (SearchCubit(locationsBloc: mockRMLocationsBloc));
          },
          verify: (_) {
            verify(
              () => mockRMLocationsBloc.add(
                const RMLocationsEvent.searchLocations(query: ''),
              ),
            );
          },
          act: (cubit) => cubit.getLocationsResult(),
          expect: () =>
              [const SearchState.loading(), const SearchState.loaded()],
        );
      });

      group('getMoreLocationsResult', () {
        blocTest<SearchCubit, SearchState>(
          'emits SearchState.loaded() when getting more locations',
          build: () {
            setupIntialLocationsState();
            return (SearchCubit(locationsBloc: mockRMLocationsBloc));
          },
          verify: (_) {
            verify(
              () => mockRMLocationsBloc.add(
                const RMLocationsEvent.searchMoreLocations(query: ''),
              ),
            );
          },
          act: (cubit) => cubit.getMoreLocationsResult(),
          expect: () => [const SearchState.loaded()],
        );
      });
    });

    group('All results', () {
      blocTest<SearchCubit, SearchState>(
        'emits SearchState.loading() SearchState.loaded() when getting results',
        build: () {
          setupIntialLocationsState();
          setupIntialCharactersState();
          setupIntialEpisodesState();
          return (SearchCubit(
            locationsBloc: mockRMLocationsBloc,
            episodesBloc: mockEpisodesBloc,
            charactersBloc: mockCharactersBloc,
          ));
        },
        verify: (_) {
          verify(
            () => mockRMLocationsBloc.add(
              const RMLocationsEvent.searchLocations(query: ''),
            ),
          );
          verify(
            () => mockEpisodesBloc.add(
              const EpisodesEvent.searchEpisodes(query: ''),
            ),
          );
          verify(
            () => mockCharactersBloc.add(
              const CharactersEvent.searchCharacters(query: ''),
            ),
          );
        },
        act: (cubit) => cubit.getAllResults(),
        expect: () => [const SearchState.loading(), const SearchState.loaded()],
      );
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_verse/core/cubits/theme/theme_cubit.dart';
import 'package:rick_and_morty_verse/core/enums/theme_state.dart';
import 'package:rick_and_morty_verse/core/utils/theme_utils.dart';

class MockStorage extends Mock implements Storage {
  @override
  Future<void> write(String key, dynamic value) async {}
}

void main() {
  final hydratedStorage = MockStorage();

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = hydratedStorage;
  });

  group('ThemeCubit', () {
    late ThemeCubit cubit;

    setUp(() {
      cubit = ThemeCubit();
    });

    test('has initial value', () async {
      expect(cubit.state, ThemeState.system);
      expect(cubit.theme, ThemeState.system);
    });

    group('toJson/fromJson', () {
      test('work properly', () {
        expect(
          cubit.fromJson(cubit.toJson(cubit.state)),
          cubit.state,
        );
      });
    });

    blocTest<ThemeCubit, ThemeState>(
      'can change its state',
      build: () => cubit,
      act: (cubit) => cubit.theme = ThemeState.light,
      expect: () => [
        ThemeState.light,
      ],
    );

    test('has default light theme', () async {
      expect(cubit.lightTheme, ThemeUtils.light);
    });

    test('has default dark theme', () async {
      expect(cubit.darkTheme, ThemeUtils.dark);
    });

    test('returns ThemeMode correctly', () async {
      cubit.theme = ThemeState.system;
      expect(cubit.themeMode, ThemeMode.system);
      cubit.theme = ThemeState.light;
      expect(cubit.themeMode, ThemeMode.light);
      cubit.theme = ThemeState.dark;
      expect(cubit.themeMode, ThemeMode.dark);
    });
  });
}

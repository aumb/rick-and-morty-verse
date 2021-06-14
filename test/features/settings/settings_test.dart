import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_verse/components/custom_bottom_modal_sheet.dart';
import 'package:rick_and_morty_verse/components/radio_widget.dart';
import 'package:rick_and_morty_verse/core/cubits/theme/theme_cubit.dart';
import 'package:rick_and_morty_verse/core/enums/theme_state.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';
import 'package:rick_and_morty_verse/features/settings/settings_page.dart';
import 'package:rick_and_morty_verse/features/settings/widgets/theme_list_tile.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Settings', () {
    Type typeOf<T>() => T;
    late ThemeCubit themeCubit;

    setUp(() {
      initHydratedBloc();
      themeCubit = ThemeCubit();
    });

    tearDown(() {
      themeCubit.close();
    });

    testWidgets('renders SettingsView', (tester) async {
      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => themeCubit,
            ),
          ],
          child: const SettingsPage(),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SettingsView), findsOneWidget);
    });

    testWidgets(
      'renders CustomModalBottomSheet when ThemeListTile is Tapped',
      (tester) async {
        await tester.pumpApp(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => themeCubit,
              ),
            ],
            child: const SettingsView(),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byType(ThemeListTile));
        await tester.pumpAndSettle();
        expect(find.byType(CustomModalBottomSheet), findsOneWidget);
        expect(
            find.byType(typeOf<RadioWidget<ThemeState>>()), findsNWidgets(3));
      },
    );

    group('RadioWidget', () {
      Future<void> setUpRadioWidet(WidgetTester tester) async {
        await tester.pumpApp(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => themeCubit,
              ),
            ],
            child: const MaterialApp(
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              home: SettingsView(),
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byType(ThemeListTile));
        await tester.pumpAndSettle();
      }

      testWidgets(
        'pops CustomModalBottomSheet',
        (tester) async {
          await setUpRadioWidet(tester);
          await tester.tap(find.byKey(const Key('radio_dark_theme')));
          await tester.pumpAndSettle();
          expect(find.byType(CustomModalBottomSheet), findsNothing);
        },
      );

      testWidgets(
        'Changes theme to dark when pressed',
        (tester) async {
          await setUpRadioWidet(tester);
          await tester.tap(find.byKey(const Key('radio_dark_theme')));
          await tester.pumpAndSettle();
          expect(themeCubit.state, equals(ThemeState.dark));
        },
      );

      testWidgets(
        'Changes theme to light when pressed',
        (tester) async {
          await setUpRadioWidet(tester);
          await tester.tap(find.byKey(const Key('radio_light_theme')));
          await tester.pumpAndSettle();
          expect(themeCubit.state, equals(ThemeState.light));
        },
      );
      testWidgets(
        'Changes theme to system when pressed',
        (tester) async {
          await setUpRadioWidet(tester);
          await tester.tap(find.byKey(const Key('radio_system_theme')));
          await tester.pumpAndSettle();
          expect(themeCubit.state, equals(ThemeState.system));
        },
      );
    });
  });
}

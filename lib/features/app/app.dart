// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rick_and_morty_verse/core/cubits/theme/theme_cubit.dart';
import 'package:rick_and_morty_verse/core/enums/theme_state.dart';
import 'package:rick_and_morty_verse/core/repositories/characters_repository.dart';
import 'package:rick_and_morty_verse/core/repositories/episodes_repository.dart';
import 'package:rick_and_morty_verse/core/repositories/locations_repository.dart';
import 'package:rick_and_morty_verse/features/home/home_page.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.charactersRepository,
    required this.episodesRepository,
    required this.locationsRepository,
  }) : super(key: key);

  final CharactersRepository charactersRepository;
  final EpisodesRepository episodesRepository;
  final RMLocationsRepository locationsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CharactersRepository>(
            create: (context) => charactersRepository),
        RepositoryProvider<EpisodesRepository>(
            create: (context) => episodesRepository),
        RepositoryProvider<RMLocationsRepository>(
            create: (context) => locationsRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              theme: context.watch<ThemeCubit>().lightTheme,
              darkTheme: context.watch<ThemeCubit>().darkTheme,
              themeMode: context.watch<ThemeCubit>().themeMode,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}

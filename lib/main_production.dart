// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rick_and_morty_verse/core/repositories/characters_repository.dart';
import 'package:rick_and_morty_verse/core/repositories/episodes_repository.dart';
import 'package:rick_and_morty_verse/core/repositories/locations_repository.dart';

import 'package:rick_and_morty_verse/features/app/app.dart';
import 'package:rick_and_morty_verse/features/app/app_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final gqlClient = GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink('https://rickandmortyapi.com/graphql'),
  );

  runZonedGuarded(
    () => runApp(App(
      charactersRepository: CharactersRepository(gqlClient),
      episodesRepository: EpisodesRepository(gqlClient),
      locationsRepository: RMLocationsRepository(gqlClient),
    )),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_verse/components/list_page_skeleton.dart';
import 'package:rick_and_morty_verse/core/blocs/characters/characters_bloc.dart';
import 'package:rick_and_morty_verse/core/models/character/character.dart';
import 'package:rick_and_morty_verse/core/repositories/characters_repository.dart';
import 'package:rick_and_morty_verse/features/characters/widgets/character_card.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharactersBloc(context.read<CharactersRepository>())
        ..add(
          const CharactersEvent.getCharacters(),
        ),
      child: const CharactersView(),
    );
  }
}

class CharactersView extends StatefulWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  _CharactersViewState createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  late ScrollController _scrollController;

  CharactersBloc get charactersBloc => context.read<CharactersBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(listener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((CharactersBloc c) => c.state);
    final l10n = context.l10n;
    return ListPageSkeleton<Character>(
      title: l10n.characters,
      controller: _scrollController,
      items: charactersBloc.characters,
      isInitialLoad: state == const CharactersState.initial(),
      isLoading: state == const CharactersState.loading(),
      itemBuilder: (character) => CharacterCard(character: character!),
    );
  }

  void listener() {
    final percentage =
        _scrollController.offset / _scrollController.position.maxScrollExtent;
    if (charactersBloc.canGetMore && percentage > 0.8) {
      charactersBloc.add(
        const CharactersEvent.getCharacters(),
      );
    }
  }
}

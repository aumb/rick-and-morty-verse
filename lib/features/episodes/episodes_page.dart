import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_verse/components/list_page_skeleton.dart';
import 'package:rick_and_morty_verse/core/blocs/episodes/episodes_bloc.dart';
import 'package:rick_and_morty_verse/core/models/episode/episode.dart';
import 'package:rick_and_morty_verse/core/repositories/episodes_repository.dart';
import 'package:rick_and_morty_verse/features/episodes/widets/episode_card.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EpisodesBloc(context.read<EpisodesRepository>())
        ..add(
          const EpisodesEvent.getEpisodes(),
        ),
      child: const EpisodesView(),
    );
  }
}

class EpisodesView extends StatefulWidget {
  const EpisodesView({Key? key}) : super(key: key);

  @override
  _EpisodesViewState createState() => _EpisodesViewState();
}

class _EpisodesViewState extends State<EpisodesView> {
  late ScrollController _scrollController;

  EpisodesBloc get episodesBloc => context.read<EpisodesBloc>();

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
    final state = context.select((EpisodesBloc c) => c.state);
    final l10n = context.l10n;
    return ListPageSkeleton<Episode>(
      title: l10n.episodes,
      controller: _scrollController,
      items: episodesBloc.episodes,
      isInitialLoad: state == const EpisodesState.initial(),
      isLoading: state == const EpisodesState.loading(),
      itemBuilder: (episode) => EpisodeCard(episode: episode!),
    );
  }

  void listener() {
    final percentage =
        _scrollController.offset / _scrollController.position.maxScrollExtent;
    if (episodesBloc.canGetMore && percentage > 0.8) {
      episodesBloc.add(
        const EpisodesEvent.getEpisodes(),
      );
    }
  }
}

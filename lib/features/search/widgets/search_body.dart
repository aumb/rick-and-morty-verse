import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_verse/core/cubits/search/search_cubit.dart';
import 'package:rick_and_morty_verse/core/enums/search_option.dart';
import 'package:rick_and_morty_verse/features/search/widgets/search_result_page.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((SearchCubit c) => c.state);
    return TabBarView(children: [
      state == const SearchState.loading()
          ? const SizedBox.shrink()
          : const SearchResultPage(
              option: SearchOption.characters,
            ),
      state == const SearchState.loading()
          ? const SizedBox.shrink()
          : const SearchResultPage(
              option: SearchOption.episodes,
            ),
      state == const SearchState.loading()
          ? const SizedBox.shrink()
          : const SearchResultPage(
              option: SearchOption.locations,
            ),
    ]);
  }
}

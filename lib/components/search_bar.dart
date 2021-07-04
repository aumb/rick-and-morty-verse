import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/core/cubits/search/search_cubit.dart';
import 'package:rick_and_morty_verse/features/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  late String query;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(listener);
    query = '';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(bottom: false, child: _buildSearchBar());
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Ink(
          child: Row(
            children: [
              _buildBackButton(),
              _buildSearchTextField(),
              _buildClearButton(),
            ],
          ),
        ),
      ),
    );
  }

  IconButton _buildBackButton() {
    return IconButton(
      icon: const BackButtonIcon(),
      key: const ValueKey('back_button'),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  Expanded _buildSearchTextField() {
    return Expanded(
      child: TextField(
        controller: _searchController,
        onSubmitted: (q) => context.read<SearchCubit>()
          ..query = q
          ..getAllResults(),
        decoration: InputDecoration(
          hintText: context.l10n.searchHint,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }

  AnimatedOpacity _buildClearButton() {
    return AnimatedOpacity(
      opacity: query.isEmpty ? 0 : 1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
      child: IconButton(
        key: const ValueKey('clear_button'),
        icon: const Icon(Icons.clear),
        onPressed: _searchController.clear,
      ),
    );
  }

  void listener() {
    final text = _searchController.text;
    if (mounted) {
      setState(() {
        query = text;
      });
    }
  }
}

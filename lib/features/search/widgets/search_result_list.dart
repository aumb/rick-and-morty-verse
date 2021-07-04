import 'package:flutter/material.dart';

class SearchResultList<T> extends StatelessWidget {
  const SearchResultList({
    Key? key,
    required this.controller,
    required this.items,
    required this.isInitial,
    required this.isLoading,
    required this.itemBuilder,
    required this.isLoadingMore,
    required this.isEmpty,
    required this.hintText,
    required this.emptyText,
  }) : super(key: key);

  final ScrollController controller;
  final List<T?> items;
  final Widget Function(T?) itemBuilder;

  final bool isInitial;
  final bool isLoading;
  final bool isLoadingMore;
  final bool isEmpty;

  final String hintText;
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    if (isInitial) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.search, size: 100),
          Text(
            hintText,
            key: const ValueKey('hint_text'),
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      );
    } else if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.sentiment_dissatisfied, size: 100),
          Text(
            emptyText,
            key: const ValueKey('empty_text'),
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      );
    } else {
      return ListView.builder(
        controller: controller,
        itemBuilder: (_, index) => Column(
          children: [
            itemBuilder(items[index]),
            if (isLoadingMore && index == items.length - 1)
              const CircularProgressIndicator(),
          ],
        ),
        itemCount: items.length,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/components/page_skeleton.dart';

class ListPageSkeleton<T> extends StatelessWidget {
  const ListPageSkeleton({
    Key? key,
    required this.title,
    required this.controller,
    required this.items,
    required this.isInitialLoad,
    required this.itemBuilder,
    required this.isLoading,
  }) : super(key: key);

  final String title;
  final ScrollController controller;
  final List<T?> items;
  final Widget Function(T?) itemBuilder;

  ///Used to show the inital loading screen
  final bool isInitialLoad;

  ///Used to show the circular progress indicator at the end of the list.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return PageSkeleton(
      title: title,
      controller: controller,
      body: isInitialLoad
          ? const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) => Column(
                  children: [
                    itemBuilder(items[index]),
                    if (isLoading && index == items.length - 1)
                      const CircularProgressIndicator(),
                  ],
                ),
                childCount: items.length,
              ),
            ),
    );
  }
}

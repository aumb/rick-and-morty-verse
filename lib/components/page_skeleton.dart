import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/components/header_text_widget.dart';

class PageSkeleton extends StatelessWidget {
  const PageSkeleton({
    Key? key,
    required this.title,
    required this.body,
    this.shouldAddBottomSpace = false,
    this.controller,
  })  : assert(body is SingleChildRenderObjectWidget ||
            body is SliverMultiBoxAdaptorWidget ||
            body is SliverFillRemaining),
        super(key: key);

  final String title;
  final Widget body;
  final ScrollController? controller;
  final bool shouldAddBottomSpace;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverToBoxAdapter(
          child: HeaderTextWidget(
            title,
            head: true,
          ),
        ),
        body,
        if (shouldAddBottomSpace)
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          )
      ],
    );
  }
}

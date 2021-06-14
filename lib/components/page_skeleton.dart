import 'package:flutter/material.dart';
import 'package:rick_and_morty_verse/components/header_text_widget.dart';

class PageSkeleton extends StatelessWidget {
  const PageSkeleton({
    Key? key,
    required this.title,
    required this.body,
  })  : assert(body is SingleChildRenderObjectWidget ||
            body is SliverMultiBoxAdaptorWidget),
        super(key: key);

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HeaderTextWidget(
            title,
            head: true,
          ),
        ),
        body,
      ],
    );
  }
}

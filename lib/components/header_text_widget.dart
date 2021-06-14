import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget(
    this.text, {
    Key? key,
    this.head = false,
  }) : super(key: key);

  final String text;
  final bool head;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(
        top: head ? 16 : 0,
        left: 16,
        bottom: 16,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

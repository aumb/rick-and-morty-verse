import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rick_and_morty_verse/features/home/widgets/custom_nav_bar_painter.dart';
import 'package:rick_and_morty_verse/features/search/search_page.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
    required this.index,
    required this.onTabChange,
  }) : super(key: key);

  final int index;
  final Function(int) onTabChange;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomPaint(
          size: Size(size.width, 80),
          painter: CustomNavBarPainter(),
        ),
        Center(
          heightFactor: 0.6,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).accentColor,
            elevation: 0.1,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SearchPage()),
            ),
            child: const Icon(Icons.search),
          ),
        ),
        SizedBox(
          width: size.width,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.transparent,
                child: IconButton(
                  splashRadius: 20,
                  key: const ValueKey('characters_icon_button'),
                  icon: Icon(
                    Icons.people,
                    color: index == 0
                        ? Theme.of(context).accentColor
                        : Colors.grey.shade400,
                  ),
                  onPressed: () {
                    onTabChange(0);
                  },
                ),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                    splashRadius: 20,
                    key: const ValueKey('episodes_icon_button'),
                    icon: Icon(
                      Icons.movie_creation,
                      color: index == 1
                          ? Theme.of(context).accentColor
                          : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      onTabChange(1);
                    }),
              ),
              Container(
                width: size.width * 0.20,
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                    splashRadius: 20,
                    key: const ValueKey('locations_icon_button'),
                    icon: Icon(
                      MdiIcons.earth,
                      color: index == 2
                          ? Theme.of(context).accentColor
                          : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      onTabChange(2);
                    }),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                    splashRadius: 20,
                    key: const ValueKey('settings_icon_button'),
                    icon: Icon(
                      Icons.settings,
                      color: index == 3
                          ? Theme.of(context).accentColor
                          : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      onTabChange(3);
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

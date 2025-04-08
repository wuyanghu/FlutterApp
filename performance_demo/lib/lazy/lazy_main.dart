import 'package:flutter/material.dart';

import 'iv_builder_page.dart';
import 'iv_slow_page.dart';
import 'iv_builder_table_page.dart';
import 'list_view_builder_page.dart';
import 'single_child_scroll_view_page.dart';
import 'procedural_generation_page.dart';

final List<Type> pages = <Type>[
  IVBuilderPage,
];

class LazyPage extends StatelessWidget {
  final String title;

  LazyPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Performance Demos'),
      ),
      body: ListView(
        children: <Widget>[
          MyListItem(
            route: '/single-child-scroll-view',
            title: 'Naive List Example',
            subtitle: 'Build everything upfront.',
          ),
          MyListItem(
            route: '/list-view-builder',
            title: 'ListView.builder Example',
            subtitle: 'Build only the visible list items.',
          ),
          MyListItem(
            route: '/iv-slow',
            title: 'Naive InteractiveViewer Example',
            subtitle: "Build everything, even what's not visible.",
          ),
          MyListItem(
            route: '/iv-builder',
            title: 'InteractiveViewer.builder Example',
            subtitle: 'Build only the visible parts of a grid.',
          ),
          MyListItem(
            route: '/procedural-generation',
            title: 'InteractiveViewer.builder Procedural Generation Example',
            subtitle: 'Generate the content to build.',
          ),
          /*
          MyListItem(
            route: '/iv-builder-table',
            title: 'InteractiveViewer Builder Table Example',
            subtitle: 'Build only the visible parts of a table.',
          ),
          */
        ],
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  MyListItem({
    Key? key,
    required this.route,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  final String route;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Card(
        margin: EdgeInsets.all(12.0),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ),
      ),
    );
  }
}

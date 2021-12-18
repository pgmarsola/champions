import 'package:champions/utils/colors.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom(
      {Key? key,
      required this.scroll,
      required this.controller,
      required this.title,
      required this.tabs})
      : super(key: key);

  final bool scroll;
  final TabController controller;
  final String title;
  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: black,
      title: Text(
        title.toUpperCase(),
        style: TextStyle(color: redAccent, fontFamily: 'Valorant'),
      ),
      centerTitle: true,
      pinned: true,
      floating: true,
      forceElevated: scroll,
      bottom: TabBar(
        tabs: tabs,
        controller: controller,
      ),
    );
  }
}

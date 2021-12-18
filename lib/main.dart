// ignore_for_file: prefer_const_constructors

import 'package:champions/mobx/agents/agents.controller.dart';
import 'package:champions/mobx/agents/model/data.model.dart';
import 'package:champions/screens/agents.dart';
import 'package:champions/widgets/appbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AgentsController _agentsController = AgentsController();
  late final TabController _tabController;

  void _incrementCounter() async {
    await _agentsController.fetchAgents();
  }

  @override
  void initState() {
    super.initState();
    _agentsController = AgentsController();
    _tabController = TabController(length: 3, vsync: this);
    _incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            AppBarCustom(
                scroll: innerBoxIsScrolled,
                controller: _tabController,
                title: 'Valorant',
                tabs: const <Tab>[
                  Tab(
                    text: 'Agents',
                  ),
                  Tab(text: 'Maps'),
                  Tab(text: 'Weapons'),
                ])
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Agents(controller: _agentsController),
            FlutterLogo(),
            FlutterLogo(),
          ],
        ),
      ),
    );
  }
}

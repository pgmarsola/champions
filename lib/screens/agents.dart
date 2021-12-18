import 'package:champions/components/agent.card.dart';
import 'package:champions/mobx/agents/agents.controller.dart';
import 'package:champions/mobx/agents/model/data.model.dart';
import 'package:champions/utils/responsive.dart';
import 'package:champions/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Agents extends StatefulWidget {
  const Agents({Key? key, required this.controller}) : super(key: key);

  final AgentsController controller;

  @override
  _AgentsState createState() => _AgentsState();
}

class _AgentsState extends State<Agents> {
  Widget _listData(
    List<Data>? data,
    BuildContext context,
  ) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < data!.length; i++) {
      list.add(Column(
        children: [
          AgentCard(
            data: data[i],
            abilities: data[i].abilities,
          ),
        ],
      ));
    }
    return Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(responsive(context) * 1.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (context) {
              if (widget.controller.isLoading) {
                return const Loader();
              } else {
                if (widget.controller.dataList != null &&
                    widget.controller.dataList!.isNotEmpty) {
                  return Observer(
                      builder: (_) =>
                          _listData(widget.controller.dataList, context));
                } else {
                  return Column(
                    children: [
                      const Text("Não foi possivel carregar dados em tela")
                    ],
                  );
                }
              }
            })
          ],
        ),
      ),
    );
  }
}

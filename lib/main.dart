import 'package:champions/mobx/agents/agents.controller.dart';
import 'package:champions/mobx/agents/model/data.model.dart';
import 'package:champions/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AgentsController _agentsController = AgentsController();

  void _incrementCounter() async {
    await _agentsController.fetchAgents();
  }

  @override
  void initState() {
    super.initState();
    _agentsController = AgentsController();
  }

  Widget _listData(
    List<Data>? data,
    BuildContext context,
  ) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < data!.length; i++) {
      list.add(Column(
        children: [
          Column(
            children: [
              CircleAvatar(
                maxRadius: 50.0,
                backgroundColor: Colors.red,
                backgroundImage:
                    NetworkImage(data[i].displayIcon.toString(), scale: 50),
              ),
              Text(data[i].displayName.toString()),
              Text(data[i].description.toString()),
            ],
          ),
          Divider(
            color: Color(0xffCDCDCD),
          )
        ],
      ));
    }
    return Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(responsive(context) * 1.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(builder: (context) {
                if (_agentsController.isLoading) {
                  return CircularProgressIndicator(
                    backgroundColor: Colors.red,
                    color: Colors.green,
                  );
                } else {
                  if (_agentsController.dataList != null &&
                      _agentsController.dataList!.isNotEmpty) {
                    return Observer(
                        builder: (_) =>
                            _listData(_agentsController.dataList, context));
                  } else {
                    return Column(
                      children: [
                        Text("Não foi possivel carregar dados em tela")
                      ],
                    );
                  }
                }
              })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

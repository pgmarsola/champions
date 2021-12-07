// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agents.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgentsController on _AgentsControllerBase, Store {
  final _$dataAtom = Atom(name: '_AgentsControllerBase.data');

  @override
  Data? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(Data? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$dataListAtom = Atom(name: '_AgentsControllerBase.dataList');

  @override
  List<Data>? get dataList {
    _$dataListAtom.reportRead();
    return super.dataList;
  }

  @override
  set dataList(List<Data>? value) {
    _$dataListAtom.reportWrite(value, super.dataList, () {
      super.dataList = value;
    });
  }

  final _$agentsAtom = Atom(name: '_AgentsControllerBase.agents');

  @override
  Agents? get agents {
    _$agentsAtom.reportRead();
    return super.agents;
  }

  @override
  set agents(Agents? value) {
    _$agentsAtom.reportWrite(value, super.agents, () {
      super.agents = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AgentsControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isConnectedAtom = Atom(name: '_AgentsControllerBase.isConnected');

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  final _$fetchAgentsAsyncAction =
      AsyncAction('_AgentsControllerBase.fetchAgents');

  @override
  Future fetchAgents() {
    return _$fetchAgentsAsyncAction.run(() => super.fetchAgents());
  }

  @override
  String toString() {
    return '''
data: ${data},
dataList: ${dataList},
agents: ${agents},
isLoading: ${isLoading},
isConnected: ${isConnected}
    ''';
  }
}

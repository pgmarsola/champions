import 'package:champions/mobx/agents/agents.repository.dart';
import 'package:mobx/mobx.dart';
import 'package:champions/helper/connectivity.state.dart';

import 'model/agents.model.dart';
import 'model/data.model.dart';

part 'agents.controller.g.dart';

class AgentsController = _AgentsControllerBase with _$AgentsController;

abstract class _AgentsControllerBase with Store {
  late AgentsRepository _agentsRepository;

  _AgentsControllerBase() {
    _agentsRepository = AgentsRepository();
  }

  @observable
  Data? data;

  @observable
  List<Data>? dataList;

  @observable
  Agents? agents;

  @observable
  bool isLoading = false;

  @observable
  bool isConnected = false;

  @action
  fetchAgents() async {
    isLoading = true;
    isConnected = await checkInternetConnection();

    if (isConnected == true) {
      agents = await _agentsRepository.fetchData();
      if (agents?.data != null) {
        dataList = agents?.data;
      }
    } else {
      dataList = null;
    }

    isLoading = false;
  }
}

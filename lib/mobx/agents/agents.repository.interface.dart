import 'package:champions/mobx/agents/model/agents.model.dart';
import 'package:champions/mobx/agents/model/data.model.dart';

abstract class IAgentsRepository {
  Future<Agents> fetchData();
}

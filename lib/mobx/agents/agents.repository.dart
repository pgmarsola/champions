import 'dart:convert';
import 'package:champions/mobx/agents/agents.repository.interface.dart';
import 'package:champions/mobx/agents/model/agents.model.dart';
import 'package:http/http.dart' as http;

class AgentsRepository extends IAgentsRepository {
  @override
  Future<Agents> fetchData() async {
    var url = Uri.parse("https://valorant-api.com/v1/agents?language=pt-BR");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var agentsResponse = jsonDecode(response.body);
        var agents = Agents.fromJson(agentsResponse);

        return agents;
      } else {
        return Agents(status: 0, data: []);
      }
    } catch (e) {
      print('$e');
      return Agents(status: 0, data: []);
    }
  }
}

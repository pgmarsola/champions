import 'package:champions/mobx/agents/model/abilities.model.dart';
import 'package:champions/mobx/agents/model/data.model.dart';
import 'package:champions/utils/colors.dart';
import 'package:champions/utils/responsive.dart';
import 'package:flutter/material.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({Key? key, required this.data, required this.abilities})
      : super(key: key);

  final Data data;
  final List<Abilities>? abilities;

  Widget _listAbilities(
    List<Abilities>? data,
    BuildContext context,
  ) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < data!.length; i++) {
      list.add(Container(
        child: Image.network(data[i].displayIcon.toString()),
        height: responsive(context) * 3.5,
        width: responsive(context) * 3.5,
        color: transparent,
      ));
    }
    return Row(
      children: list,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: transparent,
      height: responsive(context) * 20,
      margin: EdgeInsets.symmetric(
        horizontal: responsive(context) * 1,
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                color: black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(45),
                    topLeft: const Radius.circular(45),
                    bottomRight: Radius.circular(responsive(context) * 1.5),
                    topRight: Radius.circular(responsive(context) * 1.5),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                child: Container(
                    height: responsive(context) * 12,
                    width: displayWidth(context),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: responsive(context) * 1,
                        top: responsive(context) * 1,
                        // right: responsive(context) * 1,
                        left: responsive(context) * 15,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.displayName.toString(),
                            style: const TextStyle(
                                color: white, fontFamily: 'Valorant'),
                          ),
                          SizedBox(
                            height: responsive(context) * 1.5,
                          ),
                          _listAbilities(abilities, context)
                        ],
                      ),
                    )),
              )),

          //IMAGEM
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: responsive(context) * 15,
              height: responsive(context) * 15,
              margin: EdgeInsets.only(
                  bottom: responsive(context) * 0.75,
                  left: responsive(context) * 0.8),
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(33)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(data.displayIcon.toString(),
                          scale: 50))),
            ),
          ),
        ],
      ),
    );
  }
}

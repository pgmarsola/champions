import 'package:champions/utils/colors.dart';
import 'package:champions/utils/responsive.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Image.asset(
        'assets/imgs/load-2.gif',
      ),
      height: responsive(context) * 20,
      color: transparent,
    ));
  }
}

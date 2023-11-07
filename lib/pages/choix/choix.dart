import 'package:easyshoppingapp/pages/choix/widgets/boutonChoix.dart';
import 'package:easyshoppingapp/pages/choix/widgets/headerSection.dart';
import 'package:flutter/material.dart';

class ChoixPage extends StatelessWidget {
  const ChoixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderChoix(),
            BoutonChoix(),
          ],
        )),
    );
  }
}
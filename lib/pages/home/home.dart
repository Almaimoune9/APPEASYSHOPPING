import 'package:easyshoppingapp/pages/home/widgets/boutonSection.dart';
import 'package:easyshoppingapp/pages/home/widgets/header.dart';
import 'package:easyshoppingapp/pages/home/widgets/imageSection.dart';
import 'package:easyshoppingapp/pages/home/widgets/textSection.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 248, 250),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderSection(),
                ImageSection(),
                SizedBox(height: 20),
                TextSection(),
                SizedBox(height: 25),
                BoutonSection(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
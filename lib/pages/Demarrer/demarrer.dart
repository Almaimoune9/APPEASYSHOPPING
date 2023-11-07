import 'package:easyshoppingapp/pages/Demarrer/widgets/boutonDemarrer.dart';
import 'package:easyshoppingapp/pages/Demarrer/widgets/header.dart';
import 'package:easyshoppingapp/pages/Demarrer/widgets/imageSectionD.dart';
import 'package:flutter/material.dart';

class DemarrerPage extends StatelessWidget {
  const DemarrerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF5D2D68),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderDemarrer(),
            ImageSectionD(),
            SizedBox(height: 30),
            BoutonDemarrer()
        ]),
      ),
      
    );
  }
}
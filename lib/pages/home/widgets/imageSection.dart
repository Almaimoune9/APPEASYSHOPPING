import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              child: Image.asset("assets/images/Demarrer.png")
            ),
           )
        ],
      ),
    );
  }
}
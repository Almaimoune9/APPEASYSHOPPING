import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Stack(
        children: [
          Transform(transform: Matrix4.identity()..rotateZ(0),
          origin: const Offset(0, 0),
          child: Image.asset(
            "assets/images/SHOPPING-removebg-preview 9.png",
            height: 100,
            width: 150,),
            ),       
        ],
      ),
    );
  }
}
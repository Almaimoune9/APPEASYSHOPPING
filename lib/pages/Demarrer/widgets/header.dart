import 'package:flutter/material.dart';

class HeaderDemarrer extends StatelessWidget {
  const HeaderDemarrer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
          Positioned(
            child: Container(
              margin: EdgeInsets.only(left: 0, right: 150),
              child: Image.asset("assets/images/SHOPPING-removebg-preview 9.png"),
            )
          ),
        ],
      ),
    );
  }
}
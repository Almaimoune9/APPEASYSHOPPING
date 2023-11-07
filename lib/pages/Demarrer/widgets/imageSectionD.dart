import 'package:flutter/material.dart';

class ImageSectionD extends StatelessWidget {
  const ImageSectionD({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 50, left: 20),
      child:  Column(
        children: [
        const Text(
  'Bienvenue',
  style: TextStyle(
    color: Colors.white,
    fontSize: 36,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  ),
),
const Text(
  'Sur easy shopping',
  style: TextStyle(
    color: Color(0xFFF4AB1E),
    fontSize: 36,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  ),
),
Image.asset("assets/images/Demarrer.png")
      ]
      ),     
    );
  }
}
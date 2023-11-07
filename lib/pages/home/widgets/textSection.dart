import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Positioned(
      child: Text(
        'Easy shopping',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    SizedBox(height: 10,),
    SizedBox(
  width: 300,
  height: 200,
  child: Text(
    'Un marché en ligne pour les fournisseurs et les clients qui facilitera les commandes des clients et boostera la visibilité des fournisseurs.',
    style: TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontStyle: FontStyle.italic,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0,
    ),
  ),
)
      ],
    );
  }
}
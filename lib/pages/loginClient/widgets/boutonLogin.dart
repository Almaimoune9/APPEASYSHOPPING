// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BoutonLogin extends StatelessWidget {
  const BoutonLogin({super.key});

@override
Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF561466),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            fixedSize: const Size(300, 50),
          ),
          onPressed: () {
          },
          child: const Text('Connexion', style: TextStyle(fontSize: 20)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
           const Text(
              "Vous n'avez pas de compte",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextButton(
              onPressed: () {
              },
              child: 
              const Text('S\'inscrire', 
              style: TextStyle(fontSize: 15,
              color: Color(0xFF561466),
              fontWeight: FontWeight.w600,
              )),
            ),
          ],
        ),
      ],
    ),
  );
}
}
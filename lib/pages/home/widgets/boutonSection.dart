import 'package:easyshoppingapp/pages/choix/choix.dart';
import 'package:flutter/material.dart';

class BoutonSection extends StatelessWidget {
  const BoutonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: const Color.fromARGB(255, 5, 59, 7),
    backgroundColor: Color(0xFF561466),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    fixedSize: const Size(10, 60),
  ),
  onPressed: () {
    // Naviguer vers la page choix
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ChoixPage()));
  },
  child: const Text('Démarrer maintenant', style: TextStyle(fontSize: 20)),
)
    );
  }
}
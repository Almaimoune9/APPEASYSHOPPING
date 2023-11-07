import 'package:easyshoppingapp/pages/loginClient/loginClient.dart';
import 'package:flutter/material.dart';

class BoutonDemarrer extends StatelessWidget {
  const BoutonDemarrer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          //Boutton Connexion
        ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: const Color.fromARGB(255, 5, 59, 7),
    backgroundColor: const Color.fromARGB(204, 240, 197, 112),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    fixedSize: const Size(350, 50),
  ),
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginClient()));
  },
  child: const Text('Connexion', style: TextStyle(fontSize: 25)),
),
 const SizedBox(height: 50),
//Boutton inscription
 ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: const Color.fromARGB(255, 5, 59, 7),
    backgroundColor: const Color.fromARGB(204, 240, 197, 112),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    fixedSize: const Size(350, 50),
  ),
  onPressed: () {
  },
  child: const Text('Inscription', style: TextStyle(fontSize: 25)),
)
      ]
      ),
    );
  }
}
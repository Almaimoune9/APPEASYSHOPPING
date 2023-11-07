import 'package:easyshoppingapp/pages/Demarrer/demarrer.dart';
import 'package:flutter/material.dart';

class BoutonChoix extends StatelessWidget {
  const BoutonChoix({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Positioned(
            top: 800,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      40.0), // Ajustez l'espace horizontal entre les boutons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ConstrainedBox(
                  constraints: const BoxConstraints(
                  minWidth: 200,
              ),
                   child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF561466), // Couleur de fond du bouton
                      onPrimary: Color.fromARGB(255, 246, 246, 248), // Couleur du texte du bouton
                      padding: const EdgeInsets.all(
                          10.0), // Espacement intérieur du bouton
                    ),
                    child: const Text(
                      'Fournisseur',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                    ),
                  ),
                    const SizedBox(width: 10),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 200,
                      ),
                   child: ElevatedButton(
                     //Chemein pour la page score
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(
                          255, 215, 0, 1.0),
                      onPrimary: const Color.fromRGBO(
                          7, 10, 91, 1.0),
                      padding: const EdgeInsets.all(
                          10.0),
                    ),
                    child:  GestureDetector(
                      onTap: () {
                            // Naviguer vers la page démarrer
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DemarrerPage()));
                      },
                      // ignore: prefer_const_constructors
                      child: Text(
                        'Client',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
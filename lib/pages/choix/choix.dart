import 'package:easyshoppingapp/pages/Demarrer/demarrer.dart';
import 'package:easyshoppingapp/pagesFour/PageIns/InsFour.dart';
import 'package:flutter/material.dart';

class ChoixPage extends StatefulWidget {
  const ChoixPage({super.key});

  @override
  State<ChoixPage> createState() => _ChoixPageState();
}

class _ChoixPageState extends State<ChoixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 40, top: 50),
                  child: Image.asset(
                    "assets/images/SHOPPING-removebg-preview 9.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Image.asset(
                    "assets/images/Demarrer.png",
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  width: 289,
                  height: 160,
                  child: Text(
                    'Voulez-vous vous inscrire en tant que fournisseur ou client!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 200,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PageInsFournisseur()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF561466),
                                onPrimary: Color.fromARGB(255, 246, 246, 248),
                                padding: const EdgeInsets.all(10.0),
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
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const DemarrerPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(
                                    255, 215, 0, 1.0),
                                onPrimary: const Color.fromRGBO(
                                    7, 10, 91, 1.0),
                                padding: const EdgeInsets.all(10.0),
                              ),
                              child: Text(
                                'Client',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easyshoppingapp/pagesFour/PageIns/InsFour.dart';
import 'package:easyshoppingapp/pagesFour/PageNotFour/pageNotFour.dart';
import 'package:flutter/material.dart';

class ConnexionFournisseur extends StatefulWidget {
  const ConnexionFournisseur({super.key});

  @override
  State<ConnexionFournisseur> createState() => _ConnexionFournisseurState();
}

class _ConnexionFournisseurState extends State<ConnexionFournisseur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              Positioned(
              child: Container(
            margin: const EdgeInsets.only(left: 0, right: 150),
            child: Image.asset("assets/images/SHOPPING-removebg-preview 9.png"),
          )),
          const SizedBox(
            height: 20,
          ),
          Positioned(
              child: Container(
            margin: const EdgeInsets.only(left: 25),
            child: Image.asset(
              "assets/images/Demarrer.png",
            ),
          )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  hintText: 'Entrez votre email',
                  labelText: 'Email',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.password),
                  hintText: 'Entrez votre mot de pass',
                  labelText: 'Mot de pass',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              )
            ),
            SizedBox(height: 20,),
            ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF561466),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            fixedSize: const Size(300, 50),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PageNotFournisseur()));
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
        ),
      ),
    );
  }
}
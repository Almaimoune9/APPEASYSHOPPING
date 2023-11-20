import 'package:easyshoppingapp/pagesFour/ConnexionFour/connexionFournisseur.dart';
import 'package:flutter/material.dart';

List<String> list = <String>[
  'Electronique',
  'Voiture',
  'Construction',
  'Pour la maison'
];

class PageInsFournisseur extends StatefulWidget {
  const PageInsFournisseur({super.key});

  @override
  State<PageInsFournisseur> createState() => _PageInsFournisseurState();
}

class _PageInsFournisseurState extends State<PageInsFournisseur> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              child: Form(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 0, right: 200),
                      child: Image.asset(
                          "assets/images/SHOPPING-removebg-preview 9.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/profile.png",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          hintText: 'Entrez votre nom',
                          labelText: 'Nom',
                        ),
                        onChanged: (String value) {},
                        validator: (String? value) {
                          return (value != null && value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.email),
                          hintText: 'Entrez votre email',
                          labelText: 'Email',
                        ),
                        onChanged: (String value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.location_city),
                          hintText: 'Entrez votre adresse',
                          labelText: 'Adresse',
                        ),
                        onChanged: (String value) {},
                        validator: (String? value) {
                          return (value != null && value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.password),
                          hintText: 'Entrez votre mot de passe',
                          labelText: 'Mot de passe',
                        ),
                        onChanged: (String value) {},
                        validator: (String? value) {
                          return (value != null && value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownMenu<String>(
                      initialSelection: list.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF561466),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        fixedSize: const Size(300, 50),
                      ),
                      onPressed: () {},
                      child: const Text('Inscription',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Vous avez déjà un compte",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ConnexionFournisseur()));
                        },
                        child: const Text('Se connecter',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF561466),
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

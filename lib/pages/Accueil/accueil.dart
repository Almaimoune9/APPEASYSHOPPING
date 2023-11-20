import 'package:easyshoppingapp/pages/Accueil/const.dart';
import 'package:easyshoppingapp/pages/Commentaire/commentairePage.dart';
import 'package:easyshoppingapp/pages/Demarrer/demarrer.dart';
import 'package:easyshoppingapp/pages/ListePanier/listePanier.dart';
import 'package:easyshoppingapp/pages/NotClient/notificationClient.dart';
import 'package:easyshoppingapp/pages/Panier/panier.dart';
import 'package:easyshoppingapp/pages/ProfileClient/profileClient.dart';
import 'package:easyshoppingapp/pages/insClient/insClient.dart';
import 'package:easyshoppingapp/pages/loginClient/loginClient.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int index = 0;

  List page = [
    PanierPage(),
    InsClient(),
  ];

  List imgData = [
    "assets/images/OrdiCat.png",
    "assets/images/VoitCat.png",
    "assets/images/BatCat.png",
    "assets/images/MaisonCat.png",
  ];

  List <String> text = [
    "Mat informatque",
    "Voiture",
    "Batiment",
    "Pour la maison"
  ];
  // List<Widget> gridPages = [
  //   LoginClient(),
  //   
  //   // Ajoute d'autres pages selon ta structure
  // ];
  List<Widget> bottomNavPages = [
    Accueil(), 
    ListePanier(),
  CommentairePage(),
  ProfileClient()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/SHOPPING-removebg-preview 9.png"),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationClient()));
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.purple,
                        size: 30,
                      ))
                ],
              ),
              Container(
                width: 350,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.purple[600],
                    border: Border.all(
                        color: const Color.fromARGB(255, 228, 230, 231)),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                      child: Image.asset('assets/images/Cont.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 242, 239, 243),
                      border: Border.all(color: const Color(0xFFF4AB1E)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      'Categorie',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  )),
              Container(
                child: GridView.builder(
                    padding: EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => page[index]));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 242, 239, 243),
                              border:
                                  Border.all(color: const Color(0xFFF561466)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 115,
                                  child: Image.asset(imgData[index])),
                                const SizedBox(
                                    height:
                                        5), // Espace entre l'image et le texte
                                 Text(
                                  (text[index]),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight
                                        .bold, 
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 239, 243),
              border: Border.all(color: const Color(0xFFF561466)),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 28,
                    ),
                    label: "Accueil"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_basket,
                      size: 28,
                    ),
                    label: "Panier"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.comment,
                      size: 28,
                    ),
                    label: "Commentaire"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 28,
                    ),
                    label: "Profil"),
              ],
              currentIndex: index,
              unselectedItemColor: Colors.black,
              selectedItemColor: primaryColor,
              showUnselectedLabels: true,
              onTap: (value) {
                setState(() {
                  index = value;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => bottomNavPages[index]));
                });
              },
            ),
          )
          ),
    );
  }
}

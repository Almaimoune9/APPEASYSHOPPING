import 'package:easyshoppingapp/pages/Accueil/accueil.dart';
import 'package:easyshoppingapp/pages/Accueil/const.dart';
import 'package:easyshoppingapp/pages/Commentaire/commentairePage.dart';
import 'package:easyshoppingapp/pages/Demarrer/demarrer.dart';
import 'package:easyshoppingapp/pages/ListePanier/listePanier.dart';
import 'package:easyshoppingapp/pages/insClient/insClient.dart';
import 'package:flutter/material.dart';

class ProfileClient extends StatefulWidget {
  const ProfileClient({super.key});

  @override
  State<ProfileClient> createState() => _ProfileClientState();
}

class _ProfileClientState extends State<ProfileClient> {
  int index = 0;

  List<Widget> bottomNavPages = [
    Accueil(), 
    ListePanier(),
  CommentairePage(),
  ProfileClient()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // En-tête avec le logo et l'icône de notifications
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/SHOPPING-removebg-preview 9.png"),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.purple,
                    size: 30,
                  ),
                ),
              ],
            ),

            //Stack pour superposé les éléménts
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Le premier container avec le bouton de retour et le CircleAvatar
                  Container(
                    height: 150,
                    width: 500,
                    margin: const EdgeInsets.only(top: 18, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF561466),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          bottom: 35,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bouton "Modifier profil"
                  Positioned(
                    top: 180,
                    width: 380,
                    left: -10,
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 141, 138, 145),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fixedSize: const Size(300, 50),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Modifier profil',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Lignes pour Nom, Localisation, Email
                  Positioned(
                    top: 220,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.all(35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Nom',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 280,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.all(35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.black,
                            size: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Kalaban Coura ACI',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 340,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.all(35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'example@gmail.com',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bouton "Changer compte" en bas
                  Positioned(
                    top: 500,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
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
                                  primary: Color.fromARGB(255, 102, 20, 20),
                                  onPrimary: Color.fromARGB(255, 248, 248, 250),
                                  padding: const EdgeInsets.all(10.0),
                                ),
                                child: const Text(
                                  'Deconnexion',
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
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 242, 239, 243),
          border: Border.all(color: const Color(0xFFF561466)),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 28,
                ),
                label: "Accueil",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_basket,
                  size: 28,
                ),
                label: "Panier",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.comment,
                  size: 28,
                ),
                label: "Commentaire",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 28,
                ),
                label: "Profil",
              ),
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
        ),
      ),
    );
  }
}

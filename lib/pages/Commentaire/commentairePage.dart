import 'package:easyshoppingapp/pages/Accueil/accueil.dart';
import 'package:easyshoppingapp/pages/Accueil/const.dart';
import 'package:easyshoppingapp/pages/Demarrer/demarrer.dart';
import 'package:easyshoppingapp/pages/ListePanier/listePanier.dart';
import 'package:easyshoppingapp/pages/ProfileClient/profileClient.dart';
import 'package:easyshoppingapp/pages/insClient/insClient.dart';
import 'package:flutter/material.dart';

class CommentairePage extends StatefulWidget {
  const CommentairePage({super.key});

  @override
  State<CommentairePage> createState() => _CommentairePageState();
}

class _CommentairePageState extends State<CommentairePage> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(children: [
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
                    ))
              ],
            ),
            Container(
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 251, 250, 252),
                  border: Border.all(color: Colors.purple, style: BorderStyle.solid,width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                    child: Image.asset('assets/images/com.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFF4AB1E)),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    'Les Commentaires',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                    radius: 20,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Issouf Doucoure',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                            'Lore Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 280,),
            Container(
              width: 350,
              height: 34,
              decoration: ShapeDecoration(
                color: Color(0xFFFEFAFF),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF561466)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Ecrivez un commentaire....',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment:
                        Alignment.center, // Alignement du conteneur au centre
                    child: Container(
                      width: 30,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 8, 8, 8), // Couleur du conteneur
                      ),
                      child: Center(
                        // Centrage de l'icône dans le conteneur
                        child: IconButton(
                          onPressed: () {
                            // Action à effectuer lors du clic sur le bouton
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => bottomNavPages[index]));
                });
              },
            ),
          )
          ),
    );
  }
}

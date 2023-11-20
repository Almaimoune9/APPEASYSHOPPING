import 'package:easyshoppingapp/pages/Accueil/accueil.dart';
import 'package:easyshoppingapp/pages/Accueil/const.dart';
import 'package:easyshoppingapp/pages/Commentaire/commentairePage.dart';
import 'package:easyshoppingapp/pages/ListePanier/listePanier.dart';
import 'package:easyshoppingapp/pages/ProfileClient/profileClient.dart';
import 'package:flutter/material.dart';

class DetailPanier extends StatefulWidget {
  const DetailPanier({super.key});

  @override
  State<DetailPanier> createState() => _DetailPanierState();
}

class _DetailPanierState extends State<DetailPanier> {

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
          top: MediaQuery.of(context).padding.top
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
                    'Panier A',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )),
                SizedBox(height: 10,),
                Text(
                    'Date limite: 12/05/2022',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                 Container(
  width: double.infinity, // Prend toute la largeur disponible
  child: Row(
    children: [
      SizedBox(width: 40,),
      Image.asset(
        'assets/images/moto.png',
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),

      SizedBox(width: 80),

      Text(
        'Moto',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),

      SizedBox(width: 80),
      Text(
        '40',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
)


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
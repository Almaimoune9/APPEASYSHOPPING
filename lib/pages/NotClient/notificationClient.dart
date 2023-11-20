import 'package:easyshoppingapp/pages/Accueil/accueil.dart';
import 'package:easyshoppingapp/pages/Accueil/const.dart';
import 'package:easyshoppingapp/pages/Commentaire/commentairePage.dart';
import 'package:easyshoppingapp/pages/DetailNotClient/detailNotClient.dart';
import 'package:easyshoppingapp/pages/ListePanier/listePanier.dart';
import 'package:easyshoppingapp/pages/ProfileClient/profileClient.dart';
import 'package:flutter/material.dart';

class NotificationClient extends StatefulWidget {
  const NotificationClient({super.key});

  @override
  State<NotificationClient> createState() => _NotificationClientState();
}

class _NotificationClientState extends State<NotificationClient> {
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
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/SHOPPING-removebg-preview 9.png"),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationClient()));
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.purple,
                        size: 30,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.purple),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      'Les notifications',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: Row(
                  children: [Image.asset('assets/images/not.png')],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailNotificationClient()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Color.fromARGB(255, 133, 131, 128))),
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(12),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => bottomNavPages[index]));
                });
              },
            ),
          )),
    );
  }
}

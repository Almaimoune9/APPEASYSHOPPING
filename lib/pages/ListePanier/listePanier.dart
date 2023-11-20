import 'package:easyshoppingapp/pages/Accueil/accueil.dart';
import 'package:easyshoppingapp/pages/Accueil/const.dart';
import 'package:easyshoppingapp/pages/Commentaire/commentairePage.dart';
import 'package:easyshoppingapp/pages/DetailPanier/detailPanier.dart';
import 'package:easyshoppingapp/pages/ProfileClient/profileClient.dart';
import 'package:flutter/material.dart';

class ListePanier extends StatefulWidget {
  const ListePanier({super.key});

  @override
  State<ListePanier> createState() => _ListePanierState();
}

class _ListePanierState extends State<ListePanier> {
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
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
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
                    border: Border.all(
                        color: Colors.purple,
                        style: BorderStyle.solid,
                        width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                      child: Image.asset('assets/images/Panier.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFF4AB1E)),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    'La liste des paniers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )),
              SizedBox(
                height: 10,
              ),
              DataTable(
                dataRowHeight: 60, 
                headingRowHeight: 80, 
                horizontalMargin: 10, 

                columns: [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Nom')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('1')),
                      DataCell(Text('Panier A')),
                      DataCell(Text('2023-12-31')),
                      DataCell(Container(
                        width: 100, // Largeur fixe pour la colonne d'actions
                        child: Row(
                          children: [
                            // IconButton(
                            //   icon: Icon(Icons.details),
                            //   onPressed: () {
                            //     // Action de détails
                            //   },
                            // ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPanier()));
                              },
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                  // Ajoutez d'autres lignes de données au besoin
                ],
              )
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

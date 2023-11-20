import 'package:easyshoppingapp/pages/Accueil/accueil.dart';
import 'package:easyshoppingapp/pages/Accueil/const.dart';
import 'package:easyshoppingapp/pages/Commentaire/commentairePage.dart';
import 'package:easyshoppingapp/pages/ListePanier/listePanier.dart';
import 'package:easyshoppingapp/pages/NotClient/notificationClient.dart';
import 'package:easyshoppingapp/pages/ProfileClient/profileClient.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class DetailNotificationClient extends StatefulWidget {
  const DetailNotificationClient({super.key});

  @override
  State<DetailNotificationClient> createState() =>
      _DetailNotifcationClientState();
}

class _DetailNotifcationClientState extends State<DetailNotificationClient> {
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
                    Image.asset(
                        "assets/images/SHOPPING-removebg-preview 9.png"),
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
                        'Doucoure BTP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: 350,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF000000)),
                        ),
                        child: Column(
                          children: [
                            const Text(                              
                              "Date livraison: 12/03/2024",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            
                            DataTable(
                              columns: const [
                                DataColumn(label: Text('Nom')),
                                DataColumn(label: Text('Quantité')),
                                DataColumn(label: Text('Prix')),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(Text('Moto')),
                                    DataCell(Text('15')),
                                    DataCell(Text('1600')),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Text('Total')),
                                    DataCell(Text('30')),
                                    DataCell(Text('3200')),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationClient()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red, fixedSize: Size(120, 40)),
                      child: Text('Rejeter'),
                    ),
                    SizedBox(width: 60),
                    ElevatedButton(
                      onPressed: () {
                        showSuccessDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple, fixedSize: Size(120, 40)),
                      child: Text('Accepter'),
                    ),
                  ],              
                ),
              ],
            )),
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
  void showSuccessDialog(BuildContext context){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'Succès',
      desc: 'Acceptation envoyer avec succès!',
      btnOkOnPress: (){}
    )..show();
  }
}

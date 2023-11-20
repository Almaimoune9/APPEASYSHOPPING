// import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';

import 'package:easyshoppingapp/Services/api_panier_service.dart';
import 'package:easyshoppingapp/pages/Accueil/accueil.dart';
import 'package:easyshoppingapp/pages/Accueil/const.dart';
import 'package:easyshoppingapp/pages/Commentaire/commentairePage.dart';
import 'package:easyshoppingapp/pages/ListePanier/listePanier.dart';
import 'package:easyshoppingapp/pages/ProfileClient/profileClient.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class PanierPage extends StatefulWidget {
  const PanierPage({Key? key}) : super(key: key);

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  int index = 0;
  List imageList = [
    {"id": 1, "image_path": 'assets/images/BatCat.png'},
    {"id": 2, "image_path": 'assets/images/OrdiCat.png'},
    {"id": 3, "image_path": 'assets/images/VoitCat.png'}
  ];
  List<Widget> bottomNavPages = [
    Accueil(),
    ListePanier(),
    CommentairePage(),
    ProfileClient()
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  TextEditingController titreController = TextEditingController();
  TextEditingController dateLivraisonController = TextEditingController();
  TextEditingController nomProduitController = TextEditingController();
  TextEditingController quantiteController = TextEditingController();
  TextEditingController descriptionProduitController = TextEditingController();

  File? image;
  String? imageSrc;

  Future<File> imageTemporaire(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(imagePath);
  }

  Future<void> _pickerImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setState(() {
          image = File(pickedImage.path);
          imageSrc = pickedImage.path;
        });
      }
    } catch (e) {
      debugPrint('Erreur: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    titreController.clear();
    dateLivraisonController.clear();
    nomProduitController.clear();
    quantiteController.clear();
    descriptionProduitController.clear();
  }

  Future<void> _ajouterPanierAvecProduits() async {
    final titre = titreController.text;
    final dateLivraison = dateLivraisonController.text;
    final nomProduit = nomProduitController.text;
    final quantite = quantiteController.text;
    final descriptionProduit = descriptionProduitController.text;

    try {
      if (image != null) {
        await PanierAPIService.CreerPanierAvecProduits(
          titre: titre,
          dateLivraison: dateLivraison,
          nomProduit: nomProduit,
          quantite: quantite,
          descriptionProduit: descriptionProduit,
          image: image as File,
        );
      } else {
        await PanierAPIService.CreerPanierAvecProduits(
          titre: titre,
          dateLivraison: dateLivraison,
          nomProduit: nomProduit,
          quantite: quantite,
          descriptionProduit: descriptionProduit,
        );
      }

      print("Panier créé avec succès : $titre");
      titreController.clear();
      dateLivraisonController.clear();
      nomProduitController.clear();
      quantiteController.clear();
      descriptionProduitController.clear();
    } catch (e) {
      final String errorMessage = e.toString();
      debugPrint(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: const Color.fromARGB(255, 64, 62, 65)),
                ),
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  child: InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit
                                  .cover, // Ajustez la propriété fit à BoxFit.cover
                              width: double.infinity,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == entry.key
                            ? Colors.red
                            : Colors.teal,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Créer un panier',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: titreController,
                  decoration: InputDecoration(
                    labelText: 'Titre du panier',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.solid)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: dateLivraisonController,
                  decoration: InputDecoration(
                    labelText: 'Date de livraison',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.solid)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: nomProduitController,
                  decoration: InputDecoration(
                    labelText: 'Nom produit',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.solid)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: quantiteController,
                  decoration: InputDecoration(
                    labelText: 'Quantiter',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.solid)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: descriptionProduitController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Description du produit',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.solid),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    // Espace entre les boutons
                    ElevatedButton(
                      onPressed: _pickerImage,
                      child: Text('Sélectionner une image'),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: (image != null)
                          ? Image.file(
                              image!,
                              height: 50,
                            )
                          : Image.asset(
                              "assets/images/profile.png",
                              height: 50,
                            ),
                    ),
                    SizedBox(width: 50),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black, // Couleur du bouton "+"
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Text(
                  'Nombre de produits dans le panier : 12',
                  style: TextStyle(fontWeight: FontWeight.w600),
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
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => Accueil()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red, fixedSize: Size(120, 40)),
                    child: Text('Annuler'),
                  ),
                  SizedBox(width: 60),
                  ElevatedButton(
                    onPressed: _ajouterPanierAvecProduits,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, fixedSize: Size(120, 40)),
                    child: Text('Valider panier'),
                  ),
                ],
              ),
            ],
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
            )
            );
  }
}

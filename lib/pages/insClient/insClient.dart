import 'dart:io';
import 'package:easyshoppingapp/Services/api_client.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:easyshoppingapp/Models/client.dart';
import 'package:easyshoppingapp/pages/loginClient/loginClient.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:flutter/src/services/message_codec.dart';
import 'package:email_validator/email_validator.dart';

class InsClient extends StatefulWidget {
  const InsClient({super.key});

  @override
  State<InsClient> createState() => _InsClientState();
}

class _InsClientState extends State<InsClient> {
  //Récuperer les valeurs entrées par le client
  TextEditingController nom_controller = TextEditingController();
  TextEditingController adresse_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController motdepass_controller = TextEditingController();
  String? imageSrc;
  File? image;

  Future<File> imageTemporaire(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(imagePath);
  }

  Future<void> _pickerImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imagePermanent = await imageTemporaire(image.path);

        setState(() {
          this.image = imagePermanent;
          imageSrc = imagePermanent.path;
        });
      } else {
        return;
      }
    } on PlatformException catch (e) {
      debugPrint('erreur: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    nom_controller.clear();
    email_controller.clear();
    adresse_controller.clear();
    motdepass_controller.clear();
  }

  Future<void> _ajouterClient() async {
    final nom = nom_controller.text;
    final adresse = adresse_controller.text;
    final email = email_controller.text;
    final motdepass = motdepass_controller.text;


    Client newClient;

    try {
      if (image != null) {
        newClient = await ClientAPIService.AjouterClient(
          nom: nom,
          email: email,
          adresse: adresse,
          motdepass: motdepass,
          image: image as File,
        );
      } else {
        newClient = await ClientAPIService.AjouterClient(
            nom: nom, adresse: adresse, email: email, motdepass: motdepass);
      }
      print("client créer avec succès : ${newClient.nom}");
      nom_controller.clear();
      adresse_controller.clear();
      email_controller.clear();
      motdepass_controller.clear();
    } catch (e) {
      final String errorMessage = e.toString();
      debugPrint(errorMessage);
    }
  }
  void Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    print(isvalid);
  }

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
                      child: (image != null)
                          ? Image.file(
                              image!,
                              height: 150,
                            )
                          : Image.asset(
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
                        onChanged: (String value) {
                          nom_controller.text = value;
                        },
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
                        onChanged: (String value) {
                          email_controller.text = value;
                          Validate(value);
                        },
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
                        onChanged: (String value) {
                          adresse_controller.text = value;
                        },
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
                        onChanged: (String value) {
                          motdepass_controller.text = value;
                        },
                        validator: (String? value) {
                          return (value != null && value.contains('@'))
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ),
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
                      onPressed: _ajouterClient,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginClient()));
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

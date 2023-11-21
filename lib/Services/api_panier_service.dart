import 'dart:convert';
import 'dart:io';
import 'package:easyshoppingapp/Models/panier.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart'; 

class PanierAPIService {
  static const String apiUrl = 'http://10.0.0.2/api/panier/create';

  static Future<Panier> CreerPanierAvecProduits({
    required String titre,
    required String dateLivraison,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      
      request.fields['panier'] = jsonEncode({
        'titre': titre,
        'dateLivraison': dateLivraison,
        'produits': [
        ],
      });

      // Envoi de la requête au serveur
      var response = await request.send();
      var responsed = await http.Response.fromStream(response);

      // Traitement de la réponse
      if(response.statusCode == 201){
        final responseData = jsonDecode(responsed.body);
        debugPrint(responsed.body);
        return Panier.fromJson(responseData);
      }
      else{
        debugPrint(responsed.body);
        throw Exception("Impossible de créer un panier");
      }
    } catch(e){
      throw Exception("Une erreur s'est produite lors de la création du panier");
    }
  }


  static const String apiUrlP = 'http://10.0.0.2/api/produit/create';

  static Future<Produit> AjoutProduit({
    required String nomProduit,
    required String quantite,
    required String description,
    File? image,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Ajout du fichier image s'il existe
      if (image != null) {
        request.files.add(http.MultipartFile(
          'image',
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: basename(image.path),
        ));
      }

      // Ajout des champs du panier en tant que données JSON
      request.fields['panier'] = jsonEncode({
        'nomProduit': nomProduit,
        'quantite': quantite,
      });

      // Envoi de la requête au serveur
      var response = await request.send();
      var responsed = await http.Response.fromStream(response);

      // Traitement de la réponse
      if(response.statusCode == 201){
        final responseData = jsonDecode(responsed.body);
        debugPrint(responsed.body);
        return Produit.fromJson(responseData);
      }
      else{
        debugPrint(responsed.body);
        throw Exception("Impossible de créer un produit");
      }
    } catch(e){
      throw Exception("Une erreur s'est produite lors de la création du produit");
    }
  }
}

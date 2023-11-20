import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart'; 

class PanierAPIService {
  static const String apiUrl = 'http://10.0.0.2/api/panier/{panierId}/ajouterproduit';

  static Future<void> CreerPanierAvecProduits({
    required String titre,
    required String dateLivraison,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Ajout des champs du panier en tant que données JSON
      request.fields['panier'] = jsonEncode({
        'titre': titre,
        'dateLivraison': dateLivraison,
        'produits': [
          // Vous pouvez laisser le tableau de produits vide si nécessaire
        ],
      });

      // Envoi de la requête au serveur
      var response = await request.send();

      // Traitement de la réponse
      if (response.statusCode == 201) {
        print('Panier créé avec succès');
      } else {
        print('Erreur lors de la création du panier : ${response.statusCode}');
        print(await http.Response.fromStream(response).then((value) => value.body));
      }
    } catch (e) {
      print("Une erreur s'est produite lors de la création du panier : $e");
    }
  }


  static const String apiUrlP = 'http://10.0.0.2/api/panier/{panierId}/ajouterproduit';

  static Future<void> AjoutProduit({
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
        // Vous pouvez également laisser le tableau de produits vide si le serveur le permet
        'produits': [],
      });

      // Envoi de la requête au serveur
      var response = await request.send();

      // Traitement de la réponse
      if (response.statusCode == 201) {
        print('Panier créé avec succès');
      } else {
        print('Erreur lors de la création du panier : ${response.statusCode}');
        print(await http.Response.fromStream(response).then((value) => value.body));
      }
    } catch (e) {
      print("Une erreur s'est produite lors de la création du panier : $e");
    }
  }
}

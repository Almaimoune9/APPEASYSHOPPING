import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart'; 

class PanierAPIService {
  static const String apiUrl = 'http://10.0.0.2/api/panier/{panierId}/ajouterproduit';

  static Future<void> CreerPanierAvecProduits({
    required String titre,
    required String dateLivraison,
    required String nomProduit,
    required String quantite,
    required String descriptionProduit,
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
        'titre': titre,
        'dateLivraison': dateLivraison,
        'produits': [
          {
            'nom': nomProduit,
            'quantite': quantite,
            'description': descriptionProduit,
            'imageUrl': "", 
          },
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
}

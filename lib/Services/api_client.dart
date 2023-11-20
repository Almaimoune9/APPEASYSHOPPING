import 'dart:convert';
import 'dart:io';
import 'package:easyshoppingapp/Models/client.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ClientAPIService{

  static const String apiUrl = 'http://10.0.2.2:8080/api/client/create';

  static Future<Client> AjouterClient({
    required String nom,
    required String adresse,
    required String email,
    required String motdepass,
    File? image,
  }) async{
    try{
      var request = http.MultipartRequest('Post', Uri.parse(apiUrl));

      // Ajout du fichier image s'il existe
      if(image != null){
        request.files.add(http.MultipartFile('image', image.readAsBytes().asStream(), image.lengthSync(), filename: basename(image.path) ));
      }

      // Ajout des champs du client en tant que données JSON
      request.fields['client']=jsonEncode({
        'nom':nom,
        'adresse':adresse,
        'email': email,
        'motdepass': motdepass,
        'image': ""
      });

      // Envoi de la requête au serveur
      var response = await request.send();
      var responsed = await http.Response.fromStream(response);

       // Traitement de la réponse
      if(response.statusCode == 201){
        final responseData = jsonDecode(responsed.body);
        debugPrint(responsed.body);
        return Client.fromJson(responseData);
      }
      else{
        debugPrint(responsed.body);
        throw Exception("Impossible d'inscrire un client");
      }
    } catch(e){
      throw Exception("Une erreur s'est produite lors de l'inscription du client");
    }
  }
}
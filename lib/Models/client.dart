

class Client {
  int? id;
  String? nom;
  String? email;
  String? adresse;
  String? motdepass;
  String? image;

  Client({
    required this.id,
    required this.nom,
    required this.email,
    required this.adresse,
    required this.motdepass,
    required this.image
  });
  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      nom: json['nom'],
      email: json['email'],
      adresse: json['adresse'],
      motdepass: json['motdepass'],
      image: json['image']
    );
  }
}

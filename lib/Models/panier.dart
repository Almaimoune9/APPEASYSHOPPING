// panier.dart
class Panier {
  int? id;
  String? titre;
  DateTime? dateLivraison;
  List<Produit>? produits;

  Panier({
    required this.id,
    required this.titre,
    required this.dateLivraison,
    required this.produits,
  });

  factory Panier.fromJson(Map<String, dynamic> json) {
    return Panier(
      id: json['id'],
      titre: json['titre'],
      dateLivraison: DateTime.parse(json['dateLivraison']),
      produits: (json['produits'] as List<dynamic>?)
          ?.map((produit) => Produit.fromJson(produit))
          .toList(),
    );
  }
}

// produit.dart
class Produit {
  String? nom;
  int? quantite;
  String? description;
  String? imageUrl;

  Produit({
    required this.nom,
    required this.quantite,
    required this.description,
    required this.imageUrl,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      nom: json['nom'],
      quantite: json['quantite'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}

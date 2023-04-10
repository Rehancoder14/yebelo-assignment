class CatelogModel {
  static List<Items> items = [
    Items(
        name: "Apple",
        id: 1,
        price: 30,
        availability: 1,
        description: "Imported from Swiss",
        category: "Premium",
        image: "assets/apple.jpeg")
  ];
}

class Items {
  int? id;
  String? name;
  String? description;
  int? price;
  String? category;
  int? availability;
  String? image;
  Items(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.availability,
      this.image,
      this.category});

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
        id: map["p_id"],
        name: map["p_name"],
        description: map["p_details"],
        price: map["p_cost"],
        availability: map["p_availability"],
        image: map['image'],
        category: map['p_category']);
  }
  toMap() => {
        "p_id": id,
        "p_name": name,
        "p_details": description,
        "p_cost": price,
        "p_availability": availability,
        "image": image,
      };
}

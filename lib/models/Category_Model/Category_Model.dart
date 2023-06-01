import 'dart:convert';



CategoryModel categoryModelFromJson(String str) => 
CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => 
json.encode(data.toJson());

class CategoryModel{
  CategoryModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required this.isFavourite,

  });

  String image;
  String id;
  bool isFavourite;
  String name;
  double price;
  String description;
  String status;



  factory CategoryModel.fromJson(Map<String, dynamic> json) => 
    CategoryModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    isFavourite: false,
    price: double.parse(json["price"]),
    status: json["status"],

  );

  Map<String, dynamic > toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "isFavourite": isFavourite,
    "price": price,
    "status": status,
  };

}
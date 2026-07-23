
class ProductModel {
  late final int id;
  late final String title;
  late final String description;
  late final String category;
  late final String image;
  late final double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image, 
    required this.price,
  });

  factory ProductModel.formJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      category: json["category"],
      price:json["price"],
      image: json["thumbnail"],
    );
  }
}

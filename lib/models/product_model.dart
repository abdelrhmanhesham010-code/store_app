class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.category,
  });
  factory ProductModel.fromJson(jsondata) {
    return ProductModel(
      id: jsondata['id'],
      title: jsondata['title'],
      price: jsondata['price'],
      description: jsondata['description'],
      category: jsondata['category'],
      image: jsondata['image'],
      rating: RatingModel.fromJson(jsondata['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsondata) {
    return RatingModel(rate: jsondata['rate'], count: jsondata['count']);
  }
}

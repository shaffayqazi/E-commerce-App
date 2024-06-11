class Product {
  final String id;
  final String title;
  final String imageUrl;
  final String brand;
  final String brandName;
  final String category;
  final String categoryName;
  final String categoryImageUrl;
  final double price;
  final double discount;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.brand,
    required this.brandName,
    required this.category,
    required this.categoryName,
    required this.categoryImageUrl,
    required this.price,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      brand: json['brand']['_id'],
      brandName: json['brand']['name'],
      category: json['category']['_id'],
      categoryName: json['category']['name'],
      categoryImageUrl: json['category']['imageUrl'],
      price: json['price'].toDouble(),
      discount: json['discount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'imageUrl': imageUrl,
        'brand': {
          '_id': brand,
          'name': brandName,
        },
        'category': {
          '_id': category,
          'name': categoryName,
          'imageUrl': categoryImageUrl,
        },
        'price': price,
        'discount': discount,
      };
}

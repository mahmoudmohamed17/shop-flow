class ProductEntity {
  final int id;
  final List<String> imagesList;
  final String title;
  final String category;
  double price;
  final String description;
  int quantity = 1;
  bool isAddedToFavorites;
  bool isAddedToCart;
  final double rating;
  final String returnPolicy;
  final int reviewsCount;
  final List<Map<String, dynamic>> reviewsList;

  ProductEntity(
      {required this.imagesList,
      required this.id,
      required this.title,
      required this.category,
      this.quantity = 1,
      this.isAddedToCart = false,
      this.isAddedToFavorites = false,
      required this.price,
      required this.description,
      required this.rating,
      required this.returnPolicy,
      required this.reviewsCount,
      required this.reviewsList});

  // read from the database and also get specific data from ProductModel
  factory ProductEntity.fromJson(json) {
    return ProductEntity(
      imagesList: (json['images'] != null)
          ? (json['images'] as List<dynamic>).map((e) => e.toString()).toList()
          : [],
      id: json['id'],
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      price: json['price'],
      description: json['description'] ?? '',
      rating: json['rating'] ?? '',
      returnPolicy: json['returnPolicy'] ?? '',
      reviewsCount: (json['reviews'] != null)
          ? (json['reviews'] as List<dynamic>).length
          : 0,
      quantity: json['quantity'] ?? 1,
      isAddedToCart: json['isAddedToCart'] ?? false,
      isAddedToFavorites: json['isAddedToWhishlist'] ?? false,
      reviewsList: (json['reviews'] != null)
          ? (json['reviews'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList()
          : [{}],
    );
  }

  //write to database [Mapping]
  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'title': title,
        'imagesList': imagesList,
        'price': price,
        'quantity': quantity,
        'isAddedToCart': isAddedToCart,
        'isAddedToWhishlist': isAddedToFavorites,
        'description': description,
        'rating': rating,
        'returnPolicy': returnPolicy,
        'reviewsCount': reviewsCount,
        'reviewsList': reviewsList,
      };

  @override
  String toString() {
    return 'ProductEntity(id: $id, title: $title, category: $category, price: $price, quantity: $quantity, isAddedToCart: $isAddedToCart, isAddedToWhishlist: $isAddedToFavorites, description: $description, rating: $rating, returnPolicy: $returnPolicy, reviewsCount: $reviewsCount, images: ${imagesList.length}, reviews: ${reviewsList.length})';
  }
}

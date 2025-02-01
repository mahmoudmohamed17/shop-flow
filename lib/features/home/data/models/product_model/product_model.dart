import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'dimensions.dart';
import 'meta.dart';

class ProductModel extends ProductEntity {
  int id;
  String title;
  String description;
  String category;
  double price;
  double? discountPercentage;
  double rating;
  int? stock;
  List<dynamic>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<dynamic> reviews;
  String returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<dynamic> images;
  String? thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    this.discountPercentage,
    required this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    required this.images,
    this.thumbnail,
  }) : super(
          imagesList: images.cast<String>(),
          id: id,
          title: title,
          category: category,
          price: price,
          description: description,
          rating: rating,
          returnPolicy: returnPolicy,
          reviewsCount: reviews.length,
          reviewsList: reviews.whereType<Map<String, dynamic>>().toList(),
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        title: json['title'] as String,
        description: json['description'] as String,
        category: json['category'],
        price: (json['price'] as num).toDouble(),
        discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
        rating: (json['rating'] as num).toDouble(),
        stock: json['stock'] as int?,
        tags: json['tags'],
        brand: json['brand'] as String?,
        sku: json['sku'] as String?,
        weight: json['weight'] as int?,
        dimensions: json['dimensions'] == null
            ? null
            : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
        warrantyInformation: json['warrantyInformation'] as String?,
        shippingInformation: json['shippingInformation'] as String?,
        availabilityStatus: json['availabilityStatus'] as String?,
        reviews: json['reviews'],
        returnPolicy: json['returnPolicy'] as String,
        minimumOrderQuantity: json['minimumOrderQuantity'] as int?,
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        images: json['images'],
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'tags': tags,
        'brand': brand,
        'sku': sku,
        'weight': weight,
        'dimensions': dimensions?.toJson(),
        'warrantyInformation': warrantyInformation,
        'shippingInformation': shippingInformation,
        'availabilityStatus': availabilityStatus,
        'reviews': reviews,
        'returnPolicy': returnPolicy,
        'minimumOrderQuantity': minimumOrderQuantity,
        'meta': meta?.toJson(),
        'images': images,
        'thumbnail': thumbnail,
      };
}

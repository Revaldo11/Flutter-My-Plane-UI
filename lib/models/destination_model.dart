import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final double rating;
  final int price;
  final String description;
  final String status;
  const DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.rating = 0.0,
    this.price = 0,
    this.description = '',
    this.status = '',
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) {
    return DestinationModel(
      id: id,
      name: json['name'],
      city: json['city'],
      imageUrl: json['image_url'],
      rating: json['rating'].toDouble(),
      price: json['price'],
      description: json['description'],
      status: json['status'],
    );
  }

  @override
  List<Object?> get props =>
      [id, name, city, imageUrl, rating, price, description];
}

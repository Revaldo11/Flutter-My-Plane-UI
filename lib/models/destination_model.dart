import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final double rating;
  final int price;
  final String status;
  final String? description;

  const DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.rating = 0.0,
    this.price = 0,
    this.status = '',
    this.description,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        imageUrl: json['image_url'],
        rating: json['rating'].toDouble(),
        price: json['price'],
        status: json['status'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'image_url': imageUrl,
        'rating': rating,
        'price': price,
        'status': status,
        'description': description,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        city,
        imageUrl,
        rating,
        price,
        status,
        description,
      ];
}

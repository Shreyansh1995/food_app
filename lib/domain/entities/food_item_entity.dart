import 'package:equatable/equatable.dart';

class FoodItemEntity extends Equatable{
  final int? id;
  final String? name;
  final String? imageUrl;
  final double? price;

  FoodItemEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      imageUrl,
      price,
    ];
  }

}
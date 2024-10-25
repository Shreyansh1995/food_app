import 'package:floor/floor.dart';
import 'package:food_app/core/constants/constant.dart';
import 'package:food_app/domain/entities/food_item_entity.dart';

@Entity(tableName: 'food', primaryKeys: ['id'])
class FoodItemModel extends FoodItemEntity {
  const FoodItemModel({
    super.id,
    super.name,
    super.imageUrl,
    super.price,
  });

  factory FoodItemModel.fromJson(Map<String, dynamic> map) {
    return FoodItemModel(
        id: map["id"] ?? "",
        name: map["name"] ?? "",
        imageUrl: map['urlToImage'] != null && map['urlToImage'] != ""
            ? map['urlToImage']
            : kDefaultImage,
        price: map["price"] ?? "");
  }

  factory FoodItemModel.fromEntity(FoodItemEntity entity) {
    return FoodItemModel(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      price: entity.price,
    );
  }
}

List<FoodItemModel> foodlist = [
  const FoodItemModel(id: 1, name: "Poke with chicken", imageUrl: "https://images.unsplash.com/photo-1525755662778-989d0524087e", price: 10.69),
  const FoodItemModel(id: 2, name: "Salads with radishes", imageUrl: "https://images.unsplash.com/photo-1550547660-d9450f859349", price: 15.99),
  const FoodItemModel(id: 3, name: "Two SLice of pizza", imageUrl: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd", price: 5.99),
  const FoodItemModel(id: 4, name: "Large Pizza", imageUrl: "https://images.unsplash.com/photo-1532768641073-503a250f9754", price: 4.99),
];

import 'package:food_app/domain/entities/food_item_entity.dart';

abstract class HomeRepository {
  Future<List<FoodItemEntity>> getAllFoodItems();

  Future<void> addFoodItem(FoodItemEntity item);

  Future<FoodItemEntity?> getFoodById(FoodItemEntity item);
}
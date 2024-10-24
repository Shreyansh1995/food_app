import 'package:food_app/core/resources/data_state.dart';
import 'package:food_app/data/models/food_item_model.dart';
import 'package:food_app/domain/entities/food_item_entity.dart';

abstract class HomeRepository {
  Future<List<FoodItemEntity>> getAllFoodItems();

  Future<void> addFoodItem(FoodItemEntity item);

  Future<FoodItemEntity?> getFoodById(FoodItemEntity item);
}
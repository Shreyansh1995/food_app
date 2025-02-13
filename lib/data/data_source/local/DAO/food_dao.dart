import 'package:floor/floor.dart';
import 'package:food_app/data/models/food_item_model.dart';

@dao
abstract class FoodDao {
  @Insert()
  Future<void> insertFood(FoodItemModel food);


  @Query('SELECT * FROM food')
  Future<List<FoodItemModel>> getFood();

  @Query('SELECT * FROM food WHERE id = :id')
  Future<FoodItemModel?> findFoodById(int id);
}

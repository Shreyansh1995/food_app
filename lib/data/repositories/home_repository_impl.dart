import 'package:food_app/data/data_source/local/app_database.dart';
import 'package:food_app/data/models/food_item_model.dart';
import 'package:food_app/domain/entities/food_item_entity.dart';
import 'package:food_app/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository{
  final AppDatabase _appDatabase;

  HomeRepositoryImpl(this._appDatabase);

  @override
  Future<void> addFoodItem(FoodItemEntity item) {
    return _appDatabase.foodDao.insertFood(FoodItemModel.fromEntity(item));
  }

  @override
  Future<List<FoodItemEntity>> getAllFoodItems() {
    return _appDatabase.foodDao.getFood();
  }

  @override
  Future<FoodItemEntity?> getFoodById(FoodItemEntity? item) {
    return _appDatabase.foodDao.findFoodById(item!.id!);
  }





}
import 'package:food_app/core/usecase/usecase.dart';
import 'package:food_app/domain/entities/food_item_entity.dart';
import 'package:food_app/domain/repositories/home_repository.dart';

class GetFoodItemsUseCase extends UseCase<List<FoodItemEntity>,void>{
  final HomeRepository repository;

  GetFoodItemsUseCase(this.repository);

  @override
  Future<List<FoodItemEntity>> call({void params}) async {
    return await repository.getAllFoodItems();
  }
}
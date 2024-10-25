import 'package:food_app/core/usecase/usecase.dart';
import 'package:food_app/domain/entities/food_item_entity.dart';
import 'package:food_app/domain/repositories/home_repository.dart';

class SaveFoodItemsUseCase implements UseCase<void, FoodItemEntity> {
  HomeRepository repository;

  SaveFoodItemsUseCase(this.repository);

  @override
  Future<void> call({FoodItemEntity? params}) {
    return repository.addFoodItem(params!);
  }
}

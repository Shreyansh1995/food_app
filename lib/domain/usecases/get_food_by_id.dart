import 'package:food_app/core/usecase/usecase.dart';
import 'package:food_app/domain/entities/food_item_entity.dart';
import 'package:food_app/domain/repositories/home_repository.dart';

class GetFoodByIdUseCase extends UseCase<void, FoodItemEntity?> {
  final HomeRepository repository;

  GetFoodByIdUseCase(this.repository);

  @override
  Future<FoodItemEntity?> call({FoodItemEntity? params}) async {
    return await repository.getFoodById(params!);
  }
}

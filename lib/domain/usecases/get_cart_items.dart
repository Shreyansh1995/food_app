import 'package:food_app/core/usecase/usecase.dart';
import 'package:food_app/domain/entities/cart_entity.dart';
import 'package:food_app/domain/repositories/cart_repository.dart';

class GetCartItemsUseCase extends UseCase<List<CartEntity>,void>{
  final CartRepository repository;

  GetCartItemsUseCase(this.repository);

  Future<List<CartEntity>> call({void params}) async {
    return await repository.getAllCartItems();
  }
}
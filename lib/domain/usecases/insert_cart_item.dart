import 'package:food_app/core/usecase/usecase.dart';
import 'package:food_app/domain/entities/cart_entity.dart';
import 'package:food_app/domain/repositories/cart_repository.dart';

class InsertCartItemsUseCase implements UseCase<void, CartEntity> {
  CartRepository repository;

  InsertCartItemsUseCase(this.repository);

  @override
  Future<void> call({CartEntity? params}) {
    return repository.addCartItem(params!);
  }
}
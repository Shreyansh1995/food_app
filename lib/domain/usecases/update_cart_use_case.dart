import 'package:food_app/core/usecase/usecase.dart';
import 'package:food_app/domain/entities/cart_entity.dart';
import 'package:food_app/domain/repositories/cart_repository.dart';

class UpdateCartUseCase implements UseCase<void, CartEntity> {
  CartRepository repository;

  UpdateCartUseCase(this.repository);

  @override
  Future<void> call({CartEntity? params,int? quantity,bool? add}) {
    return repository.updateProductQuantity(params!,quantity!,add!);
  }
}

import 'package:food_app/domain/entities/cart_entity.dart';

abstract class CartState {}

class InitialState implements CartState {}

class ShowCartState implements CartState {
  List<CartEntity> result;
  double totalPrice;

  ShowCartState(this.result, this.totalPrice);
}
class EmptyCartState implements CartState{

}

class UpdatedCartState implements CartState {
  int quantity = 1;

  UpdatedCartState(this.quantity);
}

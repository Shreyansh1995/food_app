import 'package:equatable/equatable.dart';
import 'package:food_app/domain/entities/cart_entity.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncreaseEvent implements CartEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => throw UnimplementedError();
}

class DecreaseEvent implements CartEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => throw UnimplementedError();
}

class CheckCartEvent implements CartEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class AddToCart implements CartEvent {
  CartEntity cartEntity;

  AddToCart(this.cartEntity);

  @override
  List<Object?> get props => [cartEntity];

  @override
  bool? get stringify => throw UnimplementedError();
}

class AddQuantityEvent extends CartEvent{
  CartEntity cartEntity;
  int quantity;
  AddQuantityEvent(this.cartEntity,this.quantity);
}

class RemoveQuantity extends CartEvent{
  CartEntity cartEntity;
  int quantity;
  RemoveQuantity(this.cartEntity,this.quantity);
}
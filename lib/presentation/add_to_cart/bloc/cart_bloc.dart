import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/domain/usecases/get_cart_items.dart';
import 'package:food_app/domain/usecases/insert_cart_item.dart';
import 'package:food_app/domain/usecases/update_cart_use_case.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_event.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  final GetCartItemsUseCase _getCartItemsUseCase;
  final InsertCartItemsUseCase _insertCartItemsUseCase;
  final UpdateCartUseCase _updateCartUseCase;

  int quantity = 1;

  CartBloc( this._getCartItemsUseCase,
      this._insertCartItemsUseCase, this._updateCartUseCase)
      : super(InitialState()) {
    on<IncreaseEvent>(onIncrease);
    on<DecreaseEvent>(onDecrease);
    on<CheckCartEvent>(onCheckCart);
    on<AddToCart>(onAddToCart);
    on<AddQuantityEvent>(onAddQuantityEvent);
    on<RemoveQuantity>(onRemoveQuantity);
  }

  FutureOr<void> onIncrease(
      IncreaseEvent event, Emitter<CartState> emit) async {
    quantity++;
    emit(UpdatedCartState(quantity));
  }

  FutureOr<void> onDecrease(
      DecreaseEvent event, Emitter<CartState> emit) async {
    quantity--;
    emit(UpdatedCartState(quantity));
  }

  FutureOr<void> onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    await _insertCartItemsUseCase.call(params: event.cartEntity);
    await onCheckCart(CheckCartEvent(), emit);
  }

  FutureOr<void> onCheckCart(
      CheckCartEvent event, Emitter<CartState> emit) async {
    var result = await _getCartItemsUseCase.call();
    if (result.isNotEmpty) {
      double totalPrice = result.fold(
        0.0,
        (sum, item) => sum + item.price! * item.quantity!,
      );
      emit(ShowCartState(result, totalPrice));
    }else{
      emit(EmptyCartState());
    }
  }

  FutureOr<void> onAddQuantityEvent(
      AddQuantityEvent event, Emitter<CartState> emit) async {
    await _updateCartUseCase.call(
        params: event.cartEntity, quantity: event.quantity,add: true);
    await onCheckCart(CheckCartEvent(), emit);
  }

  FutureOr<void> onRemoveQuantity(
      RemoveQuantity event, Emitter<CartState> emit) async {
    await _updateCartUseCase.call(
        params: event.cartEntity, quantity: event.quantity,add:false);
    await onCheckCart(CheckCartEvent(), emit);
  }
}

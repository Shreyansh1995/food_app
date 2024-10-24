
import 'package:food_app/data/models/cart_model.dart';
import 'package:food_app/domain/entities/cart_entity.dart';

abstract class CartRepository{
  Future<List<CartModel>> getAllCartItems();

  Future<void> addCartItem(CartEntity item);

  Future<void> removeCartItem(CartEntity item);

  Future<void> updateProductQuantity(CartEntity item, int quantity,bool add);

  Future<CartEntity?> getFoodById(CartEntity item);
}
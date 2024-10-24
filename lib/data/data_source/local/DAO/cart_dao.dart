import 'package:floor/floor.dart';
import 'package:food_app/data/models/cart_model.dart';

@dao
abstract class CartDao {
  @Query('SELECT * FROM cart')
  Future<List<CartModel>> findAllProducts();

  @Query('SELECT * FROM cart WHERE id = :id')
  Future<CartModel?> findProductById(int id);

  @insert
  Future<void> insertProduct(CartModel cart);

  @update
  Future<void> updateProduct(CartModel cart);

  @delete
  Future<void> deleteProduct(CartModel cart);


  @Query('UPDATE cart SET quantity = :quantity WHERE id = :id')
  Future<void> updateProductQuantity(int id, int quantity);

}
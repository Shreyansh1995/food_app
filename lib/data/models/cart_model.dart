import 'package:floor/floor.dart';
import 'package:food_app/domain/entities/cart_entity.dart';

@Entity(tableName: 'cart', primaryKeys: ['id'])
class CartModel extends CartEntity {
  CartModel({
    int? id,
    String? name,
    String? imageUrl,
    double? price,
    int? quantity,
  }) : super(id, name, imageUrl, price, quantity);

  factory CartModel.fromEntity(CartEntity entity) {
    return CartModel(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      price: entity.price,
      quantity: entity.quantity
    );
  }
}



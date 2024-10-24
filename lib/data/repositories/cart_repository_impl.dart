import 'package:food_app/data/data_source/local/app_database.dart';
import 'package:food_app/data/models/cart_model.dart';
import 'package:food_app/domain/entities/cart_entity.dart';
import 'package:food_app/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository{
  final AppDatabase _appDatabase;

  CartRepositoryImpl(this._appDatabase);


  @override
  Future<void> addCartItem(CartEntity item) {
    return _appDatabase.cartDao.insertProduct(CartModel.fromEntity(item));
  }

  @override
  Future<List<CartModel>> getAllCartItems() {
    return _appDatabase.cartDao.findAllProducts();
  }

  @override
  Future<CartEntity?> getFoodById(CartEntity item) {
    return _appDatabase.cartDao.findProductById(item.id!);
  }

  @override
  Future<void> updateProductQuantity(CartEntity item,int quantity,bool add) {
    if(add){
      quantity++;
    }else{
      quantity--;
    }
    if(quantity <= 0){
      removeCartItem(item);
    }else{
      return _appDatabase.cartDao.updateProductQuantity(item.id!,quantity);
    }
    return _appDatabase.cartDao.updateProductQuantity(item.id!,quantity);
  }

  @override
  Future<void> removeCartItem(CartEntity item) {
    return _appDatabase.cartDao.deleteProduct(CartModel.fromEntity(item));
  }

}
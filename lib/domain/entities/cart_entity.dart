import 'package:equatable/equatable.dart';

class CartEntity extends Equatable{
  int? id;
  String? name;
  String? imageUrl;
  double? price;
  int? quantity;

  CartEntity(this.id, this.name,this.imageUrl, this.price,this.quantity);
  @override
  List<Object> get props =>[id!,name!,imageUrl!,price!,quantity!];
}
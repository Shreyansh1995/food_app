import 'dart:async';
import 'package:food_app/data/data_source/local/DAO/cart_dao.dart';
import 'package:food_app/data/models/cart_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:food_app/data/data_source/local/DAO/food_dao.dart';
import 'package:food_app/data/models/food_item_model.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [FoodItemModel,CartModel])
abstract class AppDatabase extends FloorDatabase {
  FoodDao get foodDao;
  CartDao get cartDao;
}
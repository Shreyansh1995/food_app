import 'package:equatable/equatable.dart';
import 'package:food_app/domain/entities/food_item_entity.dart';

abstract class HomeState extends Equatable {
  final List<FoodItemEntity>? foods;

  HomeState({this.foods});

  List<Object> get props => [foods!];
}


class FoodInitialState extends HomeState {
  FoodInitialState();
}


class FoodDoneState extends HomeState {
  FoodDoneState(List<FoodItemEntity> foodEntity) : super(foods: foodEntity);
}

class FoodErrorState extends HomeState {
  FoodErrorState();
}

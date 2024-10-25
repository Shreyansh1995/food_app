import 'package:equatable/equatable.dart';
import 'package:food_app/domain/entities/food_item_entity.dart';

abstract class HomeState extends Equatable {
  final List<FoodItemEntity>? foods;

  const HomeState({this.foods});

  @override
  List<Object> get props => [foods!];
}


class FoodInitialState extends HomeState {
  const FoodInitialState();
}


class FoodDoneState extends HomeState {
  const FoodDoneState(List<FoodItemEntity> foodEntity) : super(foods: foodEntity);
}

class FoodErrorState extends HomeState {
  const FoodErrorState();
}

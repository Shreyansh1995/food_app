import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/models/food_item_model.dart';
import 'package:food_app/domain/usecases/get_food_items.dart';
import 'package:food_app/domain/usecases/save_food_items.dart';
import 'package:food_app/presentation/home/bloc/home_event.dart';
import 'package:food_app/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetFoodItemsUseCase _getFoodItemsUseCase;
  SaveFoodItemsUseCase _saveFoodItemsUseCase;

  HomeBloc(this._getFoodItemsUseCase,this._saveFoodItemsUseCase) : super(FoodInitialState()) {
    on<SaveFood>(onSaveFood);
    on<GetFood>(onGetFood);
  }

  FutureOr<void> onSaveFood(SaveFood event, Emitter<HomeState> emit) async {
    for(int i=0;i<foodlist.length; i++){
      await _saveFoodItemsUseCase.call(params: foodlist[i]);
    }

    final result = await _getFoodItemsUseCase();
    emit(FoodDoneState(result));
  }

  FutureOr<void> onGetFood(GetFood event, Emitter<HomeState> emit) async{
    final result = await _getFoodItemsUseCase();
    emit(FoodDoneState(result));
  }
}

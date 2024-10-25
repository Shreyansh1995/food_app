import 'package:food_app/data/data_source/local/app_database.dart';
import 'package:food_app/data/repositories/cart_repository_impl.dart';
import 'package:food_app/data/repositories/home_repository_impl.dart';
import 'package:food_app/domain/repositories/cart_repository.dart';
import 'package:food_app/domain/repositories/home_repository.dart';
import 'package:food_app/domain/usecases/get_cart_items.dart';
import 'package:food_app/domain/usecases/get_food_by_id.dart';
import 'package:food_app/domain/usecases/get_food_items.dart';
import 'package:food_app/domain/usecases/insert_cart_item.dart';
import 'package:food_app/domain/usecases/save_food_items.dart';
import 'package:food_app/domain/usecases/update_cart_use_case.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_bloc.dart';
import 'package:food_app/presentation/home/bloc/home_bloc.dart';
import 'package:food_app/presentation/home/bloc/home_state.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl(sl()));
  sl.registerSingleton<CartRepository>(CartRepositoryImpl(sl()));



  //UseCases
  sl.registerSingleton<GetFoodItemsUseCase>(
      GetFoodItemsUseCase(sl())
  );

  sl.registerSingleton<SaveFoodItemsUseCase>(
      SaveFoodItemsUseCase(sl())
  );

  sl.registerSingleton<GetFoodByIdUseCase>(
      GetFoodByIdUseCase(sl())
  );



  sl.registerSingleton<GetCartItemsUseCase>(
      GetCartItemsUseCase(sl())
  );

  sl.registerSingleton<InsertCartItemsUseCase>(
      InsertCartItemsUseCase(sl())
  );
  sl.registerSingleton<UpdateCartUseCase>(
      UpdateCartUseCase(sl())
  );


//Blocs
  sl.registerFactory<HomeBloc>(
          ()=> HomeBloc(sl(),sl())
  );

  sl.registerFactory<CartBloc>(
          ()=> CartBloc(sl(),sl(),sl())
  );
  sl.registerFactory<FoodDoneState>(
          ()=> FoodDoneState(sl())
  );

}

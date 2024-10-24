import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/constants/constant.dart';
import 'package:food_app/data/models/food_item_model.dart';
import 'package:food_app/domain/entities/food_item_entity.dart';
import 'package:food_app/domain/usecases/get_food_by_id.dart';
import 'package:food_app/injection_container.dart';
import 'package:food_app/presentation/home/bloc/home_bloc.dart';
import 'package:food_app/presentation/home/bloc/home_state.dart';
import 'package:food_app/presentation/add_to_cart/widget/add_to_cart_ui.dart';

import 'food_card.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is FoodInitialState) {
        return const CircularProgressIndicator();
      } else if (state is FoodDoneState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding / 2),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: foodlist.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: defaultPadding,
                    right: index == foodlist.length - 1 ? defaultPadding : 0,
                  ),
                  child: InkWell(
                    onTap: () async {
                      late FoodItemEntity _foodItemEntity;
                      await sl<GetFoodByIdUseCase>()
                          .call(params: state.foods![index])
                          .then((result) {
                        if (result != null) {
                          _foodItemEntity = result;
                        }
                      });

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        // Makes the bottom sheet full screen
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.0)),
                        ),
                        builder: (BuildContext context) {
                          // return buildBottomSheetContent(context);
                          return buildFullScreenContent(context, _foodItemEntity);
                        },
                      );
                    },
                    child: FoodCard(
                      image: state.foods![index].imageUrl ?? "",
                      title: state.foods![index].name ?? "",
                      price: state.foods![index].price ?? 0.0,
                      press: () {},
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }

      return Container();
    });
  }
}

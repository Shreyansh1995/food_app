import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/constants/constant.dart';
import 'package:food_app/domain/entities/cart_entity.dart';
import 'package:food_app/domain/entities/food_item_entity.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_bloc.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_event.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_state.dart';

Widget buildFullScreenContent(
  BuildContext context,
  FoodItemEntity foodItemEntity,
) {
  return BlocBuilder<CartBloc, CartState>(
    builder: (context, state) {
      if (state is InitialState) {
        return addtocartUi(context, 1, foodItemEntity);
      }
      if (state is UpdatedCartState) {
        return addtocartUi(context, state.quantity, foodItemEntity);
      }
      return addtocartUi(context, 1, foodItemEntity);
    },
  );
}

Widget addtocartUi(
    BuildContext context, int quantity, FoodItemEntity foodItemEntity) {
  return DraggableScrollableSheet(
    initialChildSize: 0.8,
    // Height as a percentage of the screen
    minChildSize: 0.6,
    // Minimum height when dragged down
    maxChildSize: 0.9,
    // Maximum height when fully expanded
    expand: false,
    builder: (BuildContext context, ScrollController scrollController) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: Padding_24),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: Padding_50,
                  height: height_5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(Padding_10),
                  ),
                ),
              ),
              const SizedBox(height: height_16),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: Padding_30, right: Padding_30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(120)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: NetworkImage(
                      foodItemEntity
                          .imageUrl!, // Replace with the actual image URL
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Food Name
              Text(
                foodItemEntity.name!,
                style: const TextStyle(
                  fontSize: height_24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: height_8),

              // Description
              Text(
                'Famous Hawaiian dish. Rice pillow with tender chicken breast, mushrooms, lettuce, cherry tomatoes, seaweed, and corn, with unagi sauce.',
                style: TextStyle(
                  fontSize: fontsize_16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: height_24),

              // Nutritional Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNutritionInfo('325', 'kcal'),
                  _buildNutritionInfo('420', 'grams'),
                  _buildNutritionInfo('21', 'proteins'),
                  _buildNutritionInfo('19', 'fats'),
                  _buildNutritionInfo('65', 'carbs'),
                ],
              ),
              const SizedBox(height: height_24),

              const Divider(),

              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Add in poke'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              const Divider(),

              const SizedBox(height: height_24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(DecreaseEvent());
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: fontsize_18),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(IncreaseEvent());
                        },
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),

                  // Add to Cart Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Padding_24,
                        vertical: Padding_12,
                      ),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Padding_12),
                      ),
                    ),
                    onPressed: () {
                      context.read<CartBloc>().add(AddToCart(CartEntity(
                          foodItemEntity.id,
                          foodItemEntity.name,
                          foodItemEntity.imageUrl,
                          foodItemEntity.price,
                          quantity)));
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        const Text(
                          'Add to cart',
                          style: TextStyle(fontSize: fontsize_16, color: Colors.white),
                        ),
                        const SizedBox(width: fontsize_16),
                        Text(
                          '\$${foodItemEntity.price}',
                          style: const TextStyle(
                              fontSize: fontsize_16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: height_16),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildNutritionInfo(String value, String label) {
  return Column(
    children: [
      Text(
        value,
        style: const TextStyle(
          fontSize: fontsize_16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        label,
        style: TextStyle(
          fontSize: fontsize_14,
          color: Colors.grey[600],
        ),
      ),
    ],
  );
}

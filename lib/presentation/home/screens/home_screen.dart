import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/constants/constant.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_bloc.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_event.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_state.dart';
import 'package:food_app/presentation/add_to_cart/widget/cart_screen.dart';
import 'package:food_app/presentation/home/widgets/food_list.dart';
import 'package:food_app/presentation/home/widgets/offer_carousel_and_categories.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          margin: const EdgeInsets.only(top: Padding_30),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/ham.svg',
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(
                    left: Padding_30, right: Padding_30, top: Padding_10, bottom: Padding_10),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(Padding_20)),
                ),
                child: const Text(
                  "100a Eating Rd • 24 mins",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Ionicons.search),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is ShowCartState) {
              return _homeWidget(true, state.totalPrice, context);
            }
            return _homeWidget(false, 0.0, context);
          },
        ),
      ),
    );
  }
}

Widget _homeWidget(bool showCart, double totalPrice, BuildContext context) {
  return Stack(
    children: [
      const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: OffersCarouselAndCategories()),
          SliverToBoxAdapter(child: FoodList()),
        ],
      ),
      Visibility(
        visible: showCart,
        child: Positioned(
          bottom: Padding_50,
          left: defaultPadding,
          right: defaultPadding,
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, // Fullscreen sheet
                  backgroundColor: Colors.transparent,
                  builder: (context) => const CartBottomSheet(),
                ).then((value) {
                  if (value != null) {
                    context.read<CartBloc>().add(CheckCartEvent());
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: defaultPadding,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        '24 min',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: Padding_10),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: fontsize_16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

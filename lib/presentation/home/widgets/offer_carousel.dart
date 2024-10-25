import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/home/bloc/home_bloc.dart';
import 'package:food_app/presentation/home/bloc/home_state.dart';
import 'package:food_app/presentation/home/widgets/banner.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({
    super.key,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late Timer _timer;



  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_selectedIndex < 4 - 1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }

      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is FoodDoneState) {
          return AspectRatio(
            aspectRatio: 1.87,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: state.foods!.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return BannerMStyle(
                        title: state.foods![index].name!,
                        press: () {},
                        image: state.foods![index].imageUrl!,
                        price: state.foods![index].price!);
                   // return offers[index];
                  },
                ),
              ],
            ),
          );
        }  else if (state is FoodInitialState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container();
      },
    );
  }
}

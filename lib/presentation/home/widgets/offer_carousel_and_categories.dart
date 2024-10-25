import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/core/constants/constant.dart';
import 'package:food_app/presentation/home/widgets/categories.dart';
import 'package:food_app/presentation/home/widgets/offer_carousel.dart';

class OffersCarouselAndCategories extends StatelessWidget {
  const OffersCarouselAndCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Hits of the week",
              style: TextStyle(fontSize: fontsize_22, fontWeight: FontWeight.w700),
            )),
        const OffersCarousel(),
        const SizedBox(height: defaultPadding / 2),
        const Padding(
          padding: EdgeInsets.all(defaultPadding),
        ),
        const Categories(),
      ],
    );
  }
}

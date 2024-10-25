import 'package:flutter/material.dart';
import 'package:food_app/core/constants/constant.dart';
import 'package:food_app/presentation/home/widgets/banner_home.dart';
import 'package:food_app/presentation/home/widgets/price_tag.dart';

class BannerMStyle extends StatelessWidget {
  const BannerMStyle({
    super.key,
    this.image = "https://images.unsplash.com/photo-1525755662778-989d0524087e",
    required this.title,
    required this.press,
    required this.price,
  });
  final String? image;
  final String title;
  final double price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size.width;
    return BannerHome(
      image: image!,
      press: press,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size / 2,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        title.toUpperCase(),
                        style: const TextStyle(
                          fontSize: fontsize_20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 4),

                  ],
                ),
              ),
              const SizedBox(width: defaultPadding),

            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: defaultPadding),
          child: Align(
            alignment: Alignment.bottomRight,
            child: PriceTag(price: price),
          ),
        ),
      ],
    );
  }
}
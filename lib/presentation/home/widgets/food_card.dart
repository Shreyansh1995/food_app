import 'package:flutter/material.dart';
import 'package:food_app/core/constants/constant.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
  });

  final String image, title;
  final double price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Padding_16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         // NetworkImageWithLoader(image, radius: 0),
          SizedBox(
            height: height_50,
              width: width_50,
              child: CircleAvatar(
                radius: radius_30,
                backgroundImage:
                NetworkImage(image),
                backgroundColor: Colors.transparent,
              )),
          const SizedBox(width: height_16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: fontsize_16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: height_8),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: height_8, vertical: height_4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(Padding_12),
                    ),
                    child: Text(
                      '\$$price',
                      style: const TextStyle(
                        fontSize: fontsize_16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: height_16),


                  Text(
                    '325 Kcal',
                    style: TextStyle(
                      fontSize: fontsize_14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

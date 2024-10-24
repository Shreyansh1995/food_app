import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/common/skeleton.dart';
import 'package:food_app/core/constants/constant.dart';
import 'package:food_app/presentation/home/widgets/network_image_with_loader.dart';

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
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         // NetworkImageWithLoader(image, radius: 0),
          SizedBox(
            height: 50,
              width: 50,
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                NetworkImage(image),
                backgroundColor: Colors.transparent,
              )),
          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '\$$price',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),


                  Text(
                    '325 Kcal',
                    style: TextStyle(
                      fontSize: 14,
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

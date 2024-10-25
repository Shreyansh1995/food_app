import 'package:flutter/material.dart';
import 'package:food_app/core/constants/constant.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({
    super.key,
    this.width = 90,
    this.height = 45,
    required this.price,
    this.percentageFontSize = 16,
  });
  final double width, height;
  final double price;
  final double percentageFontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius_30),
          color: Colors.black,
      ),
      margin: const EdgeInsets.only(bottom: Padding_10),
      padding: const EdgeInsets.all(Padding_12),
      child: Stack(
        alignment: Alignment.center,
        children: [

          Text(
            "\$$price",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: percentageFontSize,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
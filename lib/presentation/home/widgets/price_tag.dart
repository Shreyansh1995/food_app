import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
      ),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(12),
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
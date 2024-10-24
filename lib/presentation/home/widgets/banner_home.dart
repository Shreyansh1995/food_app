import 'package:flutter/material.dart';
import 'package:food_app/presentation/home/widgets/network_image_with_loader.dart';

class BannerHome extends StatelessWidget {
  const BannerHome(
      {super.key,
        required this.image,
        required this.press,
        required this.children});

  final String image;
  final VoidCallback press;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          NetworkImageWithLoader(image, radius: 0),
         // Container(color: Colors.black45),
          ...children,
        ],
      ),
    );
  }
}
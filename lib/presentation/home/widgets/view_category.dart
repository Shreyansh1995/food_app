import 'package:flutter/material.dart';
import 'package:food_app/core/constants/constant.dart';
import 'package:food_app/data/models/category.dart';

class ViewCategory extends StatefulWidget {
  final Category category;


  const ViewCategory({super.key, required this.category});

  @override
  State<ViewCategory> createState() => _ViewCategoryState();
}

class _ViewCategoryState extends State<ViewCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.30,
      height: MediaQuery.of(context).size.width * 0.29,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => {

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius_25),
                color: const Color(0xFFEEEEEE),
               // border: Border.all(color: Colors.black)
              ),
              margin: const EdgeInsets.only(left: 5),
              padding: const EdgeInsets.all(Padding_12),
              child: Text(
                "${widget.category.name}",
                style: const TextStyle(color: Colors.black, fontSize: fontsize_16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_plane/shared/utils.dart';

class CustomBottomNavItem extends StatelessWidget {
  const CustomBottomNavItem({
    Key? key,
    required this.imageUrl,
    this.isSelected = false,
  }) : super(key: key);

  final String imageUrl;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
        ),
        Container(
          width: 30.0,
          height: 2.0,
          decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : kTransparentColor,
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ],
    );
  }
}

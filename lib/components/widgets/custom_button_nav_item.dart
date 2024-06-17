import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plane/cubit/page_cubit.dart';
import 'package:my_plane/shared/utils.dart';

class CustomBottomNavItem extends StatelessWidget {
  const CustomBottomNavItem({
    Key? key,
    required this.imageUrl,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<PageCubit>().changePage(currentIndex),
      child: BlocBuilder<PageCubit, int>(
        builder: (context, state) {
          bool isSelected = state == currentIndex;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset(
                imageUrl,
                width: 24.0,
                height: 24.0,
                color: isSelected ? kPrimaryColor : kGreyColor,
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
        },
      ),
    );
  }
}

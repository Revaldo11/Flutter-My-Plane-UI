import 'package:flutter/material.dart';
import 'package:my_plane/components/widgets/custom_button_nav_item.dart';
import 'package:my_plane/shared/utils.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: const [
          Center(
            child: Text("Main Page"),
          ),
          BottomNavigation(),
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.only(
          bottom: 30.0,
          left: defaultMargin,
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CustomBottomNavItem(
              imageUrl: 'assets/images/icon_home.png',
              isSelected: true,
            ),
            CustomBottomNavItem(imageUrl: 'assets/images/icon_booking.png'),
            CustomBottomNavItem(imageUrl: 'assets/images/icon_card.png'),
            CustomBottomNavItem(imageUrl: 'assets/images/icon_settings.png'),
          ],
        ),
      ),
    );
  }
}

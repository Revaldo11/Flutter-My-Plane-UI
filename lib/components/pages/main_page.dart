// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plane/components/pages/home_page.dart';
import 'package:my_plane/components/pages/settings_oage.dart';
import 'package:my_plane/components/pages/transaction_page.dart';
import 'package:my_plane/components/pages/wallet_page.dart';
import 'package:my_plane/components/widgets/custom_button_nav_item.dart';
import 'package:my_plane/cubit/page_cubit.dart';
import 'package:my_plane/shared/utils.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PageCubit(),
      child: BlocBuilder<PageCubit, int>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: kBackgroundColor,
            body: Stack(
              children: [
                buildContent(state),
                BottomNavigation(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const TransactionPage();
      case 2:
        return const SettingPage();
      default:
        return const HomePage();
    }
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
              currentIndex: 0,
              imageUrl: 'assets/images/icon_home.png',
            ),
            CustomBottomNavItem(
              currentIndex: 1,
              imageUrl: 'assets/images/icon_booking.png',
            ),
            CustomBottomNavItem(
              currentIndex: 2,
              imageUrl: 'assets/images/icon_settings.png',
            ),
          ],
        ),
      ),
    );
  }
}

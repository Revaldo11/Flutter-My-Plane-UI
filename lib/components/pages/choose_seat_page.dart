import 'package:flutter/material.dart';
import 'package:my_plane/components/widgets/custom_button.dart';
import 'package:my_plane/components/widgets/seat_item.dart';
import 'package:my_plane/shared/utils.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            seatStatus(),
            selectSeat(),
            checkoutButton(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: Text(
        "Select Your\nFavorite Seat",
        style: blackTextStyle.copyWith(
          fontSize: 24.0,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget seatStatus() {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: Row(
        children: [
          // NOTE: AVAILABLE
          Container(
            height: 16.0,
            width: 16.0,
            margin: const EdgeInsets.only(right: 6.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/icon_available.png',
                ),
              ),
            ),
          ),
          Text(
            "Available",
            style: blackTextStyle,
          ),
          Container(
            height: 16.0,
            width: 16.0,
            margin: const EdgeInsets.only(left: 10.0, right: 6.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/icon_selected.png',
                ),
              ),
            ),
          ),
          Text(
            "Selected",
            style: blackTextStyle,
          ),
          Container(
            height: 16.0,
            width: 16.0,
            margin: const EdgeInsets.only(left: 10.0, right: 6.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/icon_unavailable.png',
                ),
              ),
            ),
          ),
          Text(
            "Unavailable",
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }

  Widget selectSeat() {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        children: [
          // NOTE: SEAT INDICATOR
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 48.0,
                height: 48.0,
                child: Center(
                  child: Text(
                    "A",
                    style: greyTextStyle,
                  ),
                ),
              ),
              SizedBox(
                width: 48.0,
                height: 48.0,
                child: Center(
                  child: Text(
                    "B",
                    style: greyTextStyle,
                  ),
                ),
              ),
              SizedBox(
                width: 48.0,
                height: 48.0,
                child: Center(
                  child: Text(
                    "",
                    style: greyTextStyle,
                  ),
                ),
              ),
              SizedBox(
                width: 48.0,
                height: 48.0,
                child: Center(
                  child: Text(
                    "B",
                    style: greyTextStyle,
                  ),
                ),
              ),
              SizedBox(
                width: 48.0,
                height: 48.0,
                child: Center(
                  child: Text(
                    "C",
                    style: greyTextStyle,
                  ),
                ),
              ),
            ],
          ),

          // NOTE: SEAT 1
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 2),
                SeatItem(status: 2),
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "1",
                      style: greyTextStyle,
                    ),
                  ),
                ),
                SeatItem(status: 0),
                SeatItem(status: 2),
              ],
            ),
          ),

          // NOTE: SEAT 2
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 0),
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "2",
                      style: greyTextStyle,
                    ),
                  ),
                ),
                SeatItem(status: 0),
                SeatItem(status: 2),
              ],
            ),
          ),

          // NOTE: SEAT 3
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 1),
                SeatItem(status: 1),
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "3",
                      style: greyTextStyle,
                    ),
                  ),
                ),
                SeatItem(status: 0),
                SeatItem(status: 0),
              ],
            ),
          ),

          // NOTE: SEAT 4
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 2),
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "4",
                      style: greyTextStyle,
                    ),
                  ),
                ),
                SeatItem(status: 0),
                SeatItem(status: 0),
              ],
            ),
          ),

          // NOTE: SEAT 5
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 0),
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: Center(
                    child: Text(
                      "5",
                      style: greyTextStyle,
                    ),
                  ),
                ),
                SeatItem(status: 2),
                SeatItem(status: 0),
              ],
            ),
          ),

          //NOTE: YOUR SEAT
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Seat",
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
                Text(
                  "A3, B3",
                  style: blackTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),

          // NOTE: TOTAL
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
                Text(
                  "IDR 540.000.000",
                  style: purpleTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget checkoutButton() {
    return CustomButton(
      width: 327.0,
      margin: const EdgeInsets.only(top: 30.0),
      title: "Continue to Checkout",
      onPressed: () {},
    );
  }
}

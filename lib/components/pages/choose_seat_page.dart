// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_plane/components/pages/checkout_page.dart';
import 'package:my_plane/components/widgets/custom_button.dart';
import 'package:my_plane/components/widgets/seat_item.dart';
import 'package:my_plane/cubit/seat_cubit.dart';
import 'package:my_plane/models/destination_model.dart';
import 'package:my_plane/shared/utils.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key, required this.destinationModel})
      : super(key: key);

  final DestinationModel destinationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkoutButton(context),
        ],
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
    return BlocBuilder<SeatCubit, List<String>>(
      builder: (context, state) {
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
                    SeatItem(
                      isAvailable: false,
                      id: "A1",
                    ),
                    SeatItem(
                      isAvailable: true,
                      id: "B1",
                    ),
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
                    SeatItem(
                      id: "C1",
                    ),
                    SeatItem(
                      id: "D1",
                    ),
                  ],
                ),
              ),

              // NOTE: SEAT 2
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: "A2",
                    ),
                    SeatItem(
                      id: "B2",
                    ),
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
                    SeatItem(
                      id: "C2",
                    ),
                    SeatItem(
                      id: "D2",
                    ),
                  ],
                ),
              ),

              // NOTE: SEAT 3
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: "A3",
                    ),
                    SeatItem(
                      id: "B3",
                    ),
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
                    SeatItem(
                      id: "C3",
                    ),
                    SeatItem(
                      id: "D3",
                    ),
                  ],
                ),
              ),

              // NOTE: SEAT 4
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: "A4",
                    ),
                    SeatItem(
                      id: "B4",
                    ),
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
                    SeatItem(
                      id: "C4",
                    ),
                    SeatItem(
                      id: "D4",
                    ),
                  ],
                ),
              ),

              // NOTE: SEAT 5
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: "A5",
                    ),
                    SeatItem(
                      id: "B5",
                    ),
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
                    SeatItem(
                      id: "C5",
                    ),
                    SeatItem(
                      id: "D5",
                    ),
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
                      state.join(', ') != '' ? state.join(', ') : '-',
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
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'IDR ',
                        decimalDigits: 0,
                      ).format(destinationModel.price * state.length),
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
      },
    );
  }

  Widget checkoutButton(BuildContext context) {
    return CustomButton(
      width: 327.0,
      margin: const EdgeInsets.only(top: 30.0),
      title: "Continue to Checkout",
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckoutPage(),
            ));
      },
    );
  }
}

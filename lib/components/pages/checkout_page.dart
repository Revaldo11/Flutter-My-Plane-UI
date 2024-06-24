import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_plane/components/widgets/booking_detail_item.dart';
import 'package:my_plane/components/widgets/custom_button.dart';
import 'package:my_plane/components/widgets/destination_tile.dart';
import 'package:my_plane/cubit/auth_cubit.dart';
import 'package:my_plane/cubit/transaction_cubit.dart';
import 'package:my_plane/models/transaction_model.dart';
import 'package:my_plane/shared/utils.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key, this.transaction}) : super(key: key);

  final TransactionModel? transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payButton(),
          tacButton(),
        ],
      ),
    );
  }

  Widget tacButton() {
    return Container(
      margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
      alignment: Alignment.center,
      child: Text(
        'Terms and Conditions',
        style: greyTextStyle.copyWith(
          fontSize: 16.0,
          fontWeight: light,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget payButton() {
    return BlocConsumer<TransactionCubit, TransactionState>(
      listener: (context, state) {
        if (state is TransactionSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/success',
            (route) => false,
          );
        } else if (state is TransactionFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: kRedColor,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Transaction Failed"),
              backgroundColor: kRedColor,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is TransactionLoading) {
          return CustomButton(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30.0),
            title: "Loading...",
            onPressed: () {},
          );
        }
        return CustomButton(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 30.0),
          title: "Pay Now",
          onPressed: () {
            context.read<TransactionCubit>().createTransaction(transaction!);
          },
        );
      },
    );
  }

  Widget paymentDetails() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 30.0),
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, bottom: 30.0),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    "Payment Details",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100.0,
                        height: 70.0,
                        margin: const EdgeInsets.only(right: 16.0),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/image_card.png"),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24.0,
                                height: 24.0,
                                margin: const EdgeInsets.only(right: 6.0),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/logo.png"),
                                  ),
                                ),
                              ),
                              Text(
                                "Pay",
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16.0,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                ).format(state.user.balance),
                                style: blackTextStyle.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: medium,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Current Balance",
                                style: greyTextStyle.copyWith(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget bookingDetails() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DestinationTile(destinationModel: transaction!.destination),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Booking Details",
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16.0,
              ),
            ),
          ),
          BookingDetailItem(
            title: "Traveler",
            valueText: "${transaction!.amountOfTraveler} Person",
            valueColor: kBlackColor,
          ),
          BookingDetailItem(
            title: "Seat",
            valueText: transaction!.selectedSeats,
            valueColor: kBlackColor,
          ),
          BookingDetailItem(
            title: "Insurance",
            valueText: transaction!.insurance ? "YES" : "NO",
            valueColor: kGreenColor,
          ),
          BookingDetailItem(
            title: "Refaundable",
            valueText: transaction!.refundable ? "YES" : "NO",
            valueColor: kRedColor,
          ),
          BookingDetailItem(
            title: "VAT",
            valueText: "${(transaction!.vat * 100).toStringAsFixed(0)}%",
            valueColor: kBlackColor,
          ),
          BookingDetailItem(
            title: "Price",
            valueText: NumberFormat.currency(
              locale: 'id_ID',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction!.price),
            valueColor: kBlackColor,
          ),
          BookingDetailItem(
            title: "Grand Total",
            valueText: NumberFormat.currency(
              locale: 'id_ID',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction!.grandTotal),
            valueColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  Widget route() {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Container(
            width: 291.0,
            height: 65.0,
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image_checkout.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CGK",
                    style: blackTextStyle.copyWith(
                      fontSize: 24.0,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    "Tangerang",
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "TLC",
                    style: blackTextStyle.copyWith(
                      fontSize: 24.0,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    "Ciliwung",
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

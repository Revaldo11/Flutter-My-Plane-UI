import 'package:flutter/material.dart';
import 'package:my_plane/components/pages/choose_seat_page.dart';
import 'package:my_plane/components/widgets/custom_button.dart';
import 'package:my_plane/components/widgets/interest_item.dart';
import 'package:my_plane/components/widgets/photo_item.dart';
import 'package:my_plane/shared/utils.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(context),
          ],
        ),
      ),
    );
  }

  Widget backgroundImage() {
    return Container(
      width: double.infinity,
      height: 450.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/image_destination1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget customShadow() {
    return Container(
      width: double.infinity,
      height: 214.0,
      margin: const EdgeInsets.only(top: 236.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kWhiteColor.withOpacity(0),
            Colors.black.withOpacity(0.95),
          ],
        ),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: 30.0, left: defaultMargin, right: defaultMargin),
      child: Column(
        children: [
          // NOTE: EMBLEMENT
          Container(
            width: double.infinity,
            height: 24.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/icon_emblem.png'),
              ),
            ),
          ),

          // NOTE: TITLE
          Container(
            margin: const EdgeInsets.only(top: 256.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lake Ciliwung",
                        style: whiteTextStyle.copyWith(
                          fontSize: 24.0,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Tangerang",
                        style: whiteTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      margin: const EdgeInsets.only(right: 2.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      "4.8",
                      style: whiteTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: DESCRIPTION
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: ABOUT
                Text(
                  "About",
                  style: blackTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
                  style: blackTextStyle.copyWith(
                    height: 2.0,
                  ),
                ),

                // NOTE: PHOTOS
                const SizedBox(height: 20.0),
                Text(
                  "Photos",
                  style: blackTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 6.0),
                Row(
                  children: const [
                    PhotoItem(imageUrl: 'assets/images/image_photo1.png'),
                    PhotoItem(imageUrl: 'assets/images/image_photo2.png'),
                    PhotoItem(imageUrl: 'assets/images/image_photo3.png'),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Interest",
                  style: blackTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: const [
                    InterestItem(title: "Kids Park"),
                    InterestItem(title: "Honor Bridge"),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: const [
                    InterestItem(title: "City Museum"),
                    InterestItem(title: "Central Mall"),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: PRICE & BOOK BUTTON
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            width: double.infinity,
            child: Row(
              children: [
                // NOTE: PRICE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "IDR 2.500.000",
                        style: blackTextStyle.copyWith(
                          fontSize: 18.0,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        "per orang",
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                // NOTE: BOOK BUTTON
                CustomButton(
                  width: 170.0,
                  title: "Book Now",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseSeatPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

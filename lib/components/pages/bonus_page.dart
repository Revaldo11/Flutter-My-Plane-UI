import 'package:flutter/material.dart';
import 'package:my_plane/shared/utils.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            BonusCard(),
            ContentText(),
            ButtonStartFlyNow(),
          ],
        ),
      ),
    );
  }
}

class ButtonStartFlyNow extends StatelessWidget {
  const ButtonStartFlyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      width: 220,
      height: 55,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Start Fly Now",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    );
  }
}

class ContentText extends StatelessWidget {
  const ContentText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80.0),
      width: 250.0,
      child: Column(
        children: [
          Text(
            "Big Bonus 🎉",
            style: blackTextStyle.copyWith(
              fontSize: 32.0,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "We give you early credit so that you can buy a flight ticket",
            style: greyTextStyle.copyWith(
              fontSize: 16.0,
              fontWeight: light,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class BonusCard extends StatelessWidget {
  const BonusCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 211,
      padding: EdgeInsets.all(defaultMargin),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/image_card.png'),
        ),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.5),
            blurRadius: 50,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: whiteTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                    Text(
                      'Kezia Anne',
                      style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 6),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
              ),
              Text(
                "Pay",
                style: whiteTextStyle.copyWith(
                  fontSize: 16.0,
                  fontWeight: medium,
                ),
              )
            ],
          ),
          const SizedBox(height: 41.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Balance",
                style: whiteTextStyle.copyWith(
                  fontWeight: light,
                ),
              ),
              Text(
                "IDR 280.000.000",
                style: whiteTextStyle.copyWith(
                  fontSize: 26.0,
                  fontWeight: medium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

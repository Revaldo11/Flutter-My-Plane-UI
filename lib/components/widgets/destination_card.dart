import 'package:flutter/material.dart';
import 'package:my_plane/components/pages/detail_page.dart';
import 'package:my_plane/shared/utils.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    Key? key,
    required this.name,
    required this.city,
    required this.imageUrl,
    this.rating = 0.0,
  }) : super(key: key);

  final String name;
  final String city;
  final String imageUrl;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailPage(),
            ),
          )),
      child: Container(
        width: 200.0,
        height: 323.0,
        margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Column(
          children: [
            Container(
              width: 180.0,
              height: 220.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 2.0),
                        width: 24.0,
                        height: 24.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/icon_star.png'),
                          ),
                        ),
                      ),
                      Text(
                        rating.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18.0,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    city,
                    style: greyTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

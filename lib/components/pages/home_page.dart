import 'package:flutter/material.dart';
import 'package:my_plane/components/widgets/destination_card.dart';
import 'package:my_plane/components/widgets/destination_tile.dart';
import 'package:my_plane/shared/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        popularDestination(),
        newDestination(),
      ],
    );
  }

  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: 30.0,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Howdy,\nKezia Anne",
                  style: blackTextStyle.copyWith(
                    fontSize: 24.0,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6.0),
                Text(
                  "Where to fly today?",
                  style: greyTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/image_profile.png'),
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget popularDestination() {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            DestinationCard(
              name: "Lake Ciliwung",
              city: "Tangerang",
              imageUrl: "assets/images/image_destination1.png",
              rating: 4.8,
            ),
            DestinationCard(
              name: "White Houses",
              city: "Spain",
              imageUrl: "assets/images/image_destination2.png",
              rating: 4.7,
            ),
            DestinationCard(
              name: "Hill Heyo",
              city: "Monaco",
              imageUrl: "assets/images/image_destination3.png",
              rating: 4.8,
            ),
            DestinationCard(
              name: "Menarra",
              city: "Japan",
              imageUrl: "assets/images/image_destination4.png",
              rating: 5.0,
            ),
            DestinationCard(
              name: "Payung Teduh",
              city: "Singapore",
              imageUrl: "assets/images/image_destination5.png",
              rating: 4.8,
            ),
          ],
        ),
      ),
    );
  }

  Widget newDestination() {
    return Container(
      margin: EdgeInsets.only(
          bottom: 140.0, top: 30.0, left: defaultMargin, right: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Destination",
            style: blackTextStyle.copyWith(
              fontSize: 18.0,
              fontWeight: semiBold,
            ),
          ),
          const DestinationTile(
            imageUrl: "assets/images/image_destination6.png",
            name: "Danau Beratan",
            city: "Singaraja",
            padding: EdgeInsets.all(10.0),
          ),
          const DestinationTile(
            imageUrl: "assets/images/image_destination7.png",
            name: "Sydney Opera",
            city: "Australia",
            padding: EdgeInsets.all(10.0),
          ),
          const DestinationTile(
            imageUrl: "assets/images/image_destination8.png",
            name: "Roma",
            city: "Italy",
            padding: EdgeInsets.all(10.0),
          ),
          const DestinationTile(
            imageUrl: "assets/images/image_destination9.png",
            name: "Payung Teduh",
            city: "Singapore",
            padding: EdgeInsets.all(10.0),
          ),
          const DestinationTile(
            imageUrl: "assets/images/image_destination10.png",
            name: "Hill Hey",
            city: "Monaco",
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_plane/components/pages/detail_page.dart';
import 'package:my_plane/models/destination_model.dart';
import 'package:my_plane/shared/utils.dart';

class DestinationTile extends StatelessWidget {
  const DestinationTile({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.destinationModel,
  }) : super(key: key);

  final EdgeInsets padding;

  final DestinationModel? destinationModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                destinationModel: destinationModel!,
              ),
            ),
          )),
      child: Container(
        margin: const EdgeInsets.only(top: 16.0),
        padding: padding,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Image.network(
                destinationModel!.imageUrl,
                width: 70.0,
                height: 70.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    destinationModel!.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18.0,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    destinationModel!.city,
                    style: greyTextStyle.copyWith(
                      fontSize: 14.0,
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
                  destinationModel!.rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

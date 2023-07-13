import 'package:flutter/material.dart';

import '../../shared/utils.dart';

class BookingDetailItem extends StatelessWidget {
  const BookingDetailItem(
      {Key? key,
      required this.title,
      required this.valueText,
      required this.valueColor})
      : super(key: key);

  final String title;
  final String valueText;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Container(
            width: 16.0,
            height: 16.0,
            margin: const EdgeInsets.only(right: 6.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/icon_check.png'),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle,
          ),
          const Spacer(),
          Text(
            valueText,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

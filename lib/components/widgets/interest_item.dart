import 'package:flutter/material.dart';

import '../../shared/utils.dart';

class InterestItem extends StatelessWidget {
  const InterestItem({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16.0,
            height: 16.0,
            margin: const EdgeInsets.only(right: 6.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/icon_check.png'),
              ),
            ),
          ),
          Text(title, style: blackTextStyle),
        ],
      ),
    );
  }
}

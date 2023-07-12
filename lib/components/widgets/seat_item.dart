import 'package:flutter/material.dart';
import 'package:my_plane/shared/utils.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({Key? key, required this.status}) : super(key: key);

  // NOTE: 0 = available, 1 = selected, 2 = unavailable
  final int status;

  backgroundColor() {
    switch (status) {
      case 0:
        return kAvailableColor;
      case 1:
        return kPrimaryColor;
      case 2:
        return kUnavailableColor;
      default:
        return kUnavailableColor;
    }
  }

  borderColor() {
    switch (status) {
      case 0:
        return kPrimaryColor;
      case 1:
        return kPrimaryColor;
      case 2:
        return kUnavailableColor;
      default:
        return kUnavailableColor;
    }
  }

  child() {
    switch (status) {
      case 0:
        return const SizedBox();
      case 1:
        return Center(
          child: Text(
            "YOU",
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      case 2:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: borderColor(),
          width: 2.0,
        ),
      ),
      child: child(),
    );
  }
}

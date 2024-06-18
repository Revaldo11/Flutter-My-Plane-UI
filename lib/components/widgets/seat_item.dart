import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plane/cubit/seat_cubit.dart';
import 'package:my_plane/shared/utils.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({Key? key, this.isAvailable = true, required this.id})
      : super(key: key);

  // NOTE: 0 = available, 1 = selected, 2 = unavailable
  final bool isAvailable;
  final String id;

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.read<SeatCubit>().state.contains(id);

    backgroundColor() {
      if (isAvailable) {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      } else {
        return kUnavailableColor;
      }
    }

    borderColor() {
      if (isAvailable) {
        return kPrimaryColor;
      } else {
        return kUnavailableColor;
      }
    }

    child() {
      if (isAvailable) {
        if (isSelected) {
          return Center(
            child: Text(
              'YOU',
              style: whiteTextStyle.copyWith(
                fontSize: 13.0,
                fontWeight: semiBold,
              ),
            ),
          );
        }
      } else {
        return Center(
          child: Icon(
            Icons.close,
            color: kWhiteColor,
          ),
        );
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().addSeat(id);
        }
      },
      child: Container(
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
      ),
    );
  }
}

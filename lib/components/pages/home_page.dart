// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plane/components/widgets/destination_card.dart';
import 'package:my_plane/components/widgets/destination_tile.dart';
import 'package:my_plane/cubit/auth_cubit.dart';
import 'package:my_plane/cubit/destination_cubit.dart';
import 'package:my_plane/models/destination_model.dart';
import 'package:my_plane/shared/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DestinationCubit>().getDestinations();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationLoaded) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DestinationSuccess) {
          return Scaffold(
            body: ListView(
              children: [
                header(),
                popularDestination(state.destination),
                newDestination(state.destination),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("Failed to load data"),
          );
        }
      },
    );
  }

  Widget header() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                        "Howdy,\n${state.user.name}!",
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
        } else {
          return Container();
        }
      },
    );
  }

  Widget popularDestination(List<DestinationModel> destinations) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: destinations
              .map(
                (destination) => DestinationCard(destination: destination),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget newDestination(List<DestinationModel> destinations) {
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
          Column(
            children: destinations
                .map(
                  (destination) =>
                      DestinationTile(destinationModel: destination),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

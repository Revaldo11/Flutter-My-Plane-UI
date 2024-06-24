// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plane/components/widgets/custom_button.dart';
import 'package:my_plane/cubit/page_cubit.dart';

class SuccesPage extends StatelessWidget {
  const SuccesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 150,
              child: Image.asset('assets/images/image_success.png'),
            ),
            const SizedBox(height: 80),
            Text(
              "Well Booked 😍",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: const Color(0xff1F1449),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Are you ready to explore the new world of experiences?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xff9698A9),
              ),
              textAlign: TextAlign.center,
            ),

            // Button
            const SizedBox(height: 50),
            CustomButton(
              width: 220,
              margin: const EdgeInsets.only(top: 30.0),
              title: "My Bookings",
              onPressed: () {
                context.read<PageCubit>().changePage(1);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

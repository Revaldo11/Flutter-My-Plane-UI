import 'package:flutter/material.dart';
import 'package:my_plane/components/widgets/custom_button.dart';
import 'package:my_plane/shared/utils.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/image_get_started.png'),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: whiteTextStyle.copyWith(
                      fontSize: 32, fontWeight: semiBold),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Explore new world with us and let \nyourself get an amazing experiences',
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: light),
                ),
                CustomButton(
                  width: 220.0,
                  margin: const EdgeInsets.only(top: 50.0, bottom: 80.0),
                  title: 'Get Started',
                  onPressed: () => Navigator.pushNamed(context, '/sign-up'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

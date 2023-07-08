import 'package:flutter/material.dart';
import 'package:my_plane/components/widgets/custom_button.dart';
import 'package:my_plane/components/widgets/custom_text_form_field.dart';
import 'package:my_plane/shared/utils.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Text(
          'Join us and get \nyour next journey',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget inputName() {
        return const CustomTextFormField(
          title: 'Full Name',
          hintText: 'Enter Your Full Name',
        );
      }

      Widget inputEmail() {
        return const CustomTextFormField(
          title: 'Email Address',
          hintText: 'Enter Your Email Address',
        );
      }

      Widget inputPassword() {
        return const CustomTextFormField(
          title: 'Password',
          hintText: 'Enter Your Password',
          obscureText: true,
        );
      }

      Widget inputHobby() {
        return const CustomTextFormField(
          title: 'Hobby',
          hintText: 'Enter Your Hobby',
        );
      }

      Widget submitButton() {
        return CustomButton(
          margin: const EdgeInsets.only(top: 30.0),
          title: 'Get Started',
          onPressed: () {
            Navigator.pushNamed(context, '/bonus');
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          children: [
            inputName(),
            inputEmail(),
            inputPassword(),
            inputHobby(),
            submitButton(),
          ],
        ),
      );
    }

    Widget tacButton() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        alignment: Alignment.center,
        child: Text(
          'Terms and Conditions',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            inputSection(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}

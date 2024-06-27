import 'package:flutter/material.dart';
import 'package:rukn_store/app/features/Auth/presentation/widgets/auth_button.dart';
import 'package:rukn_store/app/features/Auth/presentation/widgets/input_field_widget.dart';
import 'package:rukn_store/app/features/Auth/presentation/widgets/social_media_button.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(),
              _buildForm(),
              Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        context.go('/ForgetPassword');
                      },
                      child: const Text('Forget Password?'))),
              const SizedBox(
                height: 40,
              ),
              AuthButton(
                onTap: () {},
                text: 'LOG IN',
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Or login with'),
              ),
              _buildSocialMediaButtons(),
              const SizedBox(
                height: 80,
              ),

              // bottom text
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: 'Do not Have an account?',
                  style: TextStyle(color: Colors.black87),
                ),
                TextSpan(
                  text: ' Sign Up',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildSocialMediaButtons() {
    return SizedBox(
      width: 146,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SocialMediaButton(onTap: () {}, iconPath: 'apple_icon.png'),
          SocialMediaButton(onTap: () {}, iconPath: 'google_icon.png'),
          SocialMediaButton(onTap: () {}, iconPath: 'facebook_icon.png')
        ],
      ),
    );
  }

  Form _buildForm() {
    return Form(
        child: Column(
      children: [
        InputFieldWidget(hintText: 'Email Address'),
        const SizedBox(
          height: 20,
        ),
        InputFieldWidget(hintText: 'Password'),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }

  Column _buildTitle() {
    return const Column(
      children: [
        SizedBox(
          height: 163,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Login\nInto your account',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

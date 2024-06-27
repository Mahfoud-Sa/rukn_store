import 'package:flutter/material.dart';
import 'package:rukn_store/app/features/onbording/presentation/pages/onbording_page.dart';
import 'package:rukn_store/app/features/onbording/presentation/widgets/welcome_button.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        //background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'welcome to my shop',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'the home of fashion',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),

            // welcome Buttons
            WelcomeButton(
              onTap: () {
                context.go('/Onbording');
              },
              text: 'Get Started',
            ),
            const SizedBox(
              height: 120,
            )
          ],
        ),
      ),
    );
  }
}

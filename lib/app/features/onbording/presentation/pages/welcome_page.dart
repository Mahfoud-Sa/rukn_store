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
            image: AssetImage("assets/images/introp2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'مرحبا بكم في متجر ركن',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'متجر متوافر لكل شخص',
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 0, 183, 255)),
            ),
            const SizedBox(
              height: 10,
            ),

            // welcome Buttons
            WelcomeButton(
              onTap: () {
                context.go('/Onbording');
              },
              text: 'ابدا الان',
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

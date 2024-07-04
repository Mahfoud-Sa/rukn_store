import 'package:flutter/material.dart';
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
            Container(
              padding: const EdgeInsets.all(15),
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: const Color.fromARGB(255, 31, 19, 19).withOpacity(.5)),
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      'مرحبا بكم في متجر ركن',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'متجر متوافر لكل شخص',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
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

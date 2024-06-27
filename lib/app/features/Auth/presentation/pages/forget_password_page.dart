import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rukn_store/app/features/Auth/presentation/widgets/input_field_widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/SVGs/apple_icon.png"),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          boxShadow: [BoxShadow()]),
                    ),
                  )),
              _buildTitle(),
              const Text(
                  'Enter email associated with your account and well send and email with intructors to reset your password'),
              InputFieldWidget(
                  icon: Icons.email_outlined, hintText: 'enter your email here')
            ],
          ),
        ),
      ),
    );
  }

  Column _buildTitle() {
    return const Column(
      children: [
        SizedBox(
          height: 103,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Forget password?',
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

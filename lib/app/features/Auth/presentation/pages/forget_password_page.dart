import 'package:flutter/material.dart';
import 'package:rukn_store/app/features/Auth/presentation/widgets/input_field_widget.dart';
import 'package:go_router/go_router.dart';

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
                    onTap: () {
                      context.go('/Login');
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/SVGs/back_arrow.png"),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          boxShadow: [BoxShadow()]),
                    ),
                  )),
              _buildTitle(),
              const Text(
                  textAlign: TextAlign.end,
                  'ادخل عنوان البريد الالكتروني المرتبط بحسابك الشخصي وسوف نرسل ايميل اعاده ضبط كلمه السر'),
              InputFieldWidget(
                  icon: Icons.email_outlined,
                  hintText: 'قم بادخال ايميلك الشخصي هنا')
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
          alignment: Alignment.centerRight,
          child: Text(
            textAlign: TextAlign.end,
            'نسيت كلمة المرور؟',
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

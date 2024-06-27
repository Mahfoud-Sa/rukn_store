import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeButton extends StatelessWidget {
  final Function onTap;
  final String text;
  const WelcomeButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 193,
        height: 53,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: Colors.white.withOpacity(.5)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

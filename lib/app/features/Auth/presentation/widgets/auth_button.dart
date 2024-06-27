import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthButton extends StatelessWidget {
  final Function onTap;
  final String text;
  const AuthButton({
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
        width: 147,
        height: 51,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.black),
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

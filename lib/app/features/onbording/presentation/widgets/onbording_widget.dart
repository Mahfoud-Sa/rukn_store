import 'package:flutter/material.dart';

class OnbordingWidget extends StatelessWidget {
  final String path;
  const OnbordingWidget({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

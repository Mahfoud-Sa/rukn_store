import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SocialMediaButton extends StatelessWidget {
  final Function onTap;
  final String iconPath;
  const SocialMediaButton({
    super.key,
    required this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return
        //  IconButton(
        //     onPressed: onTap(),

        //     icon: SvgPicture.asset('assets/SVGs/$iconPath',
        //         height: 42, semanticsLabel: 'Acme Logo'));
        InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/SVGs/$iconPath"),
              fit: BoxFit.fill,
            ),
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: Colors.white),
      ),
    );
  }
}

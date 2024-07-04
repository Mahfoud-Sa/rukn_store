import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final icon;
  final clicked;
  final name;
  const CategoryWidget({
    super.key,
    this.icon,
    this.name,
    this.clicked = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: clicked ? Colors.black45 : Colors.black12,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              clicked
                  ? Icon(icon, color: Colors.white)
                  : Icon(
                      icon,
                      color: Colors.black,
                    ),
            ],
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}

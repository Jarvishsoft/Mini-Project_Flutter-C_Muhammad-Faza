import 'package:flutter/material.dart';

class ItemKategori extends StatelessWidget {
  const ItemKategori({
    super.key,
    required this.title,
    required this.icon,
    required this.width,
    required this.height,
  });

  final String title;
  final String icon;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(
                icon,
              ),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.30),
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 6,
                offset: Offset(2, 2),
                spreadRadius: 3,
                blurStyle: BlurStyle.inner,
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

//! add font assets
class BigText extends StatelessWidget {
  //*
  Color? color;
  final String text;
  double size; //? default
  TextOverflow overflow; //? default
  BigText({
    Key? key,
    this.color =
        const Color(0xFF89dad0), //! default color must as hex not use AppColors
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: "Roboto",
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

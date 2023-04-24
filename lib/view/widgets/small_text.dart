import 'package:flutter/material.dart';

//! add font assets
class SmallText extends StatelessWidget {
  //*
  Color? color;
  final String text;
  double size; //? default
  double height; //* default space between lines
  SmallText({
    Key? key,
    this.color =
        const Color(0xFF332d2b), //! default color must as hex not use AppColors
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontFamily: "Roboto",
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
        height: height, //* default space between lines
      ),
    );
  }
}
